/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tabla;

import DAO.NotificacionDAO;
import EmpleadoNotificacionVO.EmpleadoVO;
import java.util.ArrayList;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Richard
 */
public class Tabla_EmpleadoVO {
    
   NotificacionDAO dao = null; 
   
    public void visualizar_ProductoVO(JTable tabla){
        
        tabla.setDefaultRenderer(Object.class, new Render());
        DefaultTableModel dt = new DefaultTableModel(){
            public boolean isCellEditable(int row, int column){
                return false;
            }
        };    
        dt.addColumn("idempleado");
        dt.addColumn("nombreempleado");
        dt.addColumn("periodo");
        dt.addColumn("fecha");
        dt.addColumn("Modificar");
        dt.addColumn("Eliminar");
        
        JButton btn_modificar = new JButton("Modificar");
        btn_modificar.setName("m");
        JButton btn_eliminar = new JButton("Eliminar");
        btn_eliminar.setName("e");

 
        dao = new NotificacionDAO();
        EmpleadoVO vo = new EmpleadoVO();
        ArrayList<EmpleadoVO> list = dao.Listar_ProductoVO();

        if(list.size() > 0){
            for(int i=0; i<list.size(); i++){
                Object fila[] = new Object[6];
                vo = list.get(i);
                fila[0] = vo.getIdempleado();
                fila[1] = vo.getNombreempleado();
                fila[2] = vo.getPeriodo();
                fila[3] = vo.getFecha();
                fila[4] = btn_modificar;
                fila[5] = btn_eliminar;
                dt.addRow(fila);
            }
            tabla.setModel(dt);
            tabla.setRowHeight(20);
        }
    }
    
       public void visualizar_NombreVO(JTable tabla, String t){
        
        tabla.setDefaultRenderer(Object.class, new Render());
        DefaultTableModel dt = new DefaultTableModel(){
            public boolean isCellEditable(int row, int column){
                return false;
            }
        };    
        dt.addColumn("idempleado");
        dt.addColumn("nombreempleado");
        dt.addColumn("periodo");
        dt.addColumn("fecha");
        dt.addColumn("Modificar");
        dt.addColumn("Eliminar");
        
        JButton btn_modificar = new JButton("Modificar");
        btn_modificar.setName("m");
        JButton btn_eliminar = new JButton("Eliminar");
        btn_eliminar.setName("e");
 
        dao = new NotificacionDAO();
        EmpleadoVO vo = new EmpleadoVO();
        System.out.println("nombre: "+t);
        ArrayList<EmpleadoVO> list = dao.Listar_Empleado_Nombre(t);

        if(list.size() > 0){
            for(int i=0; i<list.size(); i++){
                Object fila[] = new Object[6];
                vo = list.get(i);
                fila[0] = vo.getIdempleado();
                fila[1] = vo.getNombreempleado();
                fila[2] = vo.getPeriodo();
                fila[3] = vo.getFecha();
                fila[4] = btn_modificar;
                fila[5] = btn_eliminar;
                dt.addRow(fila);
            }
            tabla.setModel(dt);
            tabla.setRowHeight(20);
        }
    }

       public void visualizar_FechaVO(JTable tabla, String t){
        
        tabla.setDefaultRenderer(Object.class, new Render());
        DefaultTableModel dt = new DefaultTableModel(){
            public boolean isCellEditable(int row, int column){
                return false;
            }
        };    
        dt.addColumn("idempleado");
        dt.addColumn("nombreempleado");
        dt.addColumn("periodo");
        dt.addColumn("fecha");
        dt.addColumn("Modificar");
        dt.addColumn("Eliminar");
        
        JButton btn_modificar = new JButton("Modificar");
        btn_modificar.setName("m");
        JButton btn_eliminar = new JButton("Eliminar");
        btn_eliminar.setName("e");
 
        dao = new NotificacionDAO();
        EmpleadoVO vo = new EmpleadoVO();
        System.out.println("nombre: "+t);
        ArrayList<EmpleadoVO> list = dao.Listar_Empleado_Fecha(t);

        if(list.size() > 0){
            for(int i=0; i<list.size(); i++){
                Object fila[] = new Object[6];
                vo = list.get(i);
                fila[0] = vo.getIdempleado();
                fila[1] = vo.getNombreempleado();
                fila[2] = vo.getPeriodo();
                fila[3] = vo.getFecha();
                fila[4] = btn_modificar;
                fila[5] = btn_eliminar;
                dt.addRow(fila);
            }
            tabla.setModel(dt);
            tabla.setRowHeight(20);
        }
    }
}
