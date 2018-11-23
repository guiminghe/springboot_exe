package com.baizhi.user.service.impl;

import com.baizhi.user.dao.UserDao;
import com.baizhi.user.entity.User;
import com.baizhi.user.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public List<User> selectAll(){
        return userDao.selectAll();
    }

    @Override
    public List<User> selectByPage(int pageNum, int pageSize) {
        //使用PageHelper开启分页功能,需要传递参数当前页码和一页显示多少条数
        PageHelper.startPage(pageNum,pageSize);
        //调用查询所有的数据的功能
        List<User> userList = userDao.selectAll();
        PageInfo<User>  userPageInfo = new PageInfo<>(userList);
        return userList;
    }

    @Override
    public int getCount() {
        return userDao.getCount();
    }
}
