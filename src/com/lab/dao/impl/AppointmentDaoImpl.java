package com.lab.dao.impl;

import com.lab.Bean.Appointment;
import com.lab.config.DBConfig;
import com.lab.exception.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：14:10 2017/7/1
 * @Description：
 */
public class AppointmentDaoImpl implements com.lab.dao.AppointmentDao {

    @Override
    public void add(Appointment c){
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "insert into data(id,day,period,user,location) values(?,?,?,?,?)";
            st = conn.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setDate(2, new java.sql.Date(c.getDay().getTime()));
            st.setString(3, c.getPeriod());
            st.setString(4, c.getUser());
            st.setString(5, c.getLocation());

            st.executeUpdate();
        }catch (Exception e) {
            throw new DaoException(e);
        }finally{
            DBConfig.release(conn, st, rs);
        }
    }

    @Override
    public void update(Appointment c){   //id
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "update data set day=?,period=?,user=?,location=? where id=?";
            st = conn.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(c.getDay().getTime()));
            st.setString(2, c.getPeriod());
            st.setString(3, c.getUser());
            st.setString(4, c.getLocation());
            st.setInt(5, c.getId());
            st.executeUpdate();
        }catch (Exception e) {
            throw new DaoException(e);
        }finally{
            DBConfig.release(conn, st, rs);
        }
    }

    @Override
    public void delete(int id){
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "delete from customer where id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        }catch (Exception e) {
            throw new DaoException(e);
        }finally{
            DBConfig.release(conn, st, rs);
        }
    }

    @Override
    public Appointment find(int id){
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "select * from data where id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                Appointment c = new Appointment();
                c.setDay(rs.getDate("day"));
                c.setPeriod(rs.getString("period"));
                c.setUser(rs.getString("user"));
                c.setLocation(rs.getString("location"));
                c.setId(rs.getInt("id"));

                return c;
            }
            return null;
        }catch (Exception e) {
            throw new DaoException(e);
        }finally{
            DBConfig.release(conn, st, rs);
        }
    }


    @Override
    public List<Appointment> getAll(){
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            conn = DBConfig.getConnection();
            String sql = "select * from customer";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            List list = new ArrayList();
            while(rs.next()){
                Appointment c = new Appointment();
                c.setDay(rs.getDate("day"));
                c.setPeriod(rs.getString("period"));
                c.setUser(rs.getString("user"));
                c.setLocation(rs.getString("location"));
                c.setId(rs.getInt("id"));
                list.add(c);
            }
            return list;
        }catch (Exception e) {
            throw new DaoException(e);
        }finally{
            DBConfig.release(conn, st, rs);
        }
    }
}
