package com.lab.service.impl;

import com.lab.Bean.Appointment;

import com.lab.dao.AppointmentDao;
import com.lab.dao.impl.AppointmentDaoImpl;
import com.lab.service.AppointmentService;

import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：14:28 2017/7/1
 * @Description：
 */
public class AppointmentServiceImpl implements AppointmentService {

   private AppointmentDao dao=new AppointmentDaoImpl();

    @Override
    public  void addAppointment(Appointment c){
        dao.add(c);
    }

    @Override
    public void updateAppointment(Appointment c){
        dao.update(c);
    }

    @Override
    public void deleteAppointment(int id)
    {
        dao.delete(id);
    }

    @Override
    public Appointment findAppointment(int id){
        return dao.find(id);
    }

    @Override
    public List<Appointment> getAllAppointment(){
        return  dao.getAll();
    }
}
