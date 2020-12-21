using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Empresa
/// </summary>
public class Empresa
{
    public int activo;

    public string alias {get; set; }
    public string desc { get; set; }
    public int id {get; set; }
    public string razonsocial {get; set; }
    public string rut {get; set; }
    public string contactos { get; set; }
    public string obras { get; set; }

    public Empresa()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Empresa(int id, string razonsocial, string rut, string alias, string desc)
    {
        this.id = id;
        this.razonsocial = razonsocial;
        this.rut = rut;
        this.alias = alias;
        this.desc = desc;
    }

    public Empresa(int id, string razonsocial, string rut, string alias, string desc, string contactos, string obras)
    {
        this.id = id;
        this.razonsocial = razonsocial;
        this.rut = rut;
        this.alias = alias;
        this.desc = desc;
        this.contactos = contactos;
        this.obras = obras;
    }
}