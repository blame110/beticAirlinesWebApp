package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import utils.*;


/**
 * Servlet implementation class eliminarPasajero
 */
@WebServlet("/eliminarPasajero")
public class eliminarPasajero extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public eliminarPasajero() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Creamos el objeto para escribir en el navegador
		PrintWriter hOut = new PrintWriter(response.getWriter());

		// Escribimos la cabecera
		hOut.println("<html><head><title>Eliminar</title></head><body>");

		// Recibimos el id de pasajero introducido en el formulario
		String idPasajero = request.getParameter("idPasajero");
		
		String idioma = request.getParameter("idioma");

		hOut.println("El id de pasajero recibido es: " + idPasajero);
		hOut.println("El idioma recibido es: " + idioma);

		// Comprobamos que es un número y si no lo es mostramos un mensaje
		if (Validar.esNumero(idPasajero)) {
			//Si devuelve 1 se ha eliminado sino es que no existe ese id
		if (pasajeroDAO.eliminarPasajero(Integer.valueOf(idPasajero)) == 1)
				hOut.println("<br>El pasajero ha sido Eliminado Correctamente");
			else
				hOut.println("El pasajero no existe");

		} else
			hOut.println("El id de pasajero no es númerico");

		hOut.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
