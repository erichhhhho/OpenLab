package com.lab.servlet;

import com.lab.config.DBConfig;
import com.lab.security.Encrypter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：10:53 2017/7/2
 * @Description：
 */
@WebServlet(name = "AddUserServlet",value = "/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String nickname = request.getParameter("nickname");
        String password1 = request.getParameter("passwd1");
        String password2 = request.getParameter("passwd2");
        String privilege =request.getParameter("privilege");


        if (nickname.equals("")) {
            request.setAttribute("msg", "添加用户失败，用户名不能为空！");
            request.getRequestDispatcher("/Menu.jsp").forward(request, response);
        }
        else if (!password1.equals(password2)) {
            request.setAttribute("msg", "添加用户失败，密码不一致！");
            request.getRequestDispatcher("/Menu.jsp").forward(request, response);
        }
        // 检查是否有重名的用户
        Connection conn = null;
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PreparedStatement statement = null;
        PreparedStatement statement1 = null;

        ResultSet rs = null;
        try {
            statement = conn.prepareStatement("select * from user where nickname=?");
            statement.setString(1, nickname);
            rs = statement.executeQuery();
            if (rs!=null && rs.next()) {
                request.setAttribute("msg", "添加用户失败，此用户名已经注册！");
                request.getRequestDispatcher("/Menu.jsp").forward(request, response);
            }else{
                statement1 = conn.prepareStatement("insert into user(nickname, password,privilege) values(?,?,?)");
                statement1.setString(1, nickname);
                statement1.setString(2, Encrypter.md5Encrypt(password1));
                statement1.setString(3, privilege);
                statement1.executeUpdate();
                request.setAttribute("msg", "添加用户成功！");
                request.getRequestDispatcher("/Menu.jsp").forward(request, response);
            }

        } catch (SQLException e1) {
            e1.printStackTrace();
        } finally {
            try {
                if(rs!=null) rs.close();
                if(statement!=null) statement.close();
                if(conn!=null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }



    }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
