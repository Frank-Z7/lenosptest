/**
 * Copyright 2018 lenos
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 */
package com.len.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.rest.ActivitiService;
import org.activiti.rest.model.ActivitiProcess;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.len.base.BaseController;
import com.len.config.ActPropertiesConfig;
import com.len.entity.*;
import com.len.exception.LenException;
import com.len.service.ActAssigneeService;
import com.len.service.RoleService;
import com.len.service.RoleUserService;
import com.len.service.SysUserService;
import com.len.util.Base64Utils;
import com.len.util.Checkbox;
import com.len.util.LenResponse;
import com.len.util.ReType;

/**
 * @author zhuxiaomeng
 * @date 2018/1/13.
 * @email lenospmiller@gmail.com
 *        <p>
 *        流程管理 流程创建、发布 流程节点绑定角色/用户(绑定用户 开始ing)
 */
@Controller
@RequestMapping(value = "/act")
public class ActivitiController extends BaseController {

    @Autowired
    ActivitiService activitiService;
    @Autowired
    ActPropertiesConfig actPropertiesConfig;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private IdentityService identityService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleUserService roleUserService;
    @Autowired
    private ActAssigneeService actAssigneeService;

    /**
     * 同步用户 角色 用户角色到activiti表中
     */
    @PostMapping(value = "syncdata")
    @ResponseBody
    public LenResponse syncdata() {
        LenResponse j = new LenResponse();
        try {
            List<SysUser> userList = userService.list();
            User au;
            for (SysUser user : userList) {
                au = new UserEntity();
                au.setId(user.getId());
                // au.setFirstName(user.getRealName());
                au.setEmail(user.getEmail());
                identityService.deleteUser(au.getId());
                identityService.saveUser(au);
            }
            List<SysRole> sysRoleList = roleService.list();
            Group group;
            for (SysRole role : sysRoleList) {
                group = new GroupEntity();
                group.setId(role.getId());
                group.setName(role.getRoleName());
                identityService.deleteGroup(group.getId());
                identityService.saveGroup(group);
            }
            List<SysRoleUser> roleUserList = roleUserService.list();

            for (SysRoleUser sysRoleUser : roleUserList) {
                identityService.deleteMembership(sysRoleUser.getUserId(), sysRoleUser.getRoleId());
                identityService.createMembership(sysRoleUser.getUserId(), sysRoleUser.getRoleId());
            }
            j.setMsg("同步成功");
        } catch (LenException e) {
            j.setFlag(false);
            j.setMsg("同步失败");
            e.printStackTrace();
        }
        return j;
    }

    @GetMapping(value = "goActiviti")
    public String goActiviti() throws UnsupportedEncodingException {
        Model model = repositoryService.newModel();

        String name = "新建流程";
        String description = "";
        int revision = 1;
        String key = "processKey";

        ObjectNode modelNode = objectMapper.createObjectNode();
        modelNode.put(ModelDataJsonConstants.MODEL_NAME, name);
        modelNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
        modelNode.put(ModelDataJsonConstants.MODEL_REVISION, revision);

        model.setName(name);
        model.setKey(key);
        model.setMetaInfo(modelNode.toString());

        repositoryService.saveModel(model);
        String id = model.getId();

        // 完善ModelEditorSource
        JSONObject editor = new JSONObject();
        editor.put("id", "canvas");
        editor.put("resourceId", "canvas");
        JSONObject stencil = new JSONObject();
        stencil.put("namespace", "http://lenosp.cn#");
        editor.put("stencilset", stencil);
        repositoryService.addModelEditorSource(id, editor.toString().getBytes(StandardCharsets.UTF_8));
        return "redirect:/static/modeler.html?modelId=" + id;
    }

    @GetMapping("actUpdate/{id}")
    public String actUpdate(@PathVariable String id) {
        return "redirect:/static/modeler.html?modelId=" + id;
    }

    @GetMapping(value = "goAct")
    public String goAct(org.springframework.ui.Model model) {
        return "/actList";
    }

    /**
     * 部署列表
     */
    @GetMapping(value = "showAct")
    @ResponseBody
    public ReType showAct(org.springframework.ui.Model model, ProcessDefinition definition, String page, String limit) {
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        List<org.activiti.engine.repository.ProcessDefinition> processDefinitionList = null;
        if (definition != null) {
            if (!StringUtils.isEmpty(definition.getDeploymentId())) {
                processDefinitionQuery.deploymentId(definition.getDeploymentId());
            }
            if (!StringUtils.isEmpty(definition.getName())) {
                processDefinitionQuery.processDefinitionNameLike("%" + definition.getName() + "%");

            }
        }
        processDefinitionList = processDefinitionQuery.listPage(Integer.valueOf(limit) * (Integer.valueOf(page) - 1),
            Integer.valueOf(limit));
        long count = repositoryService.createProcessDefinitionQuery().count();
        // long count = repositoryService.createDeploymentQuery().count();
        List<ProcessDefinition> list = new ArrayList<>();
        processDefinitionList.forEach(processDefinition -> list.add(new ProcessDefinition(processDefinition)));
        return new ReType(count, list);
    }

