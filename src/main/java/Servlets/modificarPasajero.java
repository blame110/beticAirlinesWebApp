package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pasajeroDAO;
import model.pasajeroVO;

/**
 * Servlet implementation class modificarPasajero
 */
@WebServlet("/modificarPasajero")
public class modificarPasajero extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarPasajero() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		pasajeroVO pasajero = new pasajeroVO();
		PrintWriter out = response.getWriter();
		pasajeroDAO gestionPasajeros = new pasajeroDAO();
		
		//Recuperamos del jsp los valores del pasajero y los asignamos a nuestro pasajeroVO
		pasajero.setNombre(request.getParameter("nombre"));
		pasajero.setEdad(Integer.parseInt(request.getParameter("edad")));
		pasajero.setIdPasajero(Integer.parseInt(request.getParameter("idPasajero")));
		
		//Si el checkbox esta marcado nos devolvera on, en cuyo caso ponemos a true el campo
		if (request.getParameter("business")!=null && request.getParameter("business").equals("on"))
			pasajero.setBusiness(true);
		else 
			pasajero.setBusiness(false);
		
		pasajero.setDni(request.getParameter("dni"));
		
		//Modificamos el pasajero
		if (gestionPasajeros.modificarPasajero(pasajero, pasajero.isBusiness()))
			out.println("El pasajero ha sido modificado correctamente");
		else
			out.println("Ha habido un problema al modificar el pasajero");
		
		//Esperamos 3 segundos
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/mostrarPasajeros.jsp").forward(request, response);
	}
	
	//Modificamos el pasajero
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
