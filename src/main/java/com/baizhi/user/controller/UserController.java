package com.baizhi.user.controller;

import com.baizhi.user.entity.User;
import com.baizhi.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/selectAll")
    public @ResponseBody
    Map selectAll(){
        Map map = new HashMap();
        List<User> userList= userService.selectAll();
        System.out.println(userList+"&&&&&&&&&&&&&&&&&&");
        map.put("rows",userList);
        return map;
    }

    @RequestMapping("/selectByPage")
    public @ResponseBody
    Map selectByPage(int page, int rows){
        Map map = new HashMap();
        List<User> userList = userService.selectByPage(page,rows);
        int count = userService.getCount();
        map.put("rows",userList);
        map.put("total",count);
        return map;
    }
}
