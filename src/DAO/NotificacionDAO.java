/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conectar;
import EmpleadoNotificacionVO.EmpleadoVO;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

import javax.swing.JOptionPane;




/**
 *
 * @author Richard
 */
public class NotificacionDAO {
    
    public ArrayList<EmpleadoVO> Listar_ProductoVO(){
        ArrayList<EmpleadoVO> list = new ArrayList<EmpleadoVO>();
        Conectar conec = new Conectar();
        String sql = "SELECT * FROM empleado";
        ResultSet rs = null;
        PreparedStatement ps = null;

        try{

            ps = conec.getConnection().prepareStatement(sql);
            
            rs = ps.executeQuery();
            

            while(rs.next()){
                EmpleadoVO vo = new EmpleadoVO();
                vo.setIdempleado(rs.getInt(1));
                vo.setNombreempleado(rs.getString(2));
                vo.setPeriodo(rs.getString(3));
                vo.setFecha(rs.getDate(4));

                list.add(vo);
            }
        }catch(SQLException ex){
            System.out.println("Error SQL N-DAO: " +ex.getMessage());
        }catch(Exception ex){
            System.out.println("Error N-DAO excepcion: " +ex.getMessage());
        }finally{
            try{
                ps.close();
                rs.close();
                conec.desconectar();
            }catch(Exception ex){}
        }
        return list;
    }
 
    public ArrayList<EmpleadoVO> Listar_Empleado_Nombre(String t){
        ArrayList<EmpleadoVO> list = new ArrayList<>();
        Conectar conec = new Conectar();
        String sqlInsert;
        sqlInsert= "SELECT * FROM empleado  WHERE nombreempleado ='"+t+"';";
        //sqlInsert= "SELECT * FROM dblink('dbname=cajayolo15 host=127.0.0.1 user=postgres password=root1234','select nombre from sujeto') AS t1(nombre name)WHERE nombre = '"+t+"';";
        ResultSet rs = null;
        PreparedStatement ps = null;
  
        System.out.println("query: "+sqlInsert);
        
        try{

            ps = conec.getConnection().prepareStatement(sqlInsert);     
            rs = ps.executeQuery();
            
            while(rs.next()){
               EmpleadoVO vo = new EmpleadoVO();
                vo.setIdempleado(rs.getInt(1));
                vo.setNombreempleado(rs.getString(2));
                vo.setPeriodo(rs.getString(3));
                vo.setFecha(rs.getDate(4));
                list.add(vo);
            }
            
        }catch(SQLException ex){
            System.out.println("Error SQL N-DAO: " +ex.getMessage());
        }catch(Exception ex){
            System.out.println("Error N-DAO excepcion: " +ex.getMessage());
        }finally{
            try{
                ps.close();
                conec.desconectar();

            }catch(Exception ex){}
        }
        return list;
    }

/*Metodo agregar*/
  public void Agregar_ProductoVO(EmpleadoVO vo){
        Conectar conec = new Conectar();
       // String sql = "INSERT INTO empleado ( nombreempleado, periodo, fecha)";
        
        String sqlInsert= new String();
        sqlInsert= "INSERT INTO empleado(nombreempleado, periodo, fecha)";
        
       // PreparedStatement ps = null;
        Statement s=null;
        try{  
              //ps = conec.getConnection().prepareStatement(sqlInsert);
             s=conec.getConnection().createStatement();
            /*
            ps.setString(1, vo.getNombreempleado());
            ps.setString(2, vo.getPeriodo());
            ps.setDate(3, convert(vo.getFecha()));
            ps.executeUpdate();
            */
        sqlInsert= sqlInsert+" VALUES ('"+vo.getNombreempleado()+"', '"+vo.getPeriodo()+"', '"+vo.getFecha()+"')";
        s.execute(sqlInsert);
        JOptionPane.showMessageDialog(null, "Resgirtro exitoso");
            
        }catch(SQLException ex){
               System.out.println("Error SQL N-DAO: " +ex.getMessage());
        }catch(Exception ex){
            System.out.println("Error N-DAO excepcion: " +ex.getMessage());
        }finally{
            try{
                s.close();
                conec.desconectar();
            }catch(Exception ex){}
        }
    }
  public Date  convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }
/*Metodo Modificar*/
  public void Modificar_ProductoVO(EmpleadoVO vo){
        Conectar conec = new Conectar();
        
        String sql = "UPDATE empleado SET nombreempleado = ?, periodo = ?, fecha = ? WHERE idempleado = ?;";
          PreparedStatement ps = null;
        /*
        String sqlInsert= new String();
        sqlInsert= "UPDATE empleado  ";
        Statement s=null;
          */
        try{
            
            ps = conec.getConnection().prepareStatement(sql);
            ps.setString(1, vo.getNombreempleado());
            ps.setString(2, vo.getPeriodo());
            ps.setDate(3, convert( vo.getFecha()));
            ps.setInt(4, vo.getIdempleado());
            ps.executeUpdate();
           
           /*
        s=conec.getConnection().createStatement();
              
        sqlInsert= sqlInsert+" SET nombreempleado = '"+vo.getNombreempleado()+"',  periodo = '"+vo.getPeriodo()+"', fecha = '"+convert(vo.getFecha())+", WHERE idempleado = '"+vo.getIdempleado()+"';'";
        s.execute(sqlInsert);
        */
        JOptionPane.showMessageDialog(null, "Actualizacion exitosa");
        
        }catch(SQLException ex){
            System.out.println("sql erro: "+ex.getMessage());
        }catch(Exception ex){
            System.out.println("Excepcion erro: "+ex.getMessage());
        }finally{
            try{
                ps.close();
                conec.desconectar();
            }catch(Exception ex){}
        }
    }
/*Metodo Eliminar*/
    public void Eliminar_ProductoVO(EmpleadoVO vo){
        Conectar conec = new Conectar();
        String sql = "DELETE FROM empleado WHERE idEmpleado = ?;";
        PreparedStatement ps = null;
        try{
            ps = conec.getConnection().prepareStatement(sql);
            ps.setInt(1, vo.getIdempleado());
            ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                ps.close();
                conec.desconectar();
            }catch(Exception ex){}
        }
    }
/*Metodo Buscar por Fecha*/
        public ArrayList<EmpleadoVO> Listar_Empleado_Fecha(String t){
        ArrayList<EmpleadoVO> list = new ArrayList<>();
        Conectar conec = new Conectar();
        String sqlInsert;
        sqlInsert= "SELECT * FROM empleado  WHERE fecha ='"+t+"';";
        ResultSet rs = null;
        PreparedStatement ps = null;
  
        System.out.println("query: "+sqlInsert);
        
        try{

            ps = conec.getConnection().prepareStatement(sqlInsert);     
            rs = ps.executeQuery();
            
            while(rs.next()){
               EmpleadoVO vo = new EmpleadoVO();
                vo.setIdempleado(rs.getInt(1));
                vo.setNombreempleado(rs.getString(2));
                vo.setPeriodo(rs.getString(3));
                vo.setFecha(rs.getDate(4));
                list.add(vo);
            }
            
        }catch(SQLException ex){
            System.out.println("Error SQL N-DAO: " +ex.getMessage());
        }catch(Exception ex){
            System.out.println("Error N-DAO excepcion: " +ex.getMessage());
        }finally{
            try{
                ps.close();
                conec.desconectar();

            }catch(Exception ex){}
        }
        return list;
    }
}