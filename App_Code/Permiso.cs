public class Permiso
{
    private int id;
    private int idRol;
    private string nombre;
    private string pagina;

    public Permiso(int id, int idRol, string nombre, string pagina, bool acceso, bool edicion, bool eliminacion, bool creacion)
    {
        this.id = id;
        this.idRol = idRol;
        this.nombre = nombre;
        this.pagina = pagina;
        Acceso = acceso;
        Edicion = edicion;
        Eliminacion = eliminacion;
        Creacion = creacion;
    }

    public bool Acceso { get; internal set; }
    public bool Creacion { get; internal set; }
    public bool Edicion { get; internal set; }
    public bool Eliminacion { get; internal set; }
}