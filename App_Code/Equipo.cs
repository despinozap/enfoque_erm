using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class Equipo
{
    public string id {get;set;}
    public string sap { get; set; }
    public string cod { get; set; }
    public string precioCompra { get; set; }
    public DateTime fechaCompra { get; set; }
    public string modelo { get; set; }
    public string familia { get; set; }
    public string descripcion { get; set; }
    public string numeroSerie { get; set; }
    public string proveedor { get; set; }
    public Boolean estado { get; set; }
    public string horometro { get; set; }
    public DateTime fechaHorometro { get; set; }
    public DateTime fecha { get; set; }
    public string nombre { get; set; }
    public string tipo { get; set; }
    public string uEstado { get; set; }

    //public Equipo(string id, string sap, string cod, DateTime fechaCompra, string precioCompra, string nombre, 
    //    string tipo, Boolean estado, string descripcion, string numeroSerie, string proveedor, string horometro, 
    //    DateTime fechaHorometro, DateTime fecha)
    //{
    //    // TODO: Complete member initialization
    //    this.id = id;
    //    this.sap = sap;
    //    this.cod = cod;
    //    this.fechaCompra = fechaCompra;
    //    this.precioCompra = precioCompra;
    //    this.nombre = nombre;
    //    this.tipo = tipo;
    //    this.estado = estado;
    //    this.descripcion = descripcion;
    //    this.numeroSerie = numeroSerie;
    //    this.proveedor = proveedor;
    //    this.horometro = horometro;
    //    this.fechaHorometro = fechaHorometro;
    //    this.fecha = fecha;
    //    //this.categoria = "";
    //}

    public Equipo(string id, string sap, string cod, DateTime fechaCompra, string precioCompra, string nombre, 
        string tipo, bool estado, string descripcion, string numeroSerie, string proveedor, string horometro, 
        DateTime fechaHorometro, String modelo, DateTime fecha, string uEstado, string familia)
    {
        // TODO: Complete member initialization
        this.id = id;
        this.sap = sap;
        this.cod = cod;
        this.fechaCompra = fechaCompra;
        this.precioCompra = precioCompra;
        this.nombre = nombre;
        this.tipo = tipo;
        this.estado = estado;
        this.descripcion = descripcion;
        this.numeroSerie = numeroSerie;
        this.proveedor = proveedor;
        this.horometro = horometro;
        this.fechaHorometro = fechaHorometro;
        this.modelo = modelo;
        this.fecha = fecha;
        this.uEstado = uEstado;
        this.familia = familia;
    }


}
