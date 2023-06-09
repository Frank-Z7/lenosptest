/*通用js方法封装*/

var Len = {

    /**
     * 添加
     * @param url 必填
     * @param title
     * @param id
     */
    add: function (url, title, id) {
        var w = $(window).width() * 0.7,
            h = $(window).width() * 0.4;
        this.popup(url, this.isEmpty(title) ? '添加' : title, w, h, id)
    },

    /**
     * 更新
     * @param url 必填
     * @param title
     * @param id
     */
    update: function (url, title, id) {
        this.popup(url, this.isEmpty(title) ? '修改' : title, 700, 450, id)
    },

    /**
     * 详情
     * @param url 必填
     * @param title
     * @param id
     */
    detail: function (url, title, id) {
        this.popup(url + '&detail=true', this.isEmpty(title) ? '详情' : title, 700, 450, id)
    },

    /**
     * 根据id删除
     * @param url 必填
     * @param id 必填
     * @param callback 必填
     * @param tableId 刷新界面的tableid
     * @param name
     */
    delete: function (url, id, callback, tableId, name) {
        var extendTitle = Len.isEmpty(name) ? '' : '[<label style="color: #00AA91;">' + name + '</label>]';
        layer.confirm('确定删除' + extendTitle + '?', function () {
            if (Len.isFunction(callback)) {
                Len.ajaxPost(url, {id: id}, callback).then(function(res) {
                    // 处理成功回调
                    // 可以根据res的返回结果进行相应处理
                    Len.rbSuccess("删除成功");
                    if (!Len.isEmpty(tableId)) {
                        layui.table.reload(tableId);
                    }
                }).catch(function(error) {
                    Len.rbError("删除失败：" + error.message,true);
                });
            } else {
                Len.ajaxPost(url, {id: id}).then(function (res) {
                    Len.rbSuccess("删除成功");
                    if (!Len.isEmpty(tableId)) {
                        layui.table.reload(tableId);
                    }
                });
            }
        });
    },

    /**
     * 中心弹框 成功提示
     * @param msg
     * @param isTop 顶层弹框
     */
    success: function (msg, isTop) {
        if (isTop) {
            window.top.layer.msg(msg, {icon: 6});
        } else {
            layer.msg(msg, {icon: 6});
        }
    },

    /**
     * 中心弹框 错误提示
     * @param msg
     * @param isTop 顶层弹框
     */
    error: function (msg, isTop) {
        if (isTop) {
            window.top.layer.msg(msg, {icon: 5});
        } else {
            layer.msg(msg, {icon: 5});
        }
    },

    /**
     * 中心弹框 警告提示
     * @param msg
     * @param isTop 顶层弹框
     */
    warn: function (msg, isTop) {
        if (isTop) {
            window.top.layer.msg(msg, {icon: 4});
        } else {
            layer.msg(msg, {icon: 4});
        }
    },

    /**
     * 右下角弹框 成功提示
     * @param msg
     * @param isTop 顶层弹框
     */
    rbSuccess: function (msg, isTop) {
        if (isTop) {
            window.top.layer.msg(msg, {icon: 6, offset: 'rb', area: ['120px', '80px'], anim: 2});
        } else {
            layer.msg(msg, {icon: 6, offset: 'rb', area: ['120px', '80px'], anim: 2});
        }
    },

    /**
     * 右下角错误提示
     * @param msg
     * @param isTop 顶层弹框
     */
    rbError: function (msg, isTop) {
        if (isTop) {
            window.top.layer.msg(msg, {icon: 5, offset: 'rb', area: ['120px', '80px'], anim: 2});
        } else {
            layer.msg(msg, {icon: 5, offset: 'rb', area: ['120px', '80px'], anim: 2});
        }
    },

    /**
     * 右下角异常提示
     * @param msg
     * @param isTop 顶层弹框
     */
    rbWarn: function (msg, isTop) {
        if (isTop) {
            window.top.layer.msg(msg, {icon: 4, offset: 'rb', area: ['120px', '80px'], anim: 2});
        } else {
            layer.msg(msg, {icon: 4, offset: 'rb', area: ['120px', '80px'], anim: 2});
        }
    },

    /**
     * 关闭弹框
     */
    close: function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    },

    screen: function () {
        //获取当前窗口的宽度
        var width = $(window).width();
        if (width > 1200) {
            return 3;   //大屏幕
        } else if (width > 992) {
            return 2;   //中屏幕
        } else if (width > 768) {
            return 1;   //小屏幕
        } else {
            return 0;   //超小屏幕
        }
    },

    /**
     * 通用弹框
     * @param url 请求url
     * @param title 弹框标题
     * @param w 宽
     * @param h 高
     * @param id
     */
    popup: function (url, title, w, h, id) {
        title = Len.isEmpty(title) ? false : title;
        url = Len.isEmpty(url) ? "error/404" : url;
        /**
         * iframe 自适应高度
         * @param layerObj
         */

        var iframeAutoHeight = function (layerObj) {
            var iframe = $(layerObj).find('iframe');
            var titleHeight = $(layerObj).find('.layui-layer-title').height();
            iframe.css('height', layerObj.outerHeight() - titleHeight);
        }

        window.top.layer.open({
            id: id,
            type: 2,
            area: this.screen() < 2 ? ['90%', '80%'] : ['700px', '450px'],
            fix: false,
            maxmin: true,
            shadeClose: false,
            shade: 0.4,
            title: title,
            content: url,
            full: function (res) {
                iframeAutoHeight(res);
            },
            min: function (res) {
                iframeAutoHeight(res);
            },
            restore: function (res) {
                iframeAutoHeight(res);
            },
        });
    },

    /**
     * 更新
     * @param url 更新url
     * @param data 数据
     * @param tableId 要刷新的表格id
     */
    layerAjax: function (url, data, tableId) {
        $.ajax({
            url: url,
            type: 'post',
            data: data,
            traditional: true,
            success: function (d) {
                parent.layer.close(parent.layer.getFrameIndex(window.name));
                parent.layui.table.reload(tableId);
                var msg = d.msg;
                if (Len.isEmpty(d.msg)) {
                    msg = "成功";
                }
                window.top.layer.msg(msg, {icon: 6, offset: 'rb', area: ['200px', '80px'], anim: 2});
            }, error: function (e) {
                layer.alert("error", {icon: 6}, function () {
                    parent.layer.close(parent.layer.getFrameIndex(window.name));
                });
            }
        });
    },

    eleClick: function (active, ele) {
        $(ele).on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    },

    /**
     * 通用post
     * @param url
     * @param data
     */
    ajaxPost: function (url, data) {
        return new Promise(function (resolve, reject) {
            $.ajax({
                url: url,
                type: "post",
                data: data,
                success: function (res) {
                    resolve(res);
                },
                error: function (error) {
                    reject(error);
                }
            });
        });
    },

    /**
     * 回车
     * @param active
     */
    keydown: function (active) {
        document.onkeydown = function (e) {
            var theEvent = window.event || e;
            var code = theEvent.keyCode || theEvent.which;
            if (code === 13) {
                active.select();
            }
        }
    },
    /**
     * 按钮事件绑定
     * @param _this 绑定对象
     * @param active
     */
    btnBind: function (_this, active) {
        //$('.len-form-item .layui-btn,.layui-btn-group .layui-btn,.lenos-search .search-zoom div')
        _this.on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    },

    /**
     * 表单绑定 回车搜索和按钮事件
     * @param _this
     * @param active
     */
    formBind: function (_this, active) {
        Len.keydown(active);
        Len.btnBind(_this, active);
    },

    /**
     * 空 返回true
     * @param value 值
     * @param allowEmptyString 是否允许空字符串
     * @returns {boolean|arg is Array<any>}
     */
    isEmpty: function (value, allowEmptyString) {
        return (value == null) || (!allowEmptyString ? value === '' : false) || (Len.isArray(value) && value.length === 0);
    },
    /**
     * array类型 返回true
     */
    isArray: ('isArray' in Array) ? Array.isArray : function (value) {
        return toString.call(value) === '[object Array]';
    },
    /**
     * 时间类型 返回true
     * @param value
     * @returns {boolean}
     */
    isDate: function (value) {
        return toString.call(value) === '[object Date]';
    },
    /**
     *
     * @param value
     * @returns {boolean}
     */
    isMSDate: function (value) {
        if (!Len.isString(value)) {
            return false;
        }
        return /^\\?\/Date\(([-+])?(\d+)(?:[+-]\d{4})?\)\\?\/$/.test(value);
    },
    /**
     * object对象 返回true
     */
    isObject: (toString.call(null) === '[object Object]') ? function (value) {
        // check ownerDocument here as well to exclude DOM nodes
        return value !== null && value !== undefined && toString.call(value) === '[object Object]' && value.ownerDocument === undefined;
    } : function (value) {
        return toString.call(value) === '[object Object]';
    },
    /**
     * js原始值 返回true
     * @param value
     * @returns {boolean}
     */
    isPrimitive: function (value) {
        var type = typeof value;
        return type === 'string' || type === 'number' || type === 'boolean';
    },
    /**
     * js function 返回true
     */
    isFunction: // Safari 3.x and 4.x returns 'function' for typeof <NodeList>, hence we need to fall back to using
    // Object.prototype.toString (slower)
        (typeof document !== 'undefined' && typeof document.getElementsByTagName('body') === 'function') ? function (value) {
            return !!value && toString.call(value) === '[object Function]';
        } : function (value) {
            return !!value && typeof value === 'function';
        },
    /**
     * 数字 返回true
     * @param value
     * @returns {boolean}
     */
    isNumber: function (value) {
        return typeof value === 'number' && isFinite(value);
    },
    /**
     * 数字或数字字符串返回true
     * @param value
     * @returns {boolean}
     */
    isNumeric: function (value) {
        return !isNaN(parseFloat(value)) && isFinite(value);
    },
    /**
     * 字符串类型 返回true
     * @param value
     * @returns {boolean}
     */
    isString: function (value) {
        return typeof value === 'string';
    },
    /**
     * boolean类型 返回true
     * @param value
     * @returns {boolean}
     */
    isBoolean: function (value) {
        return typeof value === 'boolean';
    },
    /**
     * undefined类型 返回true
     * @param value
     * @returns {boolean}
     */
    isDefined: function (value) {
        return typeof value !== 'undefined';
    },
    /**
     * 根据id获取dom
     * @param id
     * @returns {HTMLElement}
     */
    getElementById: function (id) {
        return document.getElementById(id);
    },
    /**
     * 判断是否为一行
     * @param length
     * @returns {boolean}
     */
    onlyOne: function (length) {
        if (length !== 1) {
            layer.msg('请选择一行编辑,已选[' + length + ']行', {icon: 5});
            return false;
        }
        return true;
    },

    init: function () {
        /**
         * 全局业务异常捕获 未知异常捕获
         */
        /*layui.jquery.ajaxSetup({
            beforeSend: function (xhr, options) {
                var originalSuccess = options.success;
                options.success = function (data, textStatus, jqXhr) {
                    if (Len.isBoolean(data.flag) && !data.flag) {
                        Len.error(data.msg);
                        return false;
                    }
                    originalSuccess.apply(this, arguments)
                };
            }
        });*/
    },

    /**
     * 根据路由获取菜单
     * @param router
     */
    getMenu: function (router) {
        var menuArr = Len.menuArr;
        for (var i = 0; i < menuArr.length; i++) {
            var childArr = menuArr[i].children;
            for (var j = 0; j < childArr.length; j++) {
                if (childArr[j].router === router) {
                    return childArr[j];
                }
            }
        }
        return null;
    }

};

Len.init();