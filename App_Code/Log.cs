using System;

public class Log
{
    private string actividad;
    private string alias;
    private DateTime date;
    private int id;
    private string informacion;
    private string modulo;
    private string nombre;
    private string opcion;
    private string operacionAnterior;
    private string operacionNueva;
    private string rut;

    public Log(int id, DateTime date, string rut, string nombre, string modulo, string opcion, string operacion, string informacion, string alias, string actividad)
    {
        this.id = id;
        this.date = date;
        this.rut = rut;
        this.nombre = nombre;
        this.modulo = modulo;
        this.opcion = opcion;
        this.operacionNueva = operacion;
        this.informacion = informacion;
        this.alias = alias;
        this.actividad = actividad;
    }

    public Log(int id, DateTime date, string rut, string nombre, string modulo, string opcion, string operacionAnterior, string operacionNueva, string informacion, string alias, string actividad) : this(id, date, rut, nombre, modulo, opcion, operacionNueva, informacion, alias, actividad)
    {
        this.operacionAnterior = operacionAnterior;
    }
}