    @GetMapping(value = "goActModel")
    public String goActModel(org.springframework.ui.Model model) {
        return "/actModelList";
    }

    /**
     * 模型列表
     */
    @GetMapping(value = "showAm")
    @ResponseBody
    public ReType showModel(org.springframework.ui.Model model, ActModel actModel, String page, String limit) {
        ModelQuery modelQuery = repositoryService.createModelQuery();
        if (actModel != null) {
            if (!StringUtils.isEmpty(actModel.getKey())) {
                modelQuery.modelKey(actModel.getKey());
            }
            if (!StringUtils.isEmpty(actModel.getName())) {
                modelQuery.modelNameLike("%" + actModel.getName() + "%");
            }
        }
        List<Model> models =
            modelQuery.listPage(Integer.valueOf(limit) * (Integer.valueOf(page) - 1), Integer.valueOf(limit));
        long count = repositoryService.createModelQuery().count();
        List<ActModel> list = new ArrayList<>();
        models.forEach(mo -> list.add(new ActModel(mo)));
        return new ReType(count, list);
    }

    /**
     * 发布流程
     */
    @PostMapping(value = "open")
    @ResponseBody
    public LenResponse open(String id) {
        String msg = "发布成功";
        LenResponse j = new LenResponse();
        try {
            Model modelData = repositoryService.getModel(id);
            byte[] bytes = repositoryService.getModelEditorSource(modelData.getId());

            if (bytes == null) {
                return LenResponse.error("模型为空");
            }
            JsonNode modelNode = null;
            modelNode = new ObjectMapper().readTree(bytes);
            BpmnModel model = new BpmnJsonConverter().convertToBpmnModel(modelNode);
            if (model.getProcesses().size() == 0) {
                return LenResponse.error("数据不符合要求");
            }
            byte[] bpmnBytes = new BpmnXMLConverter().convertToXML(model);
            // 发布流程
            String processName = modelData.getName() + ".bpmn20.xml";
            String convertToXML = new String(bpmnBytes);

            System.out.println(convertToXML);
            Deployment deployment = repositoryService.createDeployment().name(modelData.getName())
                .addString(processName, new String(bpmnBytes, "UTF-8")).deploy();
            modelData.setDeploymentId(deployment.getId());
            repositoryService.saveModel(modelData);
        } catch (LenException e) {
            msg = "发布数失败";
            j.setFlag(false);
        } catch (IOException e) {
            e.printStackTrace();
        }
        j.setMsg(msg);
        return j;
    }

    /**
     * 根据流程部署id获取节点并且传到前端
     *
     * @param deploymentId 部署id
     * @param model
     * @return
     */
    @GetMapping("goAssignee/{deploymentId}")
    public String goAssignee(@PathVariable("deploymentId") String deploymentId, org.springframework.ui.Model model) {
        /** 根据流程实例id查询出所有流程节点 */
        List<ActivityImpl> activityList = actAssigneeService.getActivityList(deploymentId);
        /** 角色和节点关系封装成list */
        List<SysRole> roleList = roleService.list();
        Checkbox checkbox = null;
        Map<String, Object> map = null;
        List<Map<String, Object>> mapList = new ArrayList<>();
        List<ActAssignee> assigneeList = null;
        List<Checkbox> checkboxList = null;
        for (ActivityImpl activiti : activityList) {
            map = new HashMap<>();
            String name = (String)activiti.getProperty("name");
            if (StringUtils.isEmpty(name) || "start".equals(name) || "end".equals(name)) {
                continue;
            }
            // 节点id 、name、节点目前关联的角色 封装成进map
            String nodeId = activiti.getId();
            assigneeList = actAssigneeService.list(new QueryWrapper<>(new ActAssignee(nodeId)));
            List<String> strings = new ArrayList<>();
            assigneeList.forEach(actAssignee1 -> strings.add(actAssignee1.getRoleId()));
            map.put("id", nodeId);
            map.put("name", name);
            checkboxList = new ArrayList<>();
            for (SysRole role : roleList) {
                checkbox = new Checkbox();
                checkbox.setId(role.getId());
                checkbox.setName(role.getRoleName());
                if (strings.contains(role.getId())) {
                    checkbox.setCheck(true);
                }
                checkboxList.add(checkbox);
            }
            map.put("boxJson", checkboxList);
            mapList.add(map);
        }
        model.addAttribute("actList", mapList);

        return "act/deploy/act-node";
    }

