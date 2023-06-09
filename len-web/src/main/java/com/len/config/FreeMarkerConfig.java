package com.len.config;

import java.io.IOException;
import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactory;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import freemarker.template.TemplateException;

/**
 * freemarker 配置
 */
@Configuration
public class FreeMarkerConfig {

    /**
     * 支持ftl 后缀视图解析配置
     * 
     * @return ViewResolver
     */
    @Bean
    public ViewResolver viewResolverFtl() {
        FreeMarkerViewResolver resolver = new FreeMarkerViewResolver();
        resolver.setCache(false);
        resolver.setViewClass(org.springframework.web.servlet.view.freemarker.FreeMarkerView.class);
        resolver.setRequestContextAttribute("re");
        resolver.setExposeRequestAttributes(true);
        resolver.setExposeSessionAttributes(true);
        resolver.setSuffix(".ftl");
        resolver.setContentType("text/html;charset=UTF-8");
        resolver.setOrder(0);
        return resolver;
    }


    /**
     * 支持html 后缀视图解析配置
     *
     * @return ViewResolver
     */
    @Bean
    public ViewResolver viewResolverHtml() {
        FreeMarkerViewResolver resolver = new FreeMarkerViewResolver();
        resolver.setCache(false);
        resolver.setViewClass(org.springframework.web.servlet.view.freemarker.FreeMarkerView.class);
        resolver.setRequestContextAttribute("re");
        resolver.setExposeRequestAttributes(true);
        resolver.setExposeSessionAttributes(true);
        resolver.setOrder(1);
        resolver.setSuffix(".html");
        resolver.setContentType("text/html;charset=UTF-8");
        return resolver;
    }

    /**
     * freemarker 主要配置类
     *
     * @return FreeMarkerConfigurer
     */
    @Bean
    public FreeMarkerConfigurer freemarkerConfig() throws IOException, TemplateException {
        FreeMarkerConfigurationFactory factory = new FreeMarkerConfigurationFactory();
        //路径前缀
        factory.setTemplateLoaderPath("classpath:/ftl/");
        //编码
        factory.setDefaultEncoding("UTF-8");
        factory.setPreferFileSystemAccess(false);
        FreeMarkerConfigurer result = new FreeMarkerConfigurer();
        freemarker.template.Configuration configuration = factory.createConfiguration();
        configuration.setClassicCompatible(true);
        result.setConfiguration(configuration);
        Properties settings = new Properties();
        settings.put("template_update_delay", "0");
        settings.put("default_encoding", "UTF-8");
        settings.put("number_format", "0.######");
        settings.put("classic_compatible", true);
        settings.put("template_exception_handler", "ignore");
        result.setFreemarkerSettings(settings);
        return result;
    }

}