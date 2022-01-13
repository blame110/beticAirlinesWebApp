<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/beticAirlinesWebApp/css/style.css" />
<%@page import="model.pasajeroVO"%> 
<%@page import="model.pasajeroDAO"%> 
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//Variables para guardar los datos de los pasajeros
pasajeroVO pasajero = new pasajeroVO();
pasajeroDAO gestorPasajeros= new pasajeroDAO();
int idPasajero = Integer.parseInt(request.getParameter("idPasajero"));

//Sacamos los pasajeros de BD en el arraylist
pasajero = gestorPasajeros.cargarPasajero(idPasajero);
%>

<div class="container">
		<form action="/beticAirlinesWebApp/modificarPasajero" method="post">


			<label for="fname">Nombre</label> 
			
			<input type="text" id="fname" name="nombre" value="<% out.print(pasajero.getNombre()); %>"> 

			<select id="country" name="edad">
				<%
				for (int i=0;i<=150;i++)
				{
					
					out.print("<option value=" + i);
					
					//Si la edad es la de nuestro pasajero sale selecionada
					if (i==pasajero.getEdad())
						out.println(" selected");
					
					out.println(">" + i +"</option>");
					
				}
				
				%>
			</select> 
			
			<label for="fdni">Dni</label> 
			
			<input type="text" id="fdni" name="dni" value="<% out.print(pasajero.getDni()); %>"/> 
		
			<label for="fbus">Business</label> 
			
			<input  id="fbus" type="checkbox" name="business" 
			<% 
			//Si el pasajero es business el check queda marcado
			if (pasajero.isBusiness()) 
				out.print(" checked"); 
			%>
			/>
		
			<input type="hidden" name="idPasajero" value="<%out.print(idPasajero);%>"/>
			<input type="submit" value="Modificar">

		</form>
	</div>

</body>
</html>