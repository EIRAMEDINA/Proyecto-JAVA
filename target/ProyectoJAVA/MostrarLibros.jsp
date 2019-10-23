<%@page import="com.arquitectura.java.BD.Libro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catalogo Libros</title>
</head>
<body>
	<form action="MostrarLibros.jsp">
		<select name="categoria">
		<option>Seleccionar</option>
			<%
				List<String> listaDeCategorias = null;
				listaDeCategorias = Libro.buscarTodasLasCategorias();
				
				for(String categoria : listaDeCategorias){
					%>
						<option value="<%=categoria%>"><%=categoria%></option>
					<% 
				}
			 %>
			 <input type="submit" value="filtrar"/>
		</select>
		<br/>
		<br/>
		<table id="tablaContenido">
			<tr>
				<td align="center">ISBN</td>
				<td align="center">TITULO</td>
				<td align="center">CATEGORIA</td>
				<td align="center">ACCIÓN</td>
			</tr>
			<tbody>
				<%
					List<Libro> listaDeLibros = null;
					if(request.getParameter("categoria") == null || request.getParameter("categoria").equals("Seleccionar")){
						listaDeLibros = Libro.buscarTodos();
					}else{
						listaDeLibros = Libro.buscarPorCategoria(request.getParameter("categoria"));
					}
					
					for(Libro libro : listaDeLibros){
						%>
							<tr>
								<th align="center"><%=libro.getIsbn()%></th>
								<th align="left"><%=libro.getTitulo()%></th>
								<th align="left"><%=libro.getCategoria()%></th>
								<th><a href="BorrarLibro.jsp?isbn=<%=libro.getIsbn()%>">Borrar</a></th>
								<th><a href="EditarLibro.jsp?isbn=<%=libro.getIsbn()%>">Modificar</a></th>
								<br/>
							</tr>
						<%
					}
				 %>
			</tbody>
		</table>
		 <br/>
		 <br/>
		 <a href="index.jsp">Insertar Nuevo</a>
	</form>
</body>
</html>