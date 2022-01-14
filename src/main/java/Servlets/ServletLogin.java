package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginDAO;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Recuperamos las credenciales del login
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		int numIntentos = Integer.parseInt(request.getParameter("numIntentos"));
		
		HttpSession sesion = request.getSession();
		
		
		if (LoginDAO.comprobarCredenciales(usuario, password))
		{
			//Si las credenciales estan bien mostramos los pasajeros
			
			request.getRequestDispatcher("/mostrarPasajeros.jsp").forward(request, response);
		}
		else
		{
			//Si falla el login tiene un intento menos
			numIntentos--;
			sesion.setAttribute("numIntentos", numIntentos);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}