<%@page import="java.util.List"%>
<%@page import="com.arquitectura.java.BD.Libro"%>
<%Libro libro = Libro.buscarPorClave(request.getParameter("isbn"));%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Libros</title>
</head>
<body>
	<form action="guardarEdicion.jsp" id="FormularioEdicion">
		<fieldset> 
		<legend>Edición de Libros</legend>
			<label for="isbn">ISBN:</label>
			<input type="text" placeholder="ISBN" name="isbn" id="isbn" value="<%=libro.getIsbn()%>" disabled="disabled"/>
			<br>
			<label for="titulo">TITULO:</label>
			<input type="text" placeholder="TITULO" name="titulo" id="titulo" value="<%=libro.getTitulo()%>"/>
			<br>
			<label for="categoria">CATEGORIA:</label>
			<select name="categoria"> 
				<%
					List<String> listaDeCategorias = null;
					listaDeCategorias = Libro.buscarTodasLasCategorias();
					for(String categoria : listaDeCategorias){
						if(libro.getCategoria().equals(categoria)){
							%>
								<option value="<%=categoria%>" selected="selected"><%=categoria%></option>
							<%
						}else{ 
							%>	
								<option value="<%=categoria%>"><%=categoria%></option> 
							<%
						}
					}
				 %>
			</select>
			<br/>
			<input type="submit" value="Gurdar"/>
		</fieldset> 
	</form>
</body>
</html>