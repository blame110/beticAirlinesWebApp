package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utils.ConexionBD;

public class LoginDAO {
	
	public static final int NUM_INTENTOS = 3;

	/**
	 * Recibe un usuario y una contraseña y las contrasta con la BD
	 * @param usuario
	 * @param passwd
	 * @return true si la contraseña y el usuario son correctos
	 */
	public static boolean comprobarCredenciales(String usuario, String password)
	{
		
		
		
		// Variables
		ResultSet res;

		PreparedStatement pstmt;
		
		// Conectamos a la base de datos
		Connection con = ConexionBD.conectarBD();

		try {

			//Generamos el preparedstatement con la query
			pstmt = con.prepareStatement("SELECT * FROM USUARIOS WHERE nombre = ?");

			//Ponemos el parametro del usuario
			pstmt.setString(1, usuario);
			
			res = pstmt.executeQuery();
			
			// Si el resulset no esta vacio creamos el pasajeroVO
			if (res.next()) {
				if (password.equals(res.getString("upassword")))
				{
					return true;
				}
					
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
			
		}
	
		return false;
	}

}
