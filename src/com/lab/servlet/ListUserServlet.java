package com.lab.servlet;

import com.lab.config.User;
import com.lab.dao.UserDao;
import com.lab.dao.impl.UserDaoJdbcImpl;

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
 * @Date：5:34 2017/7/2
 * @Description：
 */
@WebServlet(name = "ListUserServlet",value = "/ListUserServlet")
public class ListUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession(false);
            User user= (User) session.getAttribute("user");
            UserDao service = new UserDaoJdbcImpl();
                List list = service.getAll();
                session.setAttribute("UserList", list);


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
