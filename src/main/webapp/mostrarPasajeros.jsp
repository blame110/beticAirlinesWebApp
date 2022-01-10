<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="model.pasajeroVO"%> 
<%@page import="model.pasajeroDAO"%> 
<%@page import="java.util.ArrayList"%> 
   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/beticAirlinesWebApp/css/style.css" />
 
<meta charset="ISO-8859-1">
<title>Listado de Pasajeros</title>
</head>
<body>

<%

//Variables para guardar los datos de los pasajeros
pasajeroVO temporal = new pasajeroVO();
pasajeroDAO gestorPasajeros= new pasajeroDAO();

//Sacamos los pasajeros de BD en el arraylist
ArrayList<pasajeroVO> listaPasajeros = gestorPasajeros.cargarPasajeros();

String idioma = request.getParameter("idioma");
%>

	<div class="container">
		<table class="styled-table">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Edad</th>
					<th>Nif</th>
					<th>Bussiness</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
	

<%
//Recorremos los pasajeros
for (int i=0;i< listaPasajeros.size();i++)
{
	//Para cada pasajero creamos una fila
	out.println("<tr>");
	
	out.println("<td>" + listaPasajeros.get(i).getNombre()+ "</td>");
	out.println("<td>" + listaPasajeros.get(i).getEdad()+ "</td>");
	out.println("<td>" + listaPasajeros.get(i).getDni()+ "</td>");
	out.println("<td>");
	
	if (listaPasajeros.get(i).isBusiness())
			out.println("Afiliado");
		else
			out.println("No Afiliado");
	

	out.println("</td>");
	
	//Botton Eliminar
	out.println("<td>");
	
	out.println("<form action='/beticAirlinesWebApp/eliminarPasajero'>");
	
	
	out.println("<input type=\"submit\" value=\"Eliminar\">");
	out.println("<input type=\"hidden\" name=\"idPasajero\" value=\""+ listaPasajeros.get(i).getIdPasajero()+ "\">");
	
	out.println("</form>");
	out.println("</td>");
	
	//Botton Modificar
	out.println("<td>");
	
	out.println("<form action='/beticAirlinesWebApp/modificarPasajero.jsp'>");
	
	
	out.println("<input type=\"submit\" value=\"Modificar\">");
	out.println("<input type=\"hidden\" name=\"idPasajero\" value=\""+ listaPasajeros.get(i).getIdPasajero()+ "\">");
	
	out.println("</form>");
	out.println("</td>");

	
	//Cerramos la etiqueta de la fila
	out.println("</tr>");

}



%>

</tbody>
</table>
</div>


</body>
</html>