using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Faena
/// </summary>
public class Faena
{
    public string cliente;
    public string desc;
    public string empresa;
    public string estado;
    public string nombre;
    public int id;

    public Faena()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Faena(int v, string nombre, string cliente, string empresa, string desc, string estado)
    {
        this.id = v;
        this.nombre = nombre;
        this.cliente = cliente;
        this.empresa = empresa;
        this.desc = desc;
        this.estado = estado;
    }
}