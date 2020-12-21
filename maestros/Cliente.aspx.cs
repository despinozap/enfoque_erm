using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Web.UI.HtmlControls;

public partial class maestros_Cliente : System.Web.UI.Page
{
    private Service service;
    protected void Page_Load(object sender, EventArgs e)
    {
        service = new Service(Session["Login"], "Cliente");
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
        CargarDDL();
        //LimpiarCampos();
    }

    private void LimpiarCampos()
    {
        txtNewSap.Text = "";
        txtNewRut.Text = "";
        txtNewNombre.Text = "";
        txtNewApellido.Text = "";
        txtNewMail.Text = "";
        txtNewDirc.Text = "";
        txtNewFono.Text = "";
        txtNewRazonSocial.Text = "";

        hddID.Value = "";
        txtUpdateSap.Text = "";
        txtUpdateRut.Text = "";
        txtUpdateNombre.Text = "";
        txtUpdateApellido.Text = "";
        txtUpdateMail.Text = "";
        txtUpdateDireccion.Text = "";
        txtUpdateFono.Text = "";
        txtUpdateRazonSocial.Text = "";

        hddKey.Value = "";
        
    }

    private void CargarDDL()
    {
        DataSet ds = Persistencia.getInstance().getEmpresa();
        ddlEmpresa.DataSource = ds;
        ddlEmpresa.DataTextField = "razonSocial";
        ddlEmpresa.DataValueField = "id";
        ddlEmpresa.DataBind();
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

        ArrayList lista = Persistencia.getInstance().ListaCliente();
        Session["lista"] = lista;
        BodyTable.Controls.Clear();
        for (int i = 0; i < lista.Count; i++)
        {
            Cliente cliente = (Cliente)lista[i];

            HtmlGenericControl tr = new HtmlGenericControl("tr");
            tr.Attributes.Add("class", "gradeX");
            tr.Attributes.Add("value", i.ToString());
            tr.Attributes.Add("ToolTip", cliente.descripcion);
            HtmlGenericControl td;
            //------------------- Sap -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = cliente.sap;
            tr.Controls.Add(td);
            //------------------- RUT -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = cliente.rut;
            tr.Controls.Add(td);
            //------------------- NOMBRE -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = cliente.nombre;
            tr.Controls.Add(td);
            //------------------- APELLIDO -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = cliente.apellido;
            tr.Controls.Add(td);
            //------------------- Direccion -------------------\\            
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = cliente.direccion;
            tr.Controls.Add(td);            
            //------------------- Fono -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 70px;");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = cliente.fono;
            tr.Controls.Add(td);

            //------------------- Forma de Pago -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 70px;");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = cliente.formadepago;
            tr.Controls.Add(td);

            //------------------- razonsocial -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px;");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerHtml = cliente.razonsocial;
            tr.Controls.Add(td);

            //------------------- CONTROLS -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px; text-align: center;");
            //------------------- EDITAR -------------------\\
            LinkButton edit = new LinkButton();
            edit.Enabled = service.UserUpdate();
            edit.ID = "LinkEdit" + i;
            edit.Attributes.Add("onClick", @"return updateUser(event.currentTarget);");
            edit.Attributes.Add("key", cliente.cod.ToString());
            edit.Attributes.Add("mail", cliente.mail.ToString());
            edit.Attributes.Add("obs", cliente.descripcion.ToString());
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
            delete.Attributes.Add("key", cliente.cod.ToString());
            delete.ID = "linkDel" + i;
            delete.Text = "<i class=\"fa fa-times\"></i>";
            delete.CommandArgument = cliente.rut.ToString();// rol.Id.ToString();
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
        string sap = txtNewSap.Text;
        string rut = txtNewRut.Text;
        string nombre = txtNewNombre.Text;
        string apellido = txtNewApellido.Text;
        string direccion = txtNewDirc.Text;
        string fono=txtNewFono.Text;
        string formadepago=ddlFormaPago.SelectedItem.Text;
        string formadepagoid=ddlFormaPago.SelectedItem.Value;
        string estado = "1";
        DateTime fecha = DateTime.Now;
        string razonsocial = ddlEmpresa.SelectedItem.Text;// txtNewRazonSocial.Text;
        string mail = txtNewMail.Text;
        string descripcion = txtNewObservacion.Text;
        Cliente cliente = new Cliente(0, sap, rut, nombre, apellido, direccion, fono, formadepago, estado, fecha,mail, razonsocial,descripcion);

        Persistencia.getInstance().IngresarCliente(cliente);
        Response.Redirect("Cliente.aspx");

    }

    protected void btnUpdateOk_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hddID.Value);
        string sap = txtUpdateSap.Text;
        string rut = txtUpdateRut.Text;
        string nombre = txtUpdateNombre.Text;
        string apellido = txtUpdateApellido.Text;
        string direccion = txtUpdateDireccion.Text;
        string fono = txtUpdateFono.Text;
        string formadepago = ddlUpdateFormaPago.SelectedItem.Text;
        string formadepagoid = ddlUpdateFormaPago.SelectedItem.Value;
        string estado = "1";
        DateTime fecha = DateTime.Now;
        string razonsocial = txtUpdateRazonSocial.Text;
        string mail = txtUpdateMail.Text;
        string descripcion = txtUpdateObservacion.Text;
        Cliente cliente = new Cliente(id, sap, rut, nombre, apellido, direccion, fono, formadepago, estado, fecha,mail, razonsocial,descripcion);
        Persistencia.getInstance().modificarCliente(cliente);
        Response.Redirect("Cliente.aspx");
    }

    protected void btnDeleteOk_Click(object sender, EventArgs e)
    {
        string key = hddKey.Value;
        Persistencia.getInstance().deleteCliente(key);
        Response.Redirect("cliente.aspx");
    }
    protected void txtNewSap_TextChanged(object sender, EventArgs e)
    {

    }
}