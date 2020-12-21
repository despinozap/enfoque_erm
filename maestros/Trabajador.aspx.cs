using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.UI.HtmlControls;

public partial class maestros_Trabajador : System.Web.UI.Page
{
    private Service service;
    protected void Page_Load(object sender, EventArgs e)
    {
        service = new Service(Session["Login"], "Trabajador");
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
        CargarLista();
        //CargarDDL();
        //LimpiarCampos();
    }
    private void CargarDDL()
    {
        /*
        DataSet ds = Persistencia.getInstance().getRoles();
        ddlUpdateRol.DataSource = ds;
        ddlUpdateRol.DataTextField = "nombre";
        ddlUpdateRol.DataValueField = "id";
        ddlUpdateRol.DataBind();
        ddlNewRol.DataSource = ds;
        ddlNewRol.DataTextField = "nombre";
        ddlNewRol.DataValueField = "id";
        ddlNewRol.DataBind();
         * */
    }

    private void cargarPermiso()
    {
        btnDeleteOk.Visible = service.UserDelete();
        btnInsertOk.Visible = service.UserInsert();
        btnUpdateOk.Visible = service.UserUpdate();
    }

    private void CargarLista()
    {

        ArrayList lista = Persistencia.getInstance().ListaTrabajador();
        Session["lista"] = lista;
        BodyTable.Controls.Clear();
        for (int i = 0; i < lista.Count; i++)
        {
            Trabajador trabajador = (Trabajador)lista[i];

            HtmlGenericControl tr = new HtmlGenericControl("tr");
            tr.Attributes.Add("class", "gradeX");
            tr.Attributes.Add("value", i.ToString());
            tr.Attributes.Add("ToolTip", trabajador.descripcion);
            HtmlGenericControl td;
            //------------------- RUT -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = trabajador.rut;
            tr.Controls.Add(td);
            //------------------- NOMBRE -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = trabajador.nombre;
            tr.Controls.Add(td);
            //------------------- APELLIDO -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = trabajador.apellido;
            tr.Controls.Add(td);
            //------------------- Direccion -------------------\\            
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = trabajador.mail;
            tr.Controls.Add(td);
            //------------------- Fono -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 70px;");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = trabajador.cargo;
            tr.Controls.Add(td);
            //------------------- Fono -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 70px;");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = trabajador.estado;
            tr.Controls.Add(td);
            //------------------- CONTROLS -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px; text-align: center;");
            //------------------- EDITAR -------------------\\
            LinkButton edit = new LinkButton();
            edit.Enabled = service.UserUpdate();
            edit.ID = "LinkEdit" + i;
            edit.Attributes.Add("onClick", @"return updateUser(event.currentTarget);");
            edit.Attributes.Add("key", trabajador.id.ToString());
            edit.Attributes.Add("obs", trabajador.descripcion.ToString());
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
            delete.Attributes.Add("key", trabajador.id.ToString());
            delete.ID = "linkDel" + i;
            delete.Text = "<i class=\"fa fa-times\"></i>";
            delete.CommandArgument = trabajador.rut.ToString();// rol.Id.ToString();
            delete.CssClass = "btn btn-danger btn-sm new-modal-40";
            //delete.Style.Add("margin-left", "2px");
            //if (rol.Nombre.Equals("Default")) { delete.Enabled = false; delete.CssClass = "btn btn-link"; }
            //delete.Click += new EventHandler(this.LinkDel_Click);
            td.Controls.Add(delete);


            tr.Controls.Add(td);

            //------------------- END -------------------\\
            BodyTable.Controls.Add(tr);
        }
    }

    protected void btnInsertOk_Click(object sender, EventArgs e)
    {
        string rut = txtNewRut.Text;
        string nombre = txtNewNombre.Text;
        string apellido = txtNewApellido.Text;
        string mail = txtNewMail.Text;
        string cargo = txtNewRol.Text;
        string estado = "1";
        DateTime fecha = DateTime.Now;
        string descripcion = txtNewObservacion.Text;
        Trabajador trabajador = new Trabajador(0,rut, nombre, apellido, mail, cargo, estado,fecha,descripcion);

        Persistencia.getInstance().IngresarTrabajador(trabajador);
        Response.Redirect("Trabajador.aspx");

    }

    protected void btnUpdateOk_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hddRut.Value);
        string rut = txtUpdateRut.Text;
        string nombre = txtUpdateNombre.Text;
        string apellido = txtUpdateApellido.Text;
        string mail = txtUpdateMail.Text;
        string cargo = txtUpdateRol.Text;
        string estado = "1";
        DateTime fecha = DateTime.Now;
        string descripcion = txtUpdateObservacion.Text;
        Trabajador trabajador = new Trabajador(id,rut, nombre, apellido, mail, cargo,estado, fecha,descripcion);
        Persistencia.getInstance().modificarTrabajador(trabajador);
        Response.Redirect("Trabajador.aspx");
    }

    protected void btnDeleteOk_Click(object sender, EventArgs e)
    {
        string key = hddRut.Value;
        Persistencia.getInstance().deleteTrabajador(key);
        Response.Redirect("Trabajador.aspx");
    }
}