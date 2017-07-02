package com.lab.dao;

import com.lab.config.User;

import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：5:19 2017/7/2
 * @Description：
 */
public interface UserDao {
    void add(User user);

    User find(String nickname, String password);

    List<User> getAll();

    boolean findbyNickname(String nickname);

    User findbyID(int id);

    void delete(int id);
}
