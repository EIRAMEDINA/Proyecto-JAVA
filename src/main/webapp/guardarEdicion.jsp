<%@page import="com.arquitectura.java.BD.Libro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
    <%
    	String isbn = request.getParameter("isbn");
    	String titulo = request.getParameter("titulo");
    	String categoria = request.getParameter("categoria");
    	Libro obj1 = new Libro(isbn,titulo,categoria);
    	obj1.modificar();
    	System.out.print("\n Guardando datos de Edicion" + "\n" +  "ISBN:" + isbn + "\n" +"TITULO:"+ titulo + "\n" + "CATEGORIA:" + categoria + "\n");
    	response.sendRedirect("MostrarLibros.jsp");
     %>