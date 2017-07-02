package com.lab.Bean;

import java.util.Date;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：21:55 2017/7/1
 * @Description：
 */
public class FreeAppointment {

    private Date day;
    private String period;

    private String location;

    public FreeAppointment(Date day, String period, String location) {
        this.day = day;
        this.period = period;
        this.location = location;
    }

    public FreeAppointment() {
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
