package com.lab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lab.config.DBConfig;
import com.lab.security.Encrypter;

@WebServlet(name="RegisterServlet", value="/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


       String name = request.getParameter("name");
        String password1 = request.getParameter("passwd1");
        String password2 = request.getParameter("passwd2");
        String vocode = request.getParameter("vcode");
        PrintWriter out=response.getWriter();
        out.println(name+password1+password2+vocode);


        if (!password1.equals(password2)) {
            request.setAttribute("msg", "密码不一致！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
        // 验证码
        String vocode1 = (String)request.getSession().getAttribute("vcode");
        if (!vocode.equals(vocode1)) {
            request.setAttribute("msg", "验证码不正确！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }





        // 检查是否有重名的用户
        Connection conn = DBConfig.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = conn.prepareStatement("select * from user where nickname=?");
            statement.setString(1, name);
            rs = statement.executeQuery();
            if (rs!=null && rs.next()) {
                request.setAttribute("msg", "此用户名已经注册！");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
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

        // 添加用户
        Connection conn1 = DBConfig.getConnection();
        PreparedStatement statement1 = null;
        ResultSet rs1 = null;
        try {
            statement1 = conn1.prepareStatement("insert into user(nickname, password) values(?,?)");
            statement1.setString(1, name);
            statement1.setString(2, Encrypter.md5Encrypt(password1));
            statement1.executeUpdate();
            request.setAttribute("msg", "注册成功，请登录！");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (SQLException e1) {
            e1.printStackTrace();
        } finally {
            try {
                if (rs1!=null) rs1.close();
                if(statement1!=null) statement1.close();
                if (conn1!=null) conn1.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

}
