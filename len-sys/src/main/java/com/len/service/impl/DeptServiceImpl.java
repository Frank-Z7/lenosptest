package com.len.service.impl;

import org.springframework.stereotype.Service;

import com.len.base.impl.BaseServiceImpl;
import com.len.entity.SysDept;
import com.len.mapper.SysDeptMapper;
import com.len.service.DeptService;

/**
 * 部门 service
 */
@Service
public class DeptServiceImpl extends BaseServiceImpl<SysDeptMapper, SysDept> implements DeptService {

}
