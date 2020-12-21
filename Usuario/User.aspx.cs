using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Data;

public partial class Usuario_User : System.Web.UI.Page
{
    private Service service;
    protected void Page_Load(object sender, EventArgs e)
    {
        service = new Service(Session["Login"], "User");
        if (!service.UserAccess()) { Response.Redirect("~/default.aspx"); }
        if (!IsPostBack)
        {
            //indexUpdate = 0;
            Session["Alert"] = "";
        }
        else
        {
        }
        cargarPermiso();
        CargarUser();
        CargarRol();
        //LimpiarCampos();
    }

    private void LimpiarCampos()
    {
        txtNewRut.Text = "";
        txtNewNombre.Text = "";
        txtNewApellido.Text = "";
        txtNewMail.Text = "";
        txtNewUsuario.Text = "";
        txtNewPass.Text="";

        txtUpdateRut.Text = "";
        txtUpdateNombre.Text = "";
        txtUpdateApellido.Text = "";
        txtUpdateMail.Text = "";
        txtUpdateUsuario.Text = "";
        txtUpdatePass.Text = "";

        hddRut.Value = "";
    }

    private void CargarRol()
    {
        DataSet ds =Persistencia.getInstance().getRoles();
        ddlUpdateRol.DataSource = ds;
        ddlUpdateRol.DataTextField = "nombre";
        ddlUpdateRol.DataValueField = "id";
        ddlUpdateRol.DataBind();
        ddlNewRol.DataSource = ds;
        ddlNewRol.DataTextField = "nombre";
        ddlNewRol.DataValueField = "id";
        ddlNewRol.DataBind();
    }

    private void cargarPermiso()
    {
        //AddNewUserBtn.Visible = service.UserInsert();
        //AcceptUpdateUserBtn.Visible = service.UserUpdate();
        //AcceptDeleteUserBtn.Visible = service.UserDelete();
    }

    private void CargarUser()
    {

        ArrayList ListaUser = Persistencia.getInstance().ListaUser();
        string[] ListaUsuario = new string[ListaUser.Count];
        string[] ListaMail = new string[ListaUser.Count];
        string[] ListaEmpresa = new string[ListaUser.Count];
        Session["ListaUser"] = ListaUser;
        BodyTable.Controls.Clear();
        for (int i = 0; i < ListaUser.Count; i++)
        {
            User user = (User)ListaUser[i];
            ListaUsuario[i] = user.Usuario;
            ListaMail[i] = user.Mail;

            HtmlGenericControl tr = new HtmlGenericControl("tr");
            tr.Attributes.Add("class", "gradeX");
            tr.Attributes.Add("value", i.ToString());

            HtmlGenericControl td;
            //------------------- RUT -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = user.Rut.ToString();
            tr.Controls.Add(td);
            //------------------- NOMBRE -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = user.Nombre;
            tr.Controls.Add(td);
            //------------------- APELLIDO -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = user.Apellido;
            tr.Controls.Add(td);
            //------------------- USUARIO -------------------\\
            /*
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = user.Usuario;
            tr.Controls.Add(td);
            //*/
            //------------------- TIPO -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 70px;");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = user.Mail;
            tr.Controls.Add(td);

            //------------------- ROL -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 70px;");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.Attributes.Add("Value", user.idRol.ToString());

            td.InnerText = user.Rol;
            tr.Controls.Add(td);

            //------------------- ESTADO -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px;");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerHtml = user.strEstado;
            tr.Controls.Add(td);

            //------------------- CONTROLS -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px; text-align: center;");
            //------------------- EDITAR -------------------\\
            LinkButton edit = new LinkButton();
            edit.Enabled = service.UserUpdate();
            edit.ID = "LinkEdit" + i;
            edit.Attributes.Add("onClick", @"return updateUser(event.currentTarget);");
            edit.Attributes.Add("rut", user.Rut);
            edit.Attributes.Add("nombre", user.Nombre);
            edit.Attributes.Add("apellido", user.Apellido);
            edit.Attributes.Add("rol", user.idRol.ToString());
            edit.Attributes.Add("tipo", user.Rol);
            edit.Attributes.Add("estado", user.uActivo? "Activo":"Bloqueado");
            edit.Attributes.Add("usuario", user.Usuario);
            edit.Attributes.Add("mail", user.Mail);
            //edit.Text = "<span class=\"button-content\"><i class=\"glyph-icon icon-pencil\"></i></span>";
            edit.Text = "<i class=\"fa fa-pencil\"></i>";
            edit.CommandArgument = i.ToString();// rol.Id.ToString();            
            edit.CssClass = "btn btn-info btn-sm";
            //edit.CssClass = "btn small bg-blue radius-all-2";
            //edit.Click += new EventHandler(this.LinkEdit_Click);

            td.Controls.Add(edit);
            //tr.Controls.Add(td);
            //------------------- ELIMINAR -------------------\\            
            //td = new HtmlGenericControl("td");
            //td.Attributes.Add("Style", "width: 40px; text-align: center;");
            LinkButton delete = new LinkButton();
            delete.Enabled = service.UserDelete();
            delete.Attributes.Add("onClick", @"return deleteUser(event.currentTarget);");
            delete.Attributes.Add("rut", user.Rut);
            delete.ID = "linkDel" + i;
            delete.Text = "<i class=\"fa fa-times\"></i>";
            delete.CommandArgument = user.Rut.ToString();// rol.Id.ToString();
            delete.CssClass = "btn btn-danger btn-sm new-modal-40";
            //delete.Style.Add("margin-left", "2px");
            //if (rol.Nombre.Equals("Default")) { delete.Enabled = false; delete.CssClass = "btn btn-link"; }
            //delete.Click += new EventHandler(this.LinkDel_Click);
            td.Controls.Add(delete);


            tr.Controls.Add(td);

            //------------------- END -------------------\\
            BodyTable.Controls.Add(tr);
        }
        Session["ListaUsuario"] = ListaUsuario;
        Session["ListaMail"] = ListaMail;
        Session["ListaEmpresa"] = ListaEmpresa;
    }

