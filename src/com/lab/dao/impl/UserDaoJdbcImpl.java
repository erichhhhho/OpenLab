package com.lab.dao.impl;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：10:16 2017/7/1
 * @Description：
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.lang.*;

import com.lab.dao.UserDao;
import com.lab.config.User;
import com.lab.exception.*;

import com.lab.config.DBConfig;
import java.util.Date;

public class UserDaoJdbcImpl {
    public void add(User user) {
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "insert into user(id,nickname,password,privilege) values(?,?,?,?)";
            st = conn.prepareStatement(sql);
            st.setInt(1,user.getId());
            st.setString(2, user.getNickname());
            st.setString(3, user.getPassword());
            st.setString(4, user.getPrivilege());

            int num = st.executeUpdate();
            if(num<1){
                throw new RuntimeException("注册用户失败");
            }
        }catch (Exception e) {
            throw new DaoException(e);   //gosling  thinking in java   spring
        }finally{
            DBConfig.release(conn, st, rs);
        }


    }

    //username=' or 1=1 or username='   password=""
	/*public User find(String username, String password) {

		Connection conn = null;
		Statement st = null;   //PreparedStatment
		ResultSet rs = null;
		try{
			conn = JdbcUtils.getConnection();
			st = conn.createStatement();
			//sql = select * from users where username='' or 1=1 or username='' and password='"+password+"'"
			//sql = select * from users where true;

			String sql = "select * from users where username='"+username+"' and password='"+password+"'";
			rs = st.executeQuery(sql);
			if(rs.next()){
				User user = new User();
				user.setBirthday(rs.getDate("birthday"));
				user.setEmail(rs.getString("email"));
				user.setId(rs.getString("id"));
				user.setNickname(rs.getString("nickname"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
				return user;
			}
			return null;
		}catch (Exception e) {
			throw new DaoException(e);
		}finally{
			JdbcUtils.release(conn, st, rs);
		}
	}*/

	/*
	statment和preparedStatement的区别:
	1. preparedStatement是statement的孩子
	2. preparedStatement可以防止sql注入的问题
	3. preparedStatement会对sql语句进行预编译，以减轻数据库服务器的压力

	java---class---jvm
	sql----编译---数据库
	*/

    public User find(String nickname, String password) {

        Connection conn = null;
        PreparedStatement st = null;   //PreparedStatment
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "select * from user where nickname=? and password=?";
            st = conn.prepareStatement(sql);   //预编译这条sql


            st.setString(1, nickname);
            st.setString(2, password);

            rs = st.executeQuery();
            if(rs.next()){
                User user = new User();

                user.setId(rs.getInt("id"));
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("password"));
                user.setPrivilege(rs.getString("privilege"));
                return user;
            }
            return null;
        }catch (Exception e) {
            throw new DaoException(e);
        }finally{
            DBConfig.release(conn, st, rs);
        }
    }

    public boolean find(String nickname) {
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "select * from user where nickname=?";
            st = conn.prepareStatement(sql);
            st.setString(1, nickname);

            rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
            return false;
        }catch (Exception e) {
            throw new DaoException(e);
        }finally{
            DBConfig.release(conn, st, rs);
        }
    }
}
