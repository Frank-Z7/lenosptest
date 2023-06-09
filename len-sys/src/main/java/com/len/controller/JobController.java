package com.len.controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.len.base.BaseController;
import com.len.core.annotation.Log;
import com.len.core.annotation.Log.LOG_TYPE;
import com.len.core.quartz.JobTask;
import com.len.entity.SysJob;
import com.len.exception.ServiceException;
import com.len.service.JobService;
import com.len.util.LenResponse;
import com.len.util.MsHelper;
import com.len.util.ReType;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 定时任务 controller
 */
@Controller
@RequestMapping("/job")
@Api(value = "定时任务", tags = "定时任务")
public class JobController extends BaseController {

    private final JobService jobService;

    private final JobTask jobTask;

    public JobController(JobService jobService, JobTask jobTask) {
        this.jobService = jobService;
        this.jobTask = jobTask;
    }

    /**
     * 跳转到 任务列表
     * 
     * @return path
     */
    @GetMapping(value = "showJob")
    @RequiresPermissions("job:show")
    public String showUser() {
        return "/system/job/jobList";
    }

    /**
     * 任务列表
     * 
     * @param job 条件
     * @param page page
     * @param limit limit
     * @return job list
     */
    @GetMapping(value = "showJobList")
    @ResponseBody
    @RequiresPermissions("job:show")
    public ReType showUser(SysJob job, int page, int limit) {
        return jobService.show(job, page, limit);
    }

    @GetMapping(value = "showAddJob")
    public String addJob() {
        return "/system/job/add";
    }

    @ApiOperation(value = "/addJob", httpMethod = "POST", notes = "添加任务类")
    @Log(desc = "添加任务")
    @PostMapping(value = "addJob")
    @ResponseBody
    public LenResponse addJob(SysJob job) {
        job.setStatus(false);
        jobService.save(job);
        return succ(MsHelper.getMsg("insert.success"));
    }

    @GetMapping(value = "updateJob")
    public String updateJob(String id, Model model, boolean detail) {
        if (StringUtils.isNotEmpty(id)) {
            SysJob job = jobService.getById(id);
            model.addAttribute("job", job);
        }
        model.addAttribute("detail", detail);
        return "system/job/update";
    }

    @ApiOperation(value = "/updateJob", httpMethod = "POST", notes = "更新任务")
    @Log(desc = "更新任务", type = LOG_TYPE.UPDATE)
    @PostMapping(value = "updateJob")
    @ResponseBody
    public LenResponse updateJob(SysJob job) {
        if (jobTask.checkJob(job)) {
            throw new ServiceException(MsHelper.getMsg("job.started"));
        }
        jobService.updateJob(job);
        return succ(MsHelper.getMsg("update.success"));

    }

    @Log(desc = "删除任务", type = LOG_TYPE.DEL)
    @ApiOperation(value = "/del", httpMethod = "POST", notes = "删除任务")
    @PostMapping(value = "del")
    @ResponseBody
    @RequiresPermissions("job:del")
    public LenResponse del(String id) {
        jobService.del(id);
        return succ(MsHelper.getMsg("del.success"));
    }

    @Log(desc = "启动任务")
    @PostMapping(value = "startJob")
    @ResponseBody
    @RequiresPermissions("job:start")
    public LenResponse startJob(String id) {
        jobService.startJob(id);
        return succ("job.start");
    }

    @Log(desc = "停止任务")
    @PostMapping(value = "endJob")
    @ResponseBody
    @RequiresPermissions("job:end")
    public LenResponse endJob(String id) {
        jobService.stopJob(id);
        return succ(MsHelper.getMsg("job.stop"));
    }

}
