package com.lab.service.impl;

import com.lab.Bean.Appointment;


import com.lab.Bean.FreeAppointment;
import com.lab.dao.AppointmentDao;
import com.lab.dao.impl.AppointmentDaoImpl;
import com.lab.service.AppointmentService;
import com.lab.util.Globals;
import com.lab.util.WebUtils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：14:28 2017/7/1
 * @Description：
 */
public class AppointmentServiceImpl  implements com.lab.service.AppointmentService{

    private AppointmentDao dao=new AppointmentDaoImpl();

    @Override
    public  void addAppointment(Appointment c){
        dao.add(c);
    }

    @Override
    public boolean IsAppointmentExist(Date day, String location, String period)
    {
       return dao.IsAppointmentExist(day,location,period);
    }

    @Override
    public boolean updateAppointment(Appointment c){
        if(IsAppointmentExist(c.getDay(), c.getLocation(), c.getPeriod()))
        {
            return false;
        }
        else
        {
            dao.update(c);
        return true;
        }
    }
    @Override
    public int CountAppointmentByLocation(String location){
            return dao.CountAppointmentByLocation(location);
    }

    @Override
    public void deleteAppointment(String id)
    {
        dao.delete(id);
    }

    @Override
    public Appointment findAppointment(String id){
        return dao.find(id);
    }

    @Override
    public List<Appointment> getAllAppointment(){
        return  dao.getAll();
    }
    @Override
    public List<FreeAppointment> getAvailableAppointmentByDayandPeriod(Date day, String period){
        List list=new ArrayList();

        for (int i=0;i<Globals.locations.length;i++)
        {
         if(!IsAppointmentExist(day,Globals.locations[i],period)) {
             FreeAppointment temp=new FreeAppointment(day,period,Globals.locations[i]);
             list.add(temp);
            }
        }
        return list ;
    }

    @Override
    public List<FreeAppointment> getAvailableAppointmentByDayandLocation(Date day, String location){
        List list=new ArrayList();

        for (int i=0;i<Globals.periods.length;i++)
        {
            if(!IsAppointmentExist(day,location,Globals.periods[i])) {
                FreeAppointment temp=new FreeAppointment(day,Globals.periods[i],location);
                list.add(temp);
            }
        }

        return list ;
    }

    @Override
    public List<Appointment> getAllAppointmentbyUser(String user){
        return  dao.findbyname(user);
    }


}
