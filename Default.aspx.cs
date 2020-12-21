using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.IsAuthenticated & Session["Login"] != null)
            {
                User usuario = (User)Session["Login"];
                Rol rol = Persistencia.getInstance().getRol(usuario.idRol);

                if (usuario.uActivo & rol.activo)
                {
                    Session["Login"] = usuario;
                    Response.Redirect("~/admin/home.aspx", true);
                }
            }
        }else
        {
            Session["intentos"] = 0;
            //FormsAuthentication.
        }
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        string usuario = txtUsuarioIn.Text;
        string pass = txtClaveIn.Text;
        pass = EncrSHA512.getSHA512(pass);
        int intentos = Convert.ToInt32(Session["intentos"]);
        if (Persistencia.getInstance().ValidateUser(usuario, pass))
        {
            User user = Persistencia.getInstance().getUser(usuario, pass);
            Rol rol = Persistencia.getInstance().getRol(user.idRol);
            Service servicio = new Service(user, "Login");


            if (user.uActivo & rol.activo)
            {
                Session["Login"] = user;
                Response.Redirect("~/admin/Home.aspx", true);
                Log log = new Log(0, DateTime.Now, user.Rut, user.Nombre, "Login", "ingreso", "ingreso ok", "ingreso al sistema", user.Usuario, "select");
            }
            else
            {
                Log log = new Log(0,DateTime.Now,user.Rut,user.Nombre,"login","ingreso","fallo ingreso","fallo en ingresar al sistema",user.Usuario,intentos.ToString());
            }
        }
    }
}