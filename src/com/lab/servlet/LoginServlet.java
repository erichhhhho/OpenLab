package com.lab.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


////////////by figo

import javax.servlet.http.HttpSession;
import java.sql.Statement;
import java.util.List;

import com.lab.config.DBConfig;
import com.lab.config.User;
import com.lab.dao.UserDao;
import com.lab.dao.impl.UserDaoJdbcImpl;
import com.lab.security.Encrypter;
import com.lab.service.AppointmentService;
import com.lab.service.impl.AppointmentServiceImpl;
import com.lab.util.Globals;


@WebServlet(name="LoginServlet", value="/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 用户登录检查/////////////
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Object o = session.getAttribute("user");

        if(o!=null&&o!=""){
            response.sendRedirect("Menu.jsp");
            System.out.print(o);
        }
        else
        {
            String name = request.getParameter("name");
            String password = request.getParameter("passwd");
            String vocode = request.getParameter("vcode");

            if (name.equals("Enter Name")) {
                request.setAttribute("msg", "用户名不能为空！");
                request.getRequestDispatcher("/").forward(request, response);
            }
            // 验证码
            String vocode1 = (String)request.getSession().getAttribute("vcode");
            if (!vocode.equals(vocode1)) {
                request.setAttribute("msg", "wrong vcode！");
                request.getRequestDispatcher("/").forward(request, response);
            }
            request.getSession().setAttribute("vcode","");

            //
            Connection conn = null;
            try {
                conn = DBConfig.getConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            Statement statement = null;
            ResultSet rs = null ;
            try {
                statement = conn.createStatement();
                String sql = "select * from user where nickname='"+name+"'";
                rs = statement.executeQuery(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (rs!=null && rs.next()) {
                    int id = rs.getInt("id");
                    String password1 = rs.getString("password");
                    String privilege = rs.getString("privilege");
                    password = Encrypter.md5Encrypt(password);

                    User user=new User(id,name,password,privilege);
                    if (password.equals(password1)) {

                        request.getSession().setAttribute("user", user);

                        // 登录成功
                        Cookie cookie = new Cookie("userid", id+"");
                        Cookie cookie2 = new Cookie("name", name);
                        response.addCookie(cookie);
                        response.addCookie(cookie2);

                        //添加全局变量
                        session.setAttribute("locations", Globals.locations);
                        session.setAttribute("periods", Globals.periods);

                        int[] AppointmentByLocation=new int[Globals.locations.length];

                        AppointmentService service=new AppointmentServiceImpl();
                        UserDao userservice=new UserDaoJdbcImpl();

                        if(user.getPrivilege().equals("manager")){
                            List list=service.getAllAppointment();
                            List userlist=userservice.getAll();
                            session.setAttribute("list",list);
                            session.setAttribute("UserList",userlist);

                        }else{
                        List list=service.getAllAppointmentbyUser(name);
                        session.setAttribute("list",list);
                        }
                        for(int i=0;i<Globals.locations.length;i++){
                            AppointmentByLocation[i]=service.CountAppointmentByLocation(Globals.locations[i]);
                        }
                        session.setAttribute("AppointmentByLocation",AppointmentByLocation);
                        request.getRequestDispatcher("/Menu.jsp").forward(request, response);
                        return;
                    }else {
                        request.setAttribute("msg", "wrong password！");
                        request.getRequestDispatcher("/").forward(request, response);
                    }
                }else {
                    request.setAttribute("msg", "no such user");
                    request.getRequestDispatcher("/").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                    statement.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
