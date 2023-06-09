package com.len.core.init.job;

import org.springframework.context.event.ContextRefreshedEvent;

import com.len.base.handler.ExecuteContext;

public class JobExecuteImpl implements ExecuteContext {

    @Override
    public void execute(ContextRefreshedEvent event) {
        /*
         * 通过线程开启数据库中已经开启的定时任务
         */
        DataSourceJobThread myThread = event.getApplicationContext().getBean(DataSourceJobThread.class);
        myThread.start();
    }
}
