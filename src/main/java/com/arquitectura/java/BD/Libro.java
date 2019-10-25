package com.arquitectura.java.BD;

import java.util.List;

public class Libro {
	
	private String isbn;
	private String titulo;
	private String categoria;
	
	public Libro(String isbn) {
		this.isbn = isbn;
	}
	
	public Libro() {
		
	}
	
	public Libro(String isbn, String titulo, String categoria) {
		this.isbn = isbn;
		this.titulo = titulo;
		this.categoria = categoria;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCategoria() {
		return categoria;
	}
	

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	public void insertar() {
		DataBaseHelper obj1 = new DataBaseHelper();
		String consultaSQL = "INSERT INTO libro(isbn,titulo,categoria)VALUES";
		consultaSQL += "('"+isbn+"','"+titulo+"','"+categoria+"')";
		obj1.modificaRegistro(consultaSQL);
	}
	
	public void modificar() {
		String consultaSQL = "UPDATE libro SET titulo='"+ this.titulo +"', categoria='"+  categoria +"' WHERE isbn ='"+ isbn +"'";
		DataBaseHelper<Libro> obj1 = new DataBaseHelper<Libro>();
		obj1.modificaRegistro(consultaSQL);
	}
	
	public void borrar() {
		DataBaseHelper<Libro> obj1 = new DataBaseHelper<Libro>();
		String consultaSQL = "DELETE FROM libro where isbn = '"+ this.isbn +"'";
		obj1.modificaRegistro(consultaSQL);
	}
	
	public static List<Libro> buscarTodos(){
		String consultaSQL = "Select isbn,titulo,categoria from libro";
	    DataBaseHelper<Libro> helper = new DataBaseHelper<Libro>();
	    List<Libro> listaLibros = helper.seleccionaRegistros(consultaSQL, Libro.class);
	    return listaLibros;
	}
	
	public static List<String> buscarTodasLasCategorias(){
		DataBaseHelper<String> obj1 = new DataBaseHelper<String>();
		String consultaSQL = "select distinct(categoria) as categoria from Libro"; 
		List<String> listaDeCategorias = obj1.seleccionaRegistros(consultaSQL, String.class);
		return listaDeCategorias;
	}
	
	public static Libro buscarPorClave(String isbn){
		String consultaSQL = "SELECT isbn,titulo,categoria FROM Libro WHERE isbn ='"+ isbn +"'";
		DataBaseHelper<Libro> obj1 = new DataBaseHelper<Libro>();
		List<Libro> listaPorClave = obj1.seleccionaRegistros(consultaSQL,Libro.class);
		return listaPorClave.get(0);
	}
	
	public static List<Libro> buscarPorCategoria(String categoria){
		String consultaSQL = "select isbn,titulo,categoria from Libro where categoria ='"+ categoria+"'";
		DataBaseHelper<Libro> obj1 = new DataBaseHelper<Libro>();
		List<Libro> listaDeLibros = obj1.seleccionaRegistros(consultaSQL, Libro.class);
		return listaDeLibros;
	}
	
}
