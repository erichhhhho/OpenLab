package com.lab.config;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：21:04 2017/6/30
 * @Description：
 */
public class User {

    private int id;
    private String nickname;
    private String password;
    private String privilege;

    public User(int id, String nickname, String password, String privilege) {
        this.id = id;
        this.nickname = nickname;
        this.password = password;
        this.privilege = privilege;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String privilege) {
        this.privilege = privilege;
    }


}
