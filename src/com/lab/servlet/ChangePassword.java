package com.lab.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lab.config.DBConfig;
import com.lab.security.Encrypter;

@WebServlet(name="ChangePassword", urlPatterns="/ChangePassword")
public class ChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickname = request.getParameter("name");
        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String vcode = request.getParameter("vcode");

        // 验证码
        String vcode1 = (String)request.getSession().getAttribute("vcode");
        if (!vcode.equals(vcode1)) {
            request.setAttribute("msg", "wrong vcode");
            request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
        }

        if (password.equals(password1)) {
            request.setAttribute("msg", "The new password is the same with the old password! ");
            request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
        }

        if (!password1.equals(password2)) {
            request.setAttribute("msg", "The two new password most be the same");
            request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
        }

        Connection conn = DBConfig.getConnection();
        PreparedStatement statement = null;
        try {
            String sql = "update user set password=? where nickname=? and password=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, Encrypter.md5Encrypt(password1));
            statement.setString(2, nickname);
            statement.setString(3, Encrypter.md5Encrypt(password));
            int result = statement.executeUpdate();
            if (result<=0) {
                request.setAttribute("msg", "failed to reset password");
                request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "reset successfully, you can login new");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                statement.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
