package com.lab.exception;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：10:21 2017/7/1
 * @Description：
 */

public class UserExistException extends Exception {

    public UserExistException() {
        // TODO Auto-generated constructor stub
    }

    public UserExistException(String message) {
        super(message);
        // TODO Auto-generated constructor stub
    }

    public UserExistException(Throwable cause) {
        super(cause);
        // TODO Auto-generated constructor stub
    }

    public UserExistException(String message, Throwable cause) {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

}
