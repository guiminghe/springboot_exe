package com.baizhi.user.dao;

import com.baizhi.user.entity.User;

import java.util.List;

public interface UserDao {
    //查询所有数据
    public List<User> selectAll();
    //查询数据长度
    public int getCount();
}
