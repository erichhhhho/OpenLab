package com.lab.service;

import com.lab.Bean.Appointment;

import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：14:38 2017/7/1
 * @Description：
 */
public interface AppointmentService {
    void addAppointment(Appointment c);

    void updateAppointment(Appointment c);

    void deleteAppointment(int id);

    Appointment findAppointment(int id);

    List<Appointment> getAllAppointment();
}
