<%@page import="com.arquitectura.java.BD.Libro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
    <%
    	String titulo = request.getParameter("titulo");
    	String categoria = request.getParameter("categoria");
//     	Libro obj1 = new Libro(titulo, categoria);
//     	obj1.modificar();
//     	response.sendRedirect("MostrarLibros.jsp");
     %>