<%@page import="com.arquitectura.java.BD.Libro"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.arquitectura.java.BD.DataBaseHelper"%>
<%@page import="com.mysql.cj.jdbc.DatabaseMetaData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
    
    <%
    	String isbn = request.getParameter("isbn");
    	String titulo = request.getParameter("titulo");
    	String categoria = request.getParameter("categoria");
    	Libro obj1 = new Libro(isbn,titulo,categoria);
    	obj1.insertar();
    	response.sendRedirect("MostrarLibros.jsp");
    %>