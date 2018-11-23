package com.baizhi.user.service;

import com.baizhi.user.entity.User;

import java.util.List;

public interface UserService {
    public List<User> selectAll();
    //分页查询数据
    public List<User> selectByPage(int pageNum, int pageSize);
    //查询数据长度
    public int getCount();
}
