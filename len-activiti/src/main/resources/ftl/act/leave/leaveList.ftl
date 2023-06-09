<#include "/system/base/head.ftl">
<body>

<#--搜索区域-->


<#--按钮-->
<div class="layui-col-md12 len-button">
    <div class="layui-btn-group">
        <#include "/system/base/searth.ftl">

        <button class="layui-btn layui-btn-normal layui-btn-sm" data-type="createLeave">
            <i class="layui-icon">&#xe640;</i>新建请假
        </button>
    </div>
</div>

<#--表格-->
<table id="leaveList" width="100%" lay-filter="leave"></table>


<#--表格toolbar-->
<script type="text/html" id="toolBar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="getProcImage">
        <i class="layui-icon">&#xe640;</i>查看流程图</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="leaveDetail">
        <i class="layui-icon">&#xe640;</i>查看详情</a>
</script>


<script type="text/html" id="status">
    {{#if(typeof(d.taskName)!='undefined'){}}
    <div>${d.taskName}</div>
    {{# }else{}}
    结束
    {{# }}}
</script>


<script src="${re.contextPath}/plugin/activiti.js"></script>
<script>
    layui.laytpl.toDateString = function (d, format) {
        var date = new Date(d || new Date())
            , ymd = [
            this.digit(date.getFullYear(), 4)
            , this.digit(date.getMonth() + 1)
            , this.digit(date.getDate())
        ]
            , hms = [
            this.digit(date.getHours())
            , this.digit(date.getMinutes())
            , this.digit(date.getSeconds())
        ];

        format = format || 'yyyy-MM-dd HH:mm:ss';

        return format.replace(/yyyy/g, ymd[0])
            .replace(/MM/g, ymd[1])
            .replace(/dd/g, ymd[2])
            .replace(/HH/g, hms[0])
            .replace(/mm/g, hms[1])
            .replace(/ss/g, hms[2]);
    };

    //数字前置补零
    layui.laytpl.digit = function (num, length, end) {
        var str = '';
        num = String(num);
        length = length || 2;
        for (var i = num.length; i < length; i++) {
            str += '0';
        }
        return num < Math.pow(10, length) ? str + (num | 0) : num;
    };

    document.onkeydown = function (e) { // 回车提交表单
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
            $(".select .select-on").click();
        }
    }

    layui.use('table', function () {
        var table = layui.table;
        //方法级渲染
        table.render({
            id: 'leaveList',
            elem: '#leaveList'
            , url: 'leave/showLeaveList'
            , parseData: function (res) {
                return {
                    "code": res.code,
                    "msg": res.msg,
                    "count": res.count,
                    "data": res.data
                };
            }
            , cols: [[
                {checkbox: true, fixed: true, width: '5%'}
                , {field: 'userName', title: '申请人', width: '10%', sort: true}
                , {
                    field: 'beginTime',
                    title: '开始时间',
                    width: '10%',
                    sort: true,
                    templet: '<div>{{ layui.laytpl.toDateString(d.beginTime,"yyyy-MM-dd") }}</div>'
                }
                , {
                    field: 'endTime',
                    title: '结束时间',
                    width: '10%',
                    sort: true,
                    templet: '<div>{{ layui.laytpl.toDateString(d.endTime,"yyyy-MM-dd") }}</div>'
                }
                , {field: 'taskName', title: '状态', width: '10%', templet: '#status'}
                , {field: 'reason', title: '原因', width: '10%', sort: true}
                , {field: 'days', title: '天数', width: '10%', sort: true}
                , {field: 'processInstanceId', title: '流程定义id', width: '10%', sort: true}
                , {field: 'text', title: '操作', width: '20%', toolbar: '#toolBar'}

            ]]
            , page: true
            , height: 'full-100'
        });

        var $ = layui.$, active = {
            select: function () {
                var beginTime = $('#beginTime').val();
                var endTime = $('#endTime').val();
                table.reload('leaveList', {
                    where: {
                        beginTime: beginTime,
                        endTime: endTime
                    }
                });
            }
            , createLeave: function () {
                add("申请请假", '/leave/addLeave', 700, 450);
            }
            , reload: function () {
                $('#beginTime').val('');
                $('#endTime').val('');
                table.reload('leaveList', {
                    where: {
                        beginTime: null,
                        endTime: null
                    }
                });
            }
        };
        //监听工具条
        table.on('tool(leave)', function (obj) {
            var data = obj.data;
            if (obj.event === 'start') {
                start(data.key);
            } else if (obj.event === 'getProcImage') {
                activiti.img(data.processInstanceId);
            } else if (obj.event === 'leaveDetail') {
                window.top.layer.open({
                    id: 'leave-detail',
                    type: 2,
                    area: ['880px', '400px'],
                    fix: false,
                    maxmin: true,
                    shadeClose: false,
                    shade: 0.4,
                    title: '审核详情',
                    content: "/leave/leaveDetail?processId=" + data.processInstanceId
                });
            }
        });
        Len.eleClick(active, '.len-form-item .layui-btn,.layui-col-md12 .layui-btn');
    });

    function add(title, url, w, h) {
        window.top.layer.open({
            id: 'leave-add',
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false,
            maxmin: true,
            shadeClose: false,
            shade: 0.4,
            title: title,
            content: url
        });
    }

</script>
</body>
