package com.lab.servlet;

import com.lab.config.User;
import com.lab.service.AppointmentService;
import com.lab.service.impl.AppointmentServiceImpl;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：19:31 2017/7/1
 * @Description：
 */
@WebServlet(name = "ListAppointmentServlet",value = "/ListAppointmentServlet")
public class ListAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
    HttpSession session = request.getSession(false);
    User user= (User) session.getAttribute("user");
    AppointmentService service = new AppointmentServiceImpl();
    if(user.getPrivilege().equals("manager")) {
        List list = service.getAllAppointment();
        session.setAttribute("list", list);
    } else {
        List list = service.getAllAppointmentbyUser(user.getNickname());
        session.setAttribute("list", list);
    }

    request.getRequestDispatcher("/Menu.jsp").forward(request, response);

        }catch (Exception e){
    e.printStackTrace();
    request.setAttribute("msg","查看预约失败");
    request.getRequestDispatcher("/Menu.jsp").forward(request, response);
}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }
}
