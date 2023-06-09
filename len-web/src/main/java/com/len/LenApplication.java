package com.len;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * 项目启动类
 */

@EnableWebMvc
@EnableTransactionManagement
@ComponentScan({"com.len", "org.activiti"})
@MapperScan(basePackages = {"com.len.mapper"})
@SpringBootApplication(exclude = {RedisAutoConfiguration.class,
    org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class,
    org.springframework.boot.actuate.autoconfigure.security.servlet.ManagementWebSecurityAutoConfiguration.class})
public class LenApplication {

    public static void main(String[] args) {
        SpringApplication.run(LenApplication.class, args);
        System.out.println("Server start success!");
        // 没啥意思，我就是想加个注释
    }

}
