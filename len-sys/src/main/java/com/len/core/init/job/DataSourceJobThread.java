package com.len.core.init.job;

import java.util.List;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.len.core.quartz.JobTask;
import com.len.entity.SysJob;
import com.len.service.JobService;
import com.len.service.RoleService;
import com.len.util.SpringUtil;

import lombok.extern.slf4j.Slf4j;

/**
 *
 * 启动数据库中已经设定为 启动状态(status:true)的任务 项目启动时init 可优化
 */
@Configuration
@Slf4j
public class DataSourceJobThread extends Thread {

    @Autowired
    RoleService roleService;

    @Autowired
    JobService jobService;

    @Override
    public void run() {
        try {
            Thread.sleep(1000);
            log.info("---------线程启动---------");
            JobTask jobTask = SpringUtil.getBean("jobTask");
            SysJob job = new SysJob();
            job.setStatus(true);
            QueryWrapper<SysJob> jobQueryWrapper = new QueryWrapper<>(job);
            List<SysJob> jobList = jobService.list(jobQueryWrapper);
            // 开启任务
            jobList.forEach(jobs -> {
                log.info("---任务[" + jobs.getId() + "]系统 init--开始启动---------");
                try {
                    jobTask.startJob(jobs);
                } catch (ClassNotFoundException | SchedulerException e) {
                    e.printStackTrace();
                }
            });
            if (jobList.size() == 0) {
                log.info("---数据库暂无启动的任务---------");
            } else {
                System.out.println("---任务启动完毕---------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
