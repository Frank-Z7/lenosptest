<#include "/system/base/formHead.ftl">

<body>
<div class="x-body">
    <form class="layui-form layui-form-pane" style="margin-left: 20px;">
        <input name="userId" value="${user.id}" hidden>
        <div style="width:100%;height:300px;overflow: auto;">
            <div class="layui-form-item">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
                    <legend style="font-size:16px;">修改账户：${user.username}</legend>
                </fieldset>
            </div>
            <div class="layui-form-item">
                <label for="newPass" class="layui-form-label">
                    <span class="x-red">*</span>新密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="newPass" name="newPwd" lay-verify="newPass" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="reNewPass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="reNewPass" name="reNewPass" lay-verify="reNewPass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div style="height: 60px"></div>
        </div>
        <div style="width: 100%;height: 55px;background-color: white;border-top:1px solid #e6e6e6;
  position: fixed;bottom: 1px;margin-left:-20px;">
            <div class="layui-form-item" style=" float: right;margin-right: 30px;margin-top: 8px">

                <button type="submit" name="save" class="layui-btn layui-btn-normal" lay-filter="add" lay-submit="">
                    修改
                </button>
                <button type="button" class="layui-btn layui-btn-primary" id="close">
                    取消
                </button>
            </div>
        </div>
    </form>
</div>


<script>
	$(document).ready(function () {
		$('#close').click(function () {
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		});
	});
	layui.use(['form', 'layer'], function () {
		$ = layui.jquery;
		var form = layui.form
			, layer = layui.layer;
		//自定义验证规则
		form.verify({
			newPass: [/(.+){6,12}$/, '密码必须6到12位']
			, reNewPass: function (value) {
				if ($('#newPass').val() !== $('#reNewPass').val()) {
					return '两次密码不一致';
				}
			}
		});

		//监听提交
		form.on('submit(add)', function (data) {
			$.ajax({
				url: 'rePass',
				type: 'post',
				data: data.field,
				async: false,
				dataType: "json",
				traditional: true,
				success: function (json) {
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
					window.parent.layui.table.reload('userList');
					window.top.layer.msg(
						json.msg,
						{icon: 6, offset: 'rb', area: ['120px', '80px'], anim: 2}
					);
				}, error: function () {
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
					window.top.layer.msg(
						'请求失败',
						{icon: 5, offset: 'rb', area: ['120px', '80px'], anim: 2}
					);
				}
			});
			return false;
		});
		form.render();
	});
</script>
</body>
