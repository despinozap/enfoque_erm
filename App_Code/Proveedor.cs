using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class Proveedor
{
    public int cod { get; set; }
    public string sap { get; set; }
    public string rut { get; set; }
    public string nombre { get; set; }
    public string apellido { get; set; }
    public string direccion { get; set; }
    public string fono { get; set; }
    //public string formadepago { get; set; }
    public string estado { get; set; }
    public DateTime fecha { get; set; }
    public string razonsocial { get; set; }
    public string mail { get; set; }
    public string descripcion { get; set; }

    public Proveedor(int cod, string sap, string rut, string nombre, string apellido, string direccion, string fono, string estado, DateTime fecha, string razonsocial,string mail, string descripcion)
    {
        // TODO: Complete member initialization
        this.cod = cod;
        this.sap = sap;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.fono = fono;
        this.estado = estado;
        this.fecha = fecha;
        this.razonsocial = razonsocial;
        this.mail = mail;
        this.descripcion = descripcion;
    }
}
