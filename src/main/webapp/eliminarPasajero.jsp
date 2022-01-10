<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<meta charset="ISO-8859-1">
<html>
<head>


<title>Eliminar Pasajero</title>

<link rel="stylesheet" type="text/css" href="/beticAirlinesWebApp/css/style.css" />
</head>
<body>

	<form action="/beticAirlinesWebApp/eliminarPasajero" method="post">
		<ul>
		
			<label for="name">Id Pasajero a Eliminar:</label> 
			<input	type="text" id="name" name="idPasajero"/>
			<input type="hidden" name="idioma" value="ESP" />
	
			<input type="submit" value="Eliminar"/>
		</ul>
	</form>

</body>
</html>