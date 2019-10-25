<%@page import="com.arquitectura.java.BD.Libro"%>
<%@page import="java.util.List"%>
<%
	Libro libro = Libro.buscarPorClave(request.getParameter("isbn"));
%>
<!DOCTYPE html>
<html>
<head> 
	<title>Editar Libros</title>
</head>
<body>
	<form action="guardarEdicion.jsp" id="FormularioEdicion">
		<fieldset> 
		<legend>Edición de Libros</legend>
			<label for="isbn">ISBN:</label>
			<input type="text" placeholder="ISBN" name="isbn" id="isbn" value="<%=libro.getIsbn()%>"/>
			<br>
			<label for="titulo">TITULO:</label>
			<input type="text" placeholder="TITULO" name="titulo" id="titulo" value="<%=libro.getTitulo()%>"/>
			<br>
			<label for="categoria">CATEGORIA:</label>
			<input type="text" placeholder="categoria" name="categoria" id="categoria" value="<%=libro.getCategoria()%>"/>
			<br>
			<br>
			<input type="submit" value="Guardar"/>
		</fieldset> 
	</form>
</body>
</html>