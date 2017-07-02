package com.lab.service;

import com.lab.Bean.Appointment;
import com.lab.Bean.FreeAppointment;

import java.util.Date;
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

    boolean IsAppointmentExist(Date day, String location, String period);

    boolean updateAppointment(Appointment c);

    int CountAppointmentByLocation(String location);

    void deleteAppointment(String id);

    Appointment findAppointment(String id);

    List<FreeAppointment> getAvailableAppointmentByDayandPeriod(Date day, String period);

    List<FreeAppointment> getAvailableAppointmentByDayandLocation(Date day, String location);

    List<Appointment> getAllAppointmentbyUser(String user);

    List<Appointment> getAllAppointment();
}