    protected void btnInsertOk_Click(object sender, EventArgs e)
    {
        try
        {
            string rut = txtNewRut.Text;
            string nombre = txtNewNombre.Text;
            string apellido = txtNewApellido.Text;
            string correo = txtNewMail.Text;
            string idRol = ddlNewRol.SelectedItem.Value;
            string rol = ddlNewRol.SelectedItem.Text;
            string usuario = txtNewUsuario.Text;
            string password = EncrSHA512.getSHA512(txtNewPass.Text);
            string estado = ddlUpdateEstado.SelectedItem.Value;
            bool rolActivo = Persistencia.getInstance().rolActivo(idRol);
            string descripcion = "";
            User user = new User(rut, nombre, apellido, correo, Convert.ToInt32(idRol), rol, rol, estado.Equals("1"), rolActivo, password, usuario,descripcion);

            Persistencia.getInstance().IngresarUsuario(user);
        }
        catch (SyntaxErrorException ex) { return; };
        Response.Redirect("user.aspx");

    }

    protected void btnUpdateOk_Click(object sender, EventArgs e)
    {
        try
        {
            string rut = hddRut.Value;
            string nombre = txtUpdateNombre.Text;
            string apellido = txtUpdateApellido.Text;
            string correo = txtUpdateMail.Text;
            string tipo = ddlUpdateRol.SelectedItem.Text;
            string rol = ddlUpdateRol.SelectedItem.Value;
            string uActivo = ddlUpdateEstado.SelectedItem.Text;
            string usuario = txtUpdateUsuario.Text;
            string password = txtUpdatePass.Text;
            bool rolActivo = Persistencia.getInstance().rolActivo(rol);
            string descripcion = "";
            User user = new User(rut, nombre, apellido, correo, Convert.ToInt32(rol), tipo, tipo, uActivo.Equals("1"), rolActivo, "", usuario,descripcion);
            Persistencia.getInstance().modificarUsuario(user);
        }
        catch (ExecutionEngineException ex) { return; }
        Response.Redirect("user.aspx");
    }

    protected void btnDeleteOk_Click(object sender, EventArgs e)
    {
        try
        {
            string rut = hddRut.Value;
            Persistencia.getInstance().deleteUser(rut);
        }
        catch (ExecutionEngineException ex) { return; }
        Response.Redirect("user.aspx");
    }
}