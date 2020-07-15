/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

/**
 *
 * @author Richard
 */

import java.sql.*;

public class Conectar{

    static String bd = "prueba01";
    static String login = "postgres";
    static String password = "root1234";
    static String url = "jdbc:postgresql://localhost:5432/prueba01";
    Connection connection=null;
  

    public Conectar(){
        System.out.println("Estado: "+connection);

        try{
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection(url,login,password);
       

        if (connection!=null){
            System.out.println("Conexión a base de datos "+bd+" OK\n");
        }
        }catch(SQLException ex){
            System.out.println("sql excepcion: "+ ex.getMessage());
        }catch(Exception ex){
            System.out.println("Error excepcion: "+ex.getMessage());
        }
    }

    public Connection getConnection(){
        return connection;
    }

    public void desconectar(){
        connection = null;
    }



}
