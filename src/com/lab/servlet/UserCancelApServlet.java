package com.lab.servlet;

import com.lab.config.User;
import com.lab.service.AppointmentService;
import com.lab.service.impl.AppointmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：23:22 2017/7/1
 * @Description：
 */
@WebServlet(name = "UserCancelApServlet",value = "/UserCancelApServlet")
public class UserCancelApServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {

            User user= (User) request.getSession(false).getAttribute("user");
           String id = request.getParameter("id");
           String privilege=user.getPrivilege();

           AppointmentService service = new AppointmentServiceImpl();
           service.deleteAppointment(id);
           request.setAttribute("msg","取消预约成功！");

            request.getRequestDispatcher("/Menu.jsp").forward(request, response);


       }catch (Exception e)
       {
           request.setAttribute("msg","取消预约失败！");
           e.printStackTrace();
       }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
