public class Rol
{
    public bool activo;
    internal object id;
    private string descripcion;
    public int idRol;
    private bool mostrar;
    private string nombre;

    public Rol(int idRol, string nombre, string descripcion, bool activo, bool mostrar)
    {
        this.idRol = idRol;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.activo = activo;
        this.mostrar = mostrar;
    }
}