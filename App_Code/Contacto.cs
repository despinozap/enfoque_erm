using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Contacto
/// </summary>
public class Contacto
{
    public int id { get; set; }
    public string area { get; set; }
    public string nombre { get; set; }
    public string email { get; set; }
    public string telefono { get; set; }
    public string celular { get; set; }
    public string direccion { get; set; }
    public string observacion { get; set; }
    public string ciudad { get; set; }
    public DateTime fecha { get; set; }
    public bool estado { get; set; }
    public int empresa_id { get; set; }

	public Contacto()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public Contacto(int _id, string _area, string _nombre, string _email, string _telefono,
                    string _celular, string _direccion, string _observacion, string _ciudad, 
                    DateTime _fecha, bool _estado, int _empresa_id)
    {
        this.id = _id;
        this.area = _area;
        this.nombre = _nombre;
        this.email = _email;
        this.telefono = _telefono;
        this.celular = _celular;
        this.direccion = _direccion;
        this.observacion = _observacion;
        this.ciudad = _ciudad;
        this.fecha = _fecha;
        this.estado = _estado;
        this.empresa_id = _empresa_id;
    }
}