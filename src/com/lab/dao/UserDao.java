package com.lab.dao;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：10:14 2017/7/1
 * @Description：
 */

import com.lab.config.User;

public interface UserDao {

    void add(User user);

    User find(String username, String password);

    //查找注册的用户是否在数据库中存在
    boolean find(String username);
}