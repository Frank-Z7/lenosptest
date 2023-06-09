<#--公共文件-->

<#--搜索-->
<div class="lenos-search">
    <div class="search-select">
        <@lenInclude path="/system/base/queryBox.ftl" name="菜单名称" id="name" ></@lenInclude>
    </div>
</div>
<hr class="layui-bg-gray">

<#--按钮-->
<div class="layui-btn-container len-button">
    <div class="layui-btn-group menu-bar">
        <#include "/system/base/searth.ftl">
        <@lenInclude path="/system/base/btn.ftl" type="add" name="新增" icon="&#xe608;"></@lenInclude>
    </div>
</div>

<#--表格-->
<table id="treeList" width="100%"></table>


<!-- 表格操作 -->
<script type="text/html" id="tbBar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script type="text/javascript">

    /**
     * 载treetable 模块
     */
    layui.config({
        base: '${re.contextPath}/plugin/layui/modules/'
    }).extend({
        treeTable: 'treeTable'
    });


    layui.use(['treeTable'], function () {
        var $ = layui.jquery;
        var treeTable = layui.treeTable;

        // 渲染表格
        var table = treeTable.render({
            elem: '#treeList',
            url: 'menu/showMenuList',
            tree: {
                iconIndex: 2,
                isPidData: true,
                idName: 'id',
                pidName: 'pid'
            },
            cols: [[
                {type: 'numbers'},
                {type: 'checkbox'},
                {field: 'name', title: '菜单名称', minWidth: 165},
                {
                    title: '图标',
                    templet: function (d) {
                        if (typeof (d.icon) != "undefined") {
                            return '<i class="layui-icon">' + d.icon + '</i>';
                        }
                    },
                },
                {title: '类型', templet: '<p>{{d.menuType=="1"?"按钮":"菜单"}}</p>', align: 'center', width: 60},
                {field: 'url', title: '菜单地址'},
                {field: 'permission', title: '权限标识'},
                // {title: '创建时间', templet: '<div>{{ moment(+d.createDate).format(\'yyyy-MM-dd\') }}</div>'},
                {align: 'center', toolbar: '#tbBar', title: '操作', width: 120}
            ]],
            style: 'margin-top:0;'
        });
        var active = {

            /*查询*/
            select: function () {
                table.reload({
                    where: {
                        name: $('#name').val(),
                    }
                });
            },
            /*重置*/
            reload: function () {
                $('#name').val('');
                table.reload({
                    where: {
                        name: '',
                    }
                });
            },

            /*添加*/
            add: function () {
                Len.add('menu/showAddMenu', '', 'menu');
            },
        };

        treeTable.on('tool(treeList)', function (obj) {
            var event = obj.event, data = obj.data;
            switch (event) {
                case "edit":
                    Len.update('menu/showUpdateMenu?id=' + data.id);
                    break;
                case "del":
                    Len.delete('menu/del', data.id, function () {
                        Len.rbSuccess("删除成功");
                        active.reload();
                    });
                    break;
            }
        });

        Len.btnBind($('.menu-bar .layui-btn'), active);
        Len.keydown(active);
    });
</script>
