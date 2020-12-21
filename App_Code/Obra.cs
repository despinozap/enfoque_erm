using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Obra
/// </summary>
public class Obra
{
    public int id { get; set; }
    public string nombre { get; set; }
    public string ciudad { get; set; }
    public string direccion { get; set; }
    public string observacion { get; set; }
    public DateTime fecha { get; set; }
    public bool estado { get; set; }
    public int empresa_id { get; set; }

	public Obra()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public Obra(int _id, string _nombre, string _ciudad, string _direccion, 
                string _observacion, DateTime _fecha, bool _estado, int _empresa_id)
    {
        this.id = _id;
        this.nombre = _nombre;
        this.ciudad = _ciudad;
        this.observacion = _observacion;
        this.fecha = _fecha;
        this.estado = _estado;
        this.empresa_id = _empresa_id;
    }
}