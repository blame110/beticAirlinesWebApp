<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/beticAirlinesWebApp/css/style.css" />
<%@page import="model.LoginDAO"%>
<%@page import="javax.servlet.http.HttpSession"%>


<meta charset="ISO-8859-1">
<title>Gestión de Pasajeros</title>
</head>
<body>

	<div class="container">
		<form action="/beticAirlinesWebApp/ServletLogin" method=post>

			<%
			//Recuperamos el numintentos del servlet del objeto sesion
			int numIntentos = -1;
			
			//Si el atributo numIntentos esta en la sesion
			//Lo guardamos en nuestra variables
			if (request.getAttribute("numIntentos")!=null)
				numIntentos = (int)request.getAttribute("numIntentos");
			
			//Si el servlet nos ha devuelto el número de intentos
			//Implica que el login ha fallado
			if (numIntentos != -1) {
				if (numIntentos == 0)
					out.println("<label>Espere 60 segundos antes de volver a intentarlo</label><br/>");
				else
					out.println("<label>Contraseña incorrecta, tienes " + numIntentos + " mas</label><br/>");
			}
			else
				//Si es la primera vez le damos tres intentos
				numIntentos = LoginDAO.NUM_INTENTOS;
			%>

			<label for="fusuario">Usuario:</label> <input type="text"
				id="fusuario" name="usuario" placeholder="Nombre Usuario..">

			<label for="fpasswd">Password:</label> <input type="text" id="fpasswd"
				name="password" placeholder="Contrasenia... "> <label>¿Olvidaste
				la contraseña?</label> <input type="submit" value="Entrar">
				
			<input type="hidden" name="numIntentos" value=<%out.println(numIntentos); %>>

		</form>
	</div>


</body>
</html>