    /**
     * 节点更新配置办理者(人/组)
     *
     * @param request
     * @return
     */
    @PostMapping("goAssignee/updateNode")
    @ResponseBody
    public LenResponse updateNode(HttpServletRequest request) {
        LenResponse j = new LenResponse();

        Map<String, String[]> map = request.getParameterMap();
        List<ActAssignee> assigneeList = new ArrayList<>();
        ActAssignee assignee = null;
        for (Map.Entry<String, String[]> entry : map.entrySet()) {
            assignee = new ActAssignee();
            int sub = entry.getKey().lastIndexOf("_");
            String nodeId = entry.getKey().substring(0, sub);
            nodeId = nodeId.substring(nodeId.lastIndexOf("_") + 1, nodeId.length());
            String nodeName = entry.getKey().substring(entry.getKey().lastIndexOf("_") + 1, entry.getKey().length());
            // 更新进list
            assignee.setAssigneeType(3);
            assignee.setRoleId(entry.getValue()[0]);
            assignee.setSid(nodeId);
            assignee.setActivtiName(nodeName);
            // 先清除
            actAssigneeService.deleteByNodeId(nodeId);
            assigneeList.add(assignee);
        }
        // 后添加 在map循环里添加 多角色会导致添加了的再次被删除 so 要拿出来
        for (ActAssignee actAssignee : assigneeList) {
            actAssigneeService.save(actAssignee);
        }
        j.setMsg("更新成功");
        return j;
    }

    /**
     * 删除流程定义 级联 删除 流程节点绑定信息
     *
     * @param model
     * @param id
     * @return
     */
    @PostMapping("delDeploy")
    @ResponseBody
    public LenResponse delDeploy(org.springframework.ui.Model model, String id) {
        LenResponse j = new LenResponse();
        try {
            List<ActivityImpl> activityList = actAssigneeService.getActivityList(id);
            for (ActivityImpl activity : activityList) {
                String nodeId = activity.getId();
                if (StringUtils.isEmpty(nodeId) || "start".equals(nodeId) || "end".equals(nodeId)) {
                    continue;
                }
                /** 接触节点和代办关联 */
                actAssigneeService.deleteByNodeId(nodeId);
            }
            repositoryService.deleteDeployment(id, true);
            j.setMsg("删除成功");
        } catch (LenException e) {
            j.setMsg("删除失败");
            j.setFlag(false);
            e.printStackTrace();
        }
        return j;
    }

    @GetMapping("shinePics/{processInstanceId}")
    public String shinePics(org.springframework.ui.Model model, @PathVariable String processInstanceId) {
        model.addAttribute("processInstanceId", processInstanceId);
        return "/act/activiti/shinePics";
    }

    @GetMapping("getShineProcImage")
    @ResponseBody
    public JSONObject getShineProcImage(HttpServletRequest request, HttpServletResponse resp, String processInstanceId)
        throws IOException {
        JSONObject result = new JSONObject();
        JSONArray shineProImages = new JSONArray();
        InputStream imageStream = activitiService.generateStream(processInstanceId, true);
        if (imageStream != null) {
            String imageCurrentNode = Base64Utils.ioToBase64(imageStream);
            if (StringUtils.isNotBlank(imageCurrentNode)) {
                shineProImages.add(imageCurrentNode);
            }
        }
        InputStream imageNoCurrentStream = activitiService.generateStream(processInstanceId, false);
        if (imageNoCurrentStream != null) {
            String imageNoCurrentNode = Base64Utils.ioToBase64(imageNoCurrentStream);
            if (StringUtils.isNotBlank(imageNoCurrentNode)) {
                shineProImages.add(imageNoCurrentNode);
            }
        }

        List<ActivitiProcess> taskSqu = activitiService.getTaskSqu(processInstanceId);

        result.put("id", UUID.randomUUID().toString());
        result.put("errorNo", 0);
        result.put("images", shineProImages);
        result.put("taskSqu", taskSqu);
        return result;
    }

    @PostMapping("delModel")
    @ResponseBody
    public LenResponse delModel(String id) {
        String modelId = actPropertiesConfig.getModelId();
        if (id.equals(modelId)) {
            return LenResponse.error("演示禁止删除");
        }
        LenResponse j = new LenResponse();
        try {
            repositoryService.deleteModel(id);
            j.setMsg("删除成功");
        } catch (LenException e) {
            j.setMsg("删除失败");
            j.setFlag(false);
            e.printStackTrace();
        }
        return j;
    }

}
