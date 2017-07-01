package com.lab.config;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：2:27 2017/7/1
 * @Description：
 */
import java.util.List;

public class QueryResult {

    private List list;   //记住用户看的页的数据
    private int totalrecord;    //记往总记录数
    public List getList() {
        return list;
    }
    public void setList(List list) {
        this.list = list;
    }
    public int getTotalrecord() {
        return totalrecord;
    }
    public void setTotalrecord(int totalrecord) {
        this.totalrecord = totalrecord;
    }
}