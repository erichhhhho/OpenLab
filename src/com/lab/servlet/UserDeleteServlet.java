package com.lab.servlet;

import com.lab.config.User;
import com.lab.dao.UserDao;
import com.lab.dao.impl.UserDaoJdbcImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：5:26 2017/7/2
 * @Description：
 */
@WebServlet(name = "UserDeleteServlet",value = "/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {


            int id = Integer.parseInt(request.getParameter("id"));

            UserDao service = new UserDaoJdbcImpl();
            User user=service.findbyID(id);
            service.delete(id);
            request.setAttribute("msg","删除用户"+user.getNickname()+"成功！");

            request.getRequestDispatcher("/Menu.jsp").forward(request, response);


        }catch (Exception e)
        {
            request.setAttribute("msg","删除用户失败！");
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
