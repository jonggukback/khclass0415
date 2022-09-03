package book.ch1;

//package com.kh.test.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TestDao {
    public List<TEST> selectList(){

    Connection con = null;
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "kh";
    String password = "kh";

    try {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection(url, user, password);
        con.setAutoCommit(false);
    } catch (SQLException e) {
    	e.printStackTrace();
    } catch (ClassNotFoundException e2) {
    	e2.printStackTrace();
    }

    PreparedStatement pstm = null;
    ResultSet rs = null;
    List<TEST> list = new ArrayList<TEST>();
    String sql = "SELECT * FROM TEST";

    try {
    	pstm = con.prepareStatement(sql);
    	rs = pstm.executeQuery();
    	while(rs.next()) {
    		TEST test = new TEST();
    		test.setSeq(rs.getInt("seq"));
    		test.setWriter(rs.getString("writer"));
    		test.setTitle(rs.getString("title"));
    		test.setContent(rs.getString("content"));
    		test.setRegdate(rs.getDate("regdate"));
            list.add(test);
    	}
    } catch (SQLException e) {
    	e.printStackTrace();
    } finally {
    	try {
            rs.close();
            pstm.close();
            con.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    }
    return list;
    } 
}
