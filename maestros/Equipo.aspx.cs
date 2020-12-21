using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.UI.HtmlControls;

public partial class maestros_Equipo : System.Web.UI.Page
{
    private Service service;
    protected void Page_Load(object sender, EventArgs e)
    {
        service = new Service(Session["Login"], "Equipo");
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
        cargarFamilias();
        CargarDDL();
        //LimpiarCampos();
    }

    private void cargarFamilias()
    {
        ArrayList data = null;
        data = PersArr.getInstance().getFamilias();
        selectFamiliaNew.DataSource = data;
        selectFamiliaNew.DataTextField = "name";
        selectFamiliaNew.DataValueField = "id";
        selectFamiliaNew.DataBind();
        selectFamiliaUpdate.DataSource = data;
        selectFamiliaUpdate.DataTextField = "name";
        selectFamiliaUpdate.DataValueField = "id";
        selectFamiliaUpdate.DataBind();
    }

    private void LimpiarCampos()
    {
        /*
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
         * */

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
        ArrayList lista = PersArr.getInstance().ListaEquipo();
        Session["lista"] = lista;
        BodyTable.Controls.Clear();
        for (int i = 0; i < lista.Count; i++)
        {
            Equipo equipo = (Equipo)lista[i];

            HtmlGenericControl tr = new HtmlGenericControl("tr");
            tr.Attributes.Add("class", "gradeX");
            tr.Attributes.Add("value", i.ToString());
            tr.Attributes.Add("ToolTip", equipo.descripcion);
            HtmlGenericControl td;
            //------------------- Sap -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.sap;
            tr.Controls.Add(td);
            //------------------- Cod -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.cod;
            tr.Controls.Add(td);
            //------------------- NOMBRE -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.nombre;
            tr.Controls.Add(td);
            //------------------- Tipo -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.tipo;
            tr.Controls.Add(td);
            /*
            //------------------- fechaCompra -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.fechaCompra.ToShortDateString();
            tr.Controls.Add(td);
            //------------------- precioCompra -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.precioCompra;
            tr.Controls.Add(td);
            */
            //------------------- observaciones -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.descripcion;
            tr.Controls.Add(td);
            /*
            //------------------- numeroSerie -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.numeroSerie;
            tr.Controls.Add(td);
            //------------------- proveedor -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.proveedor;
            tr.Controls.Add(td);
            //------------------- horometro -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.horometro;
            tr.Controls.Add(td);
            //------------------- fechaHorometro -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");

            td.InnerText = equipo.fechaHorometro.ToShortDateString();
            tr.Controls.Add(td);
            //------------------- fecha -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "vertical-align: middle;");
            td.InnerText = equipo.fecha.ToLongDateString();
            tr.Controls.Add(td);
             * */
            //------------------- CONTROLS -------------------\\
            td = new HtmlGenericControl("td");
            td.Attributes.Add("Style", "width: 50px; text-align: center;");
            //------------------- EDITAR -------------------\\
            LinkButton edit = new LinkButton();
            edit.Enabled = service.UserUpdate();
            edit.ID = "LinkEdit" + i;
            /*
            < th class="">Sap</th><th class="">Cod</th><th class="">Nombre</th><th class="">Tipo</th><th class="">Descripción</th>*/
            edit.Attributes.Add("onClick", @"return updateEquipo(event.currentTarget);");
            edit.Attributes.Add("key", equipo.id.ToString());
            edit.Attributes.Add("sap", equipo.sap.ToString());
            edit.Attributes.Add("cod", equipo.cod.ToString());
            edit.Attributes.Add("pc", equipo.precioCompra.ToString());
            edit.Attributes.Add("fc", equipo.fechaCompra.ToShortDateString().Replace("-", "/"));
            edit.Attributes.Add("me", equipo.modelo.ToString());
            edit.Attributes.Add("fe", equipo.familia.ToString());
            edit.Attributes.Add("obs", equipo.descripcion.ToString());
            edit.Attributes.Add("ns", equipo.numeroSerie.ToString());
            edit.Attributes.Add("pe", equipo.proveedor.ToString());
            edit.Attributes.Add("hr", equipo.horometro.ToString());
            edit.Attributes.Add("fh", equipo.fechaHorometro.ToShortDateString().Replace("-", "/"));
            edit.Attributes.Add("ne", equipo.nombre.ToString());
            edit.Attributes.Add("te", equipo.tipo.ToString());
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
            delete.Attributes.Add("onClick", @"return deleteEquipo(event.currentTarget);");
            delete.Attributes.Add("key", equipo.id.ToString());
            delete.ID = "linkDel" + i;
            delete.Text = "<i class=\"fa fa-times\"></i>";
            delete.CommandArgument = equipo.id.ToString();// rol.Id.ToString();
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
        /*id sap	cod	fechaCompra	precioCompra	categoria	descripcion	numeroSerie	proveedor	estado	horometro	fechaHorometro	fecha	nombre	tipo*/
       /* string sap = txtNewSap.Text;
        string cod = txtNewCod.Text;
        string nombre = txtNewNombre.Text;
        string tipo = txtNewTipo.Text;
        string obs = txtNewDescripcion.Text;
        string categoria = txtNewCategoria.Text;
        string numero = txtNewNumeroSerie.Text;
        string proveedor = txtNewProveedor.Text;
        Boolean estado = true;
        string horometro = txtNewHorometro.Text;
        string fechaHorometro = txtNewFechaHorometro.Value;
        string precio = txtNewPrecioCompra.Text;
        string fechaCompra = txtNewFechaCompra.Value;
        DateTime fecha = DateTime.Now;

        Equipo equipo = new Equipo("0", sap, cod, DateTime.Now, precio, nombre, tipo, estado, obs, numero, proveedor, horometro, DateTime.Parse(fechaHorometro), DateTime.Now);
        equipo.categoria = categoria;
        //Persistencia.getInstance().IngresarCliente(cliente);
        Persistencia.getInstance().IngresarEquipo(equipo);
        Response.Redirect("Equipo.aspx");*/

    }

    protected void btnUpdateOk_Click(object sender, EventArgs e)
    {
        /*string id = hddID.Value;
        string sap = txtUpdateSap.Text;
        string cod = txtUpdateCod.Text;
        string nombre = txtUpdateNombre.Text;
        string tipo = txtUpdateTipo.Text;
        string obs = txtUpdateDescripcion.Text;
        string categoria = txtUpdateCategoria.Text;
        string numero = txtUpdateNumeroSerie.Text;
        string proveedor = txtUpdateProveedor.Text;
        Boolean estado = true;
        string horometro = txtUpdateHorometro.Text;
        string fechaHorometro = txtUpdateFechaHorometro.Value;
        string precio = txtUpdatePrecioCompra.Text;
        string fechaCompra = txtUpdateFechaCompra.Value;
        DateTime fecha = DateTime.Now;

        Equipo equipo = new Equipo(id, sap, cod, DateTime.Now, precio, nombre, tipo, estado, obs, numero, proveedor, horometro, DateTime.Parse(fechaHorometro), DateTime.Now);
        equipo.categoria = categoria;
        //Persistencia.getInstance().modificarCliente(cliente);
        Persistencia.getInstance().modificarEquipo(equipo);
        Response.Redirect("Equipo.aspx");*/
    }

    protected void btnDeleteOk_Click(object sender, EventArgs e)
    {
        string key = hddKey.Value;
        //Persistencia.getInstance().deleteCliente(key);
        PersArr.getInstance().deleteEquipo(key);
        Response.Redirect("Equipo.aspx");
    }
    protected void postBack_Click(object sender, EventArgs e)
    {

    }
}