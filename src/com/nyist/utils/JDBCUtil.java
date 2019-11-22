package com.nyist.utils;

import javax.sql.DataSource;

import java.sql.Connection;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
public class JDBCUtil {
    private  static DataSource ds ;
    //加载配置文件，创建数据库连接池
    static{

        try {
            Properties pro = new Properties();
            pro.load(JDBCUtil.class.getClassLoader().getResourceAsStream("com/nyist/druid.properties"));
            ds = DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获取连接池对象
    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
    //释放资源
    public static void close(Statement sttm, Connection conn, ResultSet rs){
        if(sttm!=null){
            try {
                sttm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(Statement sttm, Connection conn){
        close(sttm,conn,null);
    }
    public static DataSource getDs(){
        return ds;
    }

}






