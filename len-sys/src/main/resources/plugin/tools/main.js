/**by zxm lenospmiller@gmail.com*/
/**
 * 统一处理js方法
 */
/**框架*/
var message, table;
window.cLayuiTable = {};
layui.config({
    base: 'plugin/build/js/',
    version: '1.0.1'
}).use(['tab', 'app', 'message', 'dashboard'], function () {

    var app = layui.app,
        $ = layui.jquery,
        dashboard = layui.dashboard;
    //将message设置为全局以便子页面调用
    message = layui.message;
    //主入口
    app.set({
        type: 'page'
    }).init();

    $('dl.skin > dd').on('click', function () {
        var $that = $(this);
        var skin = $that.children('a').data('skin');
        switchSkin(skin);
    });

    var setSkin = function (value) {
            layui.data('kit_skin', {
                key: 'skin',
                value: value
            });
        },
        getSkinName = function () {
            return layui.data('kit_skin').skin;
        },
        switchSkin = function (value) {
            var _target = $('link[kit-skin]')[0];
            _target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
            setSkin(value);
        },
        initSkin = function () {
            var skin = getSkinName();
            switchSkin(skin === undefined ? 'default' : skin);
        }();
    /**
     * 面板初始化
     */
    dashboard.init();
});

function getId() {
    return window.layId;
}