package com.lab.servlet;

import com.lab.Bean.Appointment;
import com.lab.config.User;
import com.lab.service.AppointmentService;
import com.lab.service.impl.AppointmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：0:41 2017/7/2
 * @Description：
 */
@WebServlet(name = "UserModifyApServlet",value = "/UserModifyApServlet")
public class UserModifyApServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        User currentuser= (User) request.getSession(false).getAttribute("user");

        try {
            String id = request.getParameter("id");
            String period=request.getParameter("period");
            String location=request.getParameter("location");
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
            java.util.Date day=sdf.parse(request.getParameter("day"));
            String user=null;
            if(currentuser.getPrivilege().equals("manager")&&request.getParameter("user")!=null&&!request.getParameter("user").equals(""))
            {
                user=request.getParameter("user");
            }else if(currentuser.getPrivilege().equals("teacher")||currentuser.getPrivilege().equals("student")){
                user = currentuser.getNickname();
            }else{
                request.setAttribute("msg", "更改预约失败！用户名不能为空");
            }

            if(day.before(new Date())) {
                request.setAttribute("msg", "更改预约失败！预约时间早于当前时间");
            }
            else
            {
                Appointment c = new Appointment(id, day, period, user, location);
                AppointmentService service = new AppointmentServiceImpl();
                if (service.updateAppointment(c))
                    request.setAttribute("msg", "更改预约成功！");
                else
                    request.setAttribute("msg", "更改预约失败！");
            }request.getRequestDispatcher("/Menu.jsp").forward(request, response);

        }catch (Exception e)
        {
            request.setAttribute("msg","更改预约失败！");
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
