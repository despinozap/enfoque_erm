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
        service = new Service(Session["Login"], "Empresa");
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
        txtNewRazonSocial.Text = "";
        txtNewNombre.Text = "";
        txtNewCliente.Text = "";
        txtNewEmpresa.Text = "";
        txtNewObservacion.Text = "";
        txtNewMail.Text = "";
        txtNewDirc.Text = "";
        txtNewFono.Text = "";
        txtNewRazonSocial.Text = "";

        hddID.Value = "";
        txtUpdateRazonSocial.Text = "";
        txtUpdateNombre.Text = "";
        txtUpdateCliente.Text = "";
        txtUpdateEmpresa.Text = "";
        txtUpdateDesc.Text = "";
        txtUpdateMail.Text = "";
        txtUpdateDireccion.Text = "";
        txtUpdateFono.Text = "";
        txtUpdateRazonSocial.Text = "";

        hddKey.Value = "";
        
    }

    private void CargarDDL()
    {
        DataSet ds = Persistencia.getInstance().getClientes();
        ddlCliente.DataSource = ds;
        ddlCliente.DataTextField = "nombre";
        ddlCliente.DataValueField = "cod";
        ddlCliente.DataBind();

        ds = Persistencia.getInstance().getEmpresa();
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

        ArrayList lista = Persistencia.getInstance().ListaFaena();
        Session["lista"] = lista;
        BodyTable.Controls.Clear();
        for (int i = 0; i < lista.Count; i++)
        {
            Faena faena = (Faena)lista[i];

            HtmlGenericControl tr = new HtmlGenericControl("tr");
            tr.Attributes.Add("class", "gradeX");
            tr.Attributes.Add("value", i.ToString());
            tr.Attributes.Add("ToolTip", faena.desc);
            HtmlGenericControl td;
            //------------------- Razon Social -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = faena.nombre;
            tr.Controls.Add(td);
            //------------------- RUT -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = faena.cliente;
            tr.Controls.Add(td);
            //------------------- Alias -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = faena.empresa;
            tr.Controls.Add(td);
            //------------------- Descripcion -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = faena.desc;
            tr.Controls.Add(td);
            //------------------- CONTROLS -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px; text-align: center;");
            //------------------- EDITAR -------------------\\
            LinkButton edit = new LinkButton();
            edit.Enabled = service.UserUpdate();
            edit.ID = "LinkEdit" + i;
            edit.Attributes.Add("onClick", @"return updateUser(event.currentTarget);");
            edit.Attributes.Add("key", faena.id.ToString());
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
            delete.Attributes.Add("key", faena.id.ToString());
            delete.ID = "linkDel" + i;
            delete.Text = "<i class=\"fa fa-times\"></i>";
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
        string nombre = txtNewNombre.Text;
        string cliente = ddlCliente.SelectedItem.Text;// txtNewCliente.Text;
        string empresa = txtNewEmpresa.Text;
        string desc = txtNewObservacion.Text;
        string estado = "1";
        Faena faena = new Faena(0,nombre,cliente,empresa,desc,estado);

        Persistencia.getInstance().IngresarFaena(faena);
        Response.Redirect("Faena.aspx");

    }

    protected void btnUpdateOk_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(hddID.Value);
        string nombre = txtUpdateRazonSocial.Text;
        string cliente = txtUpdateCliente.Text;
        string empresa = ddlEmpresa.SelectedItem.Text;// txtUpdateEmpresa.Text;
        string desc = txtUpdateDesc.Text;
        string estado = "2";
        Faena faena = new Faena(id, nombre,cliente,empresa, desc,estado);
        Persistencia.getInstance().modificarFaena(faena);
        Response.Redirect("Faena.aspx");
    }

    protected void btnDeleteOk_Click(object sender, EventArgs e)
    {
        string key = hddKey.Value;
        Persistencia.getInstance().deleteFaena(key);
        Response.Redirect("Faena.aspx");
    }
    protected void txtNewSap_TextChanged(object sender, EventArgs e)
    {

    }
}