package com.lab.dao;

import com.lab.Bean.Appointment;

import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：14:33 2017/7/1
 * @Description：
 */
public interface AppointmentDao {
    void add(Appointment c);

    void update(Appointment c);

    void delete(int id);

    Appointment find(int id);

    List<Appointment> getAll();
}
