<html>
<body>
<head>
	<title>FORMULARIO LIBRO</title>
</head>
	<form action="InsertarLibro.jsp" id="formularioLibro" onsubmit="return validacionCampos();">
		<fieldset> 
			<label for="isbn">ISBN:</label>
			<input type="text" placeholder="ISBN" name="isbn" id="isbn"/>
			<br>
			<label for="titulo">TITULO:</label>
			<input type="text" placeholder="TITULO" name="titulo" id="titulo"/>
			<br>
			<label for="categoria">CATEGORIA:</label>
			<input type="text" placeholder="CATEGORIA" name="categoria" id="categoria"/>
			<br>
			<br>
			<input type="submit" value="Insertar"/>
		</fieldset> 
	</form>
	
	<script type="text/javascript">
		function validacionCampos() {
			var isbn = document.getElementById("isbn");
			var formularioLibro = document.getElementById("formularioLibro");
			
			if(isbn.value==""){
				alert("datos no validos");
				return false;
			}else{
				formularioLibro.submit();
			}
		}
	</script>
</body>
</html>
