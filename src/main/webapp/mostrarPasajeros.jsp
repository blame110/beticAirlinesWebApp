<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="model.pasajeroVO"%> 
<%@page import="model.pasajeroDAO"%> 
<%@page import="java.util.ArrayList"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado de Pasajeros</title>
</head>
<body>

<%
pasajeroVO temporal = new pasajeroVO();

pasajeroDAO gestorPasajeros= new pasajeroDAO();

ArrayList<pasajeroVO> listaPasajeros = gestorPasajeros.cargarPasajeros();

for (int i=0;i< listaPasajeros.size();i++)
{
	out.println(listaPasajeros.get(i).getNombre()+ "<br/>");
}



%>


</body>
</html>