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
        txtNewRut.Text = "";
        txtNewAlias.Text = "";
        txtNewObservacion.Text = "";
        txtNewMail.Text = "";
        txtNewDirc.Text = "";
        txtNewFono.Text = "";
        txtNewRazonSocial.Text = "";

        hddID.Value = "";
        txtUpdateRazonSocial.Text = "";
        txtUpdateRut.Text = "";
        txtUpdateAlias.Text = "";
        txtUpdateDesc.Text = "";
        txtUpdateMail.Text = "";
        txtUpdateDireccion.Text = "";
        txtUpdateFono.Text = "";
        txtUpdateRazonSocial.Text = "";

        hddKey.Value = "";
        
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

        ArrayList lista = PersArr.getInstance().ListaEmpresa();
        Session["lista"] = lista;
        BodyTable.Controls.Clear();
        for (int i = 0; i < lista.Count; i++)
        {
            Empresa empresa = (Empresa)lista[i];

            HtmlGenericControl tr = new HtmlGenericControl("tr");
            tr.Attributes.Add("class", "gradeX");
            tr.Attributes.Add("value", i.ToString());
            tr.Attributes.Add("ToolTip", empresa.desc);
            HtmlGenericControl td;
            //------------------- Razon Social -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = empresa.razonsocial;
            tr.Controls.Add(td);
            //------------------- RUT -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = empresa.rut;
            tr.Controls.Add(td);
            //------------------- Alias -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = empresa.alias;
            tr.Controls.Add(td);
            //------------------- Descripcion -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = empresa.desc;
            tr.Controls.Add(td);
            //------------------- CONTROLS -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px; text-align: center;");
            //------------------- EDITAR -------------------\\
            LinkButton edit = new LinkButton();
            edit.Enabled = service.UserUpdate();
            edit.ID = "LinkEdit" + i;
            edit.Attributes.Add("onClick", @"return updateUser(event.currentTarget);");
            edit.Attributes.Add("key", empresa.id.ToString());
            edit.Attributes.Add("data-toggle", "tooltip");
            edit.Attributes.Add("data-original-title", "Editar");
            //edit.Text = "<span class=\"button-content\"><i class=\"glyph-icon icon-pencil\"></i></span>";
            edit.Text = "<i class=\"fa fa-pencil\"></i>";
            edit.CommandArgument = i.ToString();// rol.Id.ToString();            
            edit.CssClass = "btn btn-info btn-sm tip-left";

            td.Controls.Add(edit);

            LinkButton delete = new LinkButton();
            delete.Enabled = service.UserDelete();
            delete.Attributes.Add("onClick", @"return deleteUser(event.currentTarget);");
            delete.Attributes.Add("key", empresa.id.ToString());
            delete.Attributes.Add("data-toggle", "tooltip");
            delete.Attributes.Add("data-original-title", "Eliminar");
            delete.ID = "linkDel" + i;
            delete.Text = "<i class=\"fa fa-times\"></i>";
            delete.CssClass = "btn btn-danger btn-sm new-modal-40 tip-left";
            td.Controls.Add(delete);

            //------------------- CONTACTO -------------------\\            
            LinkButton contacto = new LinkButton();
            contacto.Enabled = true; //Revisar si todos pueden revisar los contactos
            contacto.Attributes.Add("onClick", @"return contactos(event.currentTarget); return false;");
            contacto.Attributes.Add("key", empresa.id.ToString());
            contacto.Attributes.Add("contactos", empresa.contactos);
            contacto.Attributes.Add("obras", empresa.obras);
            contacto.Attributes.Add("data-toggle", "tooltip");
            contacto.Attributes.Add("data-original-title", "Contactos");
            contacto.ID = "LinkContactos" + i;
            contacto.Text = "<i class=\"fa fa-users\"></i>";
            contacto.CssClass = "btn btn-warning btn-sm tip-left";
            td.Controls.Add(contacto);
            tr.Controls.Add(td);

            //------------------- CONTACTO -------------------\\            
            LinkButton obras = new LinkButton();
            obras.Enabled = true; //Revisar si todos pueden revisar los contactos
            obras.Attributes.Add("onClick", @"return obras(event.currentTarget); return false;");
            obras.Attributes.Add("key", empresa.id.ToString());
            obras.Attributes.Add("obras", empresa.obras);
            obras.Attributes.Add("data-toggle", "tooltip");
            obras.Attributes.Add("data-original-title", "Obras");
            obras.ID = "LinkObras" + i;
            obras.Text = "<i class=\"fa fa-cogs\"></i>";
            obras.CssClass = "btn btn-primary btn-sm tip-left";
            td.Controls.Add(obras);
            tr.Controls.Add(td);

            //------------------- END -------------------\\
            BodyTable.Controls.Add(tr);
        }
    }

    protected void btnInsertOk_Click(object sender, EventArgs e)
    {
        //string rs = txtNewRazonSocial.Text;
        //string rut = txtNewRut.Text;
        //string alias = txtNewAlias.Text;
        //string desc = txtNewObservacion.Text;
        //Empresa empresa = new Empresa(0,rs,rut,alias,desc);
        //empresa.activo = 1;

        //Persistencia.getInstance().IngresarEmpresa(empresa);
        //Response.Redirect("Empresa.aspx");
    }

    protected void btnUpdateOk_Click(object sender, EventArgs e)
    {
        if (txtUpdateRazonSocial.Text.Trim().Count() > 0)
        {
            int id = Convert.ToInt32(hddID.Value);
            string rs = txtUpdateRazonSocial.Text;
            string rut = txtUpdateRut.Text;
            string alias = txtUpdateAlias.Text;
            string desc = txtUpdateDesc.Text;
            Empresa empresa = new Empresa(id, rs, rut, alias, desc);
            empresa.activo = 1;
            PersArr.getInstance().modificarEmpresa(empresa);
            Response.Redirect("Empresa.aspx");
        } 
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "mensaje", "mensaje('"+"La razon social no puede ser vacia"+"')", true);
        }
    }

    protected void btnDeleteOk_Click(object sender, EventArgs e)
    {
        string key = hddKey.Value;
        PersArr.getInstance().deleteEmpresa(key);
        Response.Redirect("Empresa.aspx");
    }
    protected void txtNewSap_TextChanged(object sender, EventArgs e)
    {

    }

    protected void postBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Empresa.aspx");
    }
    protected void eliminarContacto_Click(object sender, EventArgs e)
    {
        string key = idContactoEditar.Value;
        DateTime fecha = DateTime.Now;
        PersArr.getInstance().eliminarContacto(key,fecha);
        Response.Redirect("Empresa.aspx");
    }
    protected void eliminarObra_Click(object sender, EventArgs e)
    {
        string key = idObraEditar.Value;
        DateTime fecha = DateTime.Now;
        PersArr.getInstance().eliminarObra(key, fecha);
        Response.Redirect("Empresa.aspx");
    }
}