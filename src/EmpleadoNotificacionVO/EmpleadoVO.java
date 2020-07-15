/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EmpleadoNotificacionVO;
import java.util.Date;



/**
 *
 * @author Richard
 */
public class EmpleadoVO {
    
    private int idempleado;
    private String nombreempleado;
    private String periodo;
    private Date fecha;
    private String paterno;
    private String materno;
    private String correo;


    public EmpleadoVO() {
        this.idempleado = idempleado;
        this.nombreempleado = nombreempleado;
        this.periodo = periodo;
        this.fecha = fecha; 
        this.paterno = paterno;
        this.materno = materno;
        this.correo = correo;

    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(int idempleado) {
        this.idempleado = idempleado;
    }

    public String getNombreempleado() {
        return nombreempleado;
    }

    public void setNombreempleado(String nombreempleado) {
        this.nombreempleado = nombreempleado;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        
        this.fecha = fecha;
    }
    

}
