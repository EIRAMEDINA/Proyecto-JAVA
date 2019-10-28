<%@page import="com.arquitectura.java.BD.Libro"%>
<%@page import="com.arquitectura.java.BD.DataBaseHelper"%>
<%@page import="com.mysql.cj.jdbc.DatabaseMetaData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    	String isbn = request.getParameter("isbn");
    	Libro obj1 = new Libro(isbn);
    	obj1.borrar();
    	System.out.print("\n Borrando Datos....." + "\n" +  "ISBN:" + isbn + "\n");
    	response.sendRedirect("MostrarLibros.jsp");
    %>