using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class Trabajador
{
    public int id {get;set;}
    public string rut { get; set; }
    public string nombre { get; set; }
    public string apellido { get; set; }
    public string mail { get; set; }
    public string cargo { get; set; }
    public string estado { get; set; }
    public DateTime fecha { get; set; }
    public string descripcion { get; set; }

    public Trabajador(int p, string rut, string nombre, string apellido, string mail, string cargo, string estado, DateTime fecha, string descripcion)
    {
        // TODO: Complete member initialization
        this.id = p;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.cargo = cargo;
        this.estado = estado;
        this.fecha = fecha;
        this.descripcion = descripcion;
    }
}
