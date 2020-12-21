public class User
{
    private int idrol;
    private bool activo;

    public string Rut { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Mail { get; set; }
    public int idRol { get; set; }
    public string Rol { get; set; }
    public string Tipo {get; set;}
    public bool rActivo { get; set; }
    public bool uActivo { get; set; }
    public string Pass { get; set; }
    public string Usuario { get; set; }
    public string descripcion { get; set; }

    public User(string rut, string nombre, string apellido, string mail, int idrol, string rol, string tipo, bool uActivo,bool rActivo, string pass, string usuario, string descripcion)
    {
        this.Rut =rut;
        this.Nombre =nombre;
        this.Apellido =apellido;
        this.Mail =mail;
        this.idRol =idrol;
        this.Rol =rol;
        this.Tipo=tipo;
        this.uActivo=uActivo;
        this.rActivo = rActivo;
        this.Pass = pass;
        this.Usuario = usuario;
        this.descripcion = descripcion;
    }

    public string strEstado { get { return (uActivo && rActivo ? "Activo" : "Bloqueado"); } }
}