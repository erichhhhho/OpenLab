package com.lab.dao;

import com.lab.Bean.Appointment;

import java.util.Date;
import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：20:16 2017/7/1
 * @Description：
 */
public interface AppointmentDao {
    void add(Appointment c);

    void update(Appointment c);

    void delete(String id);

    Appointment find(String id);

    List<Appointment> findbyname(String user);

    List<Appointment> findbylocation(String location);

    List<Appointment> findbyday(Date day);

    List<Appointment> findbyDayandPeriod(Date day, String period);

    boolean IsAppointmentExist(Date day, String location, String period);

    List<Appointment> getAll();

    int CountAppointmentByLocation(String location);
}
