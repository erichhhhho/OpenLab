package com.lab.servlet;

import com.lab.Bean.Appointment;
import com.lab.config.User;
import com.lab.service.AppointmentService;
import com.lab.service.impl.AppointmentServiceImpl;
import com.lab.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：12:38 2017/7/1
 * @Description：
 */
@WebServlet(name = "AddAppointmentServlet",value = "/AddAppointmentServlet")
public class AddAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if(request.getParameter("user").equals("")||request.getParameter("user")==null)
        {
            request.setAttribute("msg", "添加失败，User不能为空");
            request.getRequestDispatcher("Menu.jsp").forward(request,response);
            return;
        }
        try{
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
/*
        Appointment a=new Appointment();
        User user= (User) request.getSession().getAttribute("user");
        a.setPeriod(request.getParameter("period"));
        a.setId(WebUtils.generateID());
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        java.util.Date date=sdf.parse((request.getParameter("day")));
        a.setDay(date);
        a.setLocation(request.getParameter("location"));
        a.setUser(user.getNickname());
        AppointmentService service=new AppointmentServiceImpl();
        service.addAppointment(a);
*/

        Appointment a=WebUtils.request2Bean(request,Appointment.class);
        User user= (User) request.getSession().getAttribute("user");
        a.setId(WebUtils.generateID());
        if(user.getPrivilege().equals("manager"))
                a.setUser(request.getParameter("user"));
        else
         a.setUser(user.getNickname());

        AppointmentService service = new AppointmentServiceImpl();

        if(a.getDay().before(new java.util.Date()))
        {
            request.setAttribute("msg","预约时间已经过去,预约失败！");

        }else if(service.IsAppointmentExist(a.getDay(),a.getLocation(),a.getPeriod())){
            request.setAttribute("msg","该时段指定的实验室已经被预约，预约失败！");
            }
        else {

            service.addAppointment(a);
            request.setAttribute("msg", "添加成功");
        }
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("msg","添加失败！");
        }
        request.getRequestDispatcher("Menu.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }
}
