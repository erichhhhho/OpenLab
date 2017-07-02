package com.lab.servlet;

import com.lab.service.AppointmentService;
import com.lab.service.impl.AppointmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：21:28 2017/7/1
 * @Description：
 */
@WebServlet(name = "SearchbyLocationServlet",value = "/SearchbyLocationServlet")
public class SearchbyLocationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        if(request.getParameter("day").equals(""))
        {
            request.setAttribute("msg", "查询空闲实验室失败！日期不能为空");
            request.getRequestDispatcher("/Menu.jsp").forward(request, response);
            return;
        }

        try {

            String location = request.getParameter("location");
            SimpleDateFormat sdf = new SimpleDateFormat(("yyyy-MM-dd"));
            java.util.Date day = null;
            try {

                day = sdf.parse(request.getParameter("day"));

            } catch (ParseException e) {
                e.printStackTrace();
            }
            if(day.before(new Date()))
            {
                request.setAttribute("msg", "查询空闲实验室失败！日期不能早于当前日期");
                request.getRequestDispatcher("/Menu.jsp").forward(request, response);
            }else {
                AppointmentService service = new AppointmentServiceImpl();
                List list = service.getAvailableAppointmentByDayandLocation(day, location);

                request.setAttribute("AvaliableList", list);
                request.setAttribute("msg", "查询空闲实验室成功！");

                request.getRequestDispatcher("/searchDate.jsp").forward(request, response);
            }

        }catch (Exception e)
        {
            request.setAttribute("msg","查询空闲实验室失败！");
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
