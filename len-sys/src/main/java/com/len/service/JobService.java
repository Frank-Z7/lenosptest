package com.len.service;

import com.len.base.BaseService;
import com.len.entity.SysJob;

public interface JobService extends BaseService<SysJob> {

    /**
     * 更新
     * 
     * @param job
     * @return
     */
    public boolean updateJob(SysJob job);

    /**
     * 删除
     * 
     * @param id
     * @return
     */
    public boolean del(String id);

    /**
     * 启动任务
     * 
     * @param id
     * @return
     */
    public boolean startJob(String id);

    /**
     * 停止任务
     * 
     * @param id
     * @return
     */
    public boolean stopJob(String id);

}
