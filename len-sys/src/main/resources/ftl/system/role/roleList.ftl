
<#--搜索-->
<div class="lenos-search">
    <div class="search-select">
        <@lenInclude path="/system/base/queryBox.ftl" name="角色名" id="rolename" ></@lenInclude>
        <@lenInclude path="/system/base/queryBox.ftl" name="描述" id="remark" ></@lenInclude>
    </div>
</div>

<#--按钮-->
<div class="layui-col-md12 len-button">
    <div class="layui-btn-group role-bar">
        <#include "/system/base/searth.ftl">
        <@lenInclude path="/system/base/btn.ftl" hasPermission="role:add"
        type="add" name="新增" icon="&#xe608;"></@lenInclude>
        <@lenInclude path="/system/base/btn.ftl"
        type="update" name="编辑" icon="&#xe642;"></@lenInclude>
        <@lenInclude path="/system/base/btn.ftl" hasPermission="role:select"
        type="detail" name="查看" icon="&#xe605;"></@lenInclude>
    </div>
</div>

<#--按钮-->
<table id="roleList" width="100%" lay-filter="user"></table>

<#--toobar-->
<script type="text/html" id="toolBar">
    <@lenInclude  path="/system/base/bar.ftl" hasPermission="role:add"   name="查看" event="detail"/>
    <@lenInclude  path="/system/base/bar.ftl" hasPermission="user:update" code="edit"   name="编辑" event="edit"/>
    <@lenInclude  path="/system/base/bar.ftl" hasPermission="user:del"  code="del"  name="删除" event="del"/>
</script>

<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            id: 'roleList',
            elem: '#roleList'
            , url: 'role/showRoleList'
            , parseData: function (res) {
                return {
                    "code": res.code,
                    "msg": res.msg,
                    "count": res.count,
                    "data": res.data
                };
            }, cols: [[
                {checkbox: true, fixed: true, width: '5%'},
                {field: 'roleName', title: '角色名称', width: '20%', sort: true},
                {field: 'remark', title: '角色描述', width: '20%', sort: true},
                {
                    title: '创建时间',
                    width: '20%',
                    templet: '<div>{{ moment(+d.createDate).format(\'YYYY-MM-DD\')  }}</div>'
                }, {field: 'remark', title: '操作', width: '20%', toolbar: "#toolBar"}
            ]], page: true, height: 'full-100'
        });

        var $ = layui.$, active = {
            //查询
            select: function () {
                var rolename = $('#rolename').val();
                var remark = $('#remark').val();
                table.reload('roleList', {
                    where: {
                        roleName: rolename || null,
                        remark: remark || null
                    }
                });
            },
            //重置
            reload: function () {
                $('#rolename').val('');
                $('#remark').val('');
                table.reload('roleList', {
                    where: {
                        roleName: null,
                        remark: null
                    }
                });
            },
            //新增
            add: function () {
                Len.add('/role/showAddRole', '添加角色');
            },
            //更新
            update: function () {
                var data = table.checkStatus('roleList').data;
                Len.onlyOne(data.length) ? Len.update('/role/updateRole?id=' + data[0].id, '编辑角色') : false;
            },
            //详情
            detail: function () {
                var data = table.checkStatus('roleList').data;
                Len.onlyOne(data.length) ? Len.detail('/role/updateRole?id=' + data[0].id, '查看角色信息') : false;
            }
        };

        /**
         * 监听工具条
         */
        table.on('tool(user)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                Len.detail('/role/updateRole?id=' + data.id, '编辑角色');
            } else if (obj.event === 'del') {
                Len.delete('role/del', data.id, '', 'roleList');
            } else if (obj.event === 'edit') {
                Len.update('/role/updateRole?id=' + data.id, '编辑角色');
            }
        });
        Len.btnBind($('.role-bar .layui-btn'), active);
        Len.keydown(active);
    });
</script>
