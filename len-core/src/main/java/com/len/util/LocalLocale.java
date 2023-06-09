package com.len.util;

import java.util.Locale;

/**
 * 区域设置
 */
public class LocalLocale {

    private final static ThreadLocal<Locale> local = ThreadLocal.withInitial(() -> {
        // 语言的默认值
        return Locale.SIMPLIFIED_CHINESE;
    });

    public static Locale getLocale() {
        return local.get();
    }

    public static void setLocale(String locale) {
        setLocale(new Locale(locale));
    }

    public static void setLocale(Locale locale) {
        local.set(locale);
    }

    public static void clear() {
        local.remove();
    }

}
