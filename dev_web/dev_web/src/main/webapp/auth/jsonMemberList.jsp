<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>   
<%

	List<Map<String,Object>> MemberList = 
		(List<Map<String,Object>>) request.getAttribute("memberList");

	Gson g = new Gson();
	String imsi = g.toJson(MemberList);
	out.print(imsi);
%>