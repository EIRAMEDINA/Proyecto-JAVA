package com.arquitectura.java.BD;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataBaseHelper<T> {
	
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String USUARIO = "apps";
	public static final String PASSWORD = "apps";
	public static final String URL = "jdbc:mysql://localhost:3306/practicas?serverTimezone=UTC";
	
	
	//METODO QUE GESTIONA LOS INSERT, UPDATE Y DELETE
	public int modificaRegistro(String consultaSQL) {
		
		Connection conexion = null;
		Statement sentencia = null;
		int filasAfectadas = 0;
		
		try {
			Class.forName(DRIVER);
			conexion = DriverManager.getConnection(URL, USUARIO, PASSWORD);
			sentencia = conexion.createStatement();
			filasAfectadas = sentencia.executeUpdate(consultaSQL);
			System.out.print("Insertando datos a base de datos....." + filasAfectadas);
		}catch (ClassNotFoundException e) {
			System.out.print("Error en dependencia maven !!!!" + e.getMessage());
		}catch (SQLException e) {
			System.out.print("Error al acceder a la Base de datos!!!!" + e.getMessage());
		}
		finally {
			if(sentencia != null) {
				try {
					sentencia.close();
				}catch (SQLException e) {}
			}
			if(conexion != null) {
				try {
					conexion.close();
				}catch (SQLException e) {}
			}
		}
		return filasAfectadas;
	}
	
	//METODO QUE GESTIONA LA LISTA DE LOS RESULTADOS 
	public List<T> seleccionaRegistros(String consultaSQL, Class clase){
		
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet filas = null;
		List<T> listaDeObjetos = new ArrayList<T>();
		
		try {
			Class.forName(DRIVER);
			conexion = DriverManager.getConnection(URL, USUARIO, PASSWORD);
			sentencia = conexion.createStatement();
			filas = sentencia.executeQuery(consultaSQL);
			
			while(filas.next()) {
				T objeto = (T) Class.forName(clase.getName()).newInstance();
				Method[] metodos = objeto.getClass().getDeclaredMethods();
				
				for(int i=0; i<metodos.length; i++) {
					if(metodos[i].getName().startsWith("set")) {
						metodos[i].invoke(objeto, filas.getString(metodos[i].getName().substring(3)));
					}
					if(objeto.getClass().getName().equals("java.lang.String")) {
						objeto=(T)filas.getString(1);
					}
				}
				listaDeObjetos.add(objeto);
			}
		}catch (Exception e) {
			System.out.print("Error al acceder a los datos");
		}
		finally {
			if(sentencia != null) {
				try {
					sentencia.close();
				}catch (SQLException e) {
					System.out.print("Error al cerrar la centencia!!!" + e.getMessage());
				}
			}
			if(conexion != null) {
				try {
					conexion.close();
				}catch (SQLException e) {
					System.out.print("Error al cerrar la conexion!!!" + e.getMessage());
				}
			}
		}
		return listaDeObjetos;
	}
}


