using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Arriendo_NewArriendo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarEquipos();
    }

    private void cargarEquipos()
    {
        ArrayList lista = null;
        lista = PersArr.getInstance().listarEquiposDisponibles();
        bodyTablaEquipos.Controls.Clear();
        for (int i = 0; i < lista.Count; i++)
        {
            Equipo equipo = (Equipo)lista[i];

            HtmlGenericControl tr = new HtmlGenericControl("tr");
            tr.Attributes.Add("class", "fila");
            tr.Attributes.Add("value", i.ToString());
            //tr.Attributes.Add("C", "tooltip");
            //tr.Attributes.Add("data-placement", "top");
            //tr.Attributes.Add("data-original-title", "Click para agregar al arriendo");
            HtmlGenericControl td;
            //--------------------- ID ---------------------\\
            td = new HtmlGenericControl("td");
            td.InnerText = equipo.id;
            //td.Attributes.Add("class", "hidden");
            tr.Controls.Add(td);
            //--------------------- SAP ---------------------\\
            td = new HtmlGenericControl("td");
            td.InnerText = equipo.sap;
            tr.Controls.Add(td);
            //--------------------- COD ---------------------\\
            td = new HtmlGenericControl("td");
            td.InnerText = equipo.cod;
            tr.Controls.Add(td);
            //-------------------- SERIE --------------------\\
            td = new HtmlGenericControl("td");
            td.InnerText = equipo.numeroSerie;
            tr.Controls.Add(td);
            //------------------- NOMBRE --------------------\\
            td = new HtmlGenericControl("td");
            td.InnerText = equipo.nombre;
            tr.Controls.Add(td);
            //------------------- Familia -------------------\\
            td = new HtmlGenericControl("td");
            td.InnerText = equipo.familia;
            tr.Controls.Add(td);
            //-------------------- Tipo --------------------\\
            td = new HtmlGenericControl("td");
            td.InnerText = equipo.tipo;
            tr.Controls.Add(td);
            //------------- Input Precio diario -------------\\
            HtmlInputText input = new HtmlInputText("text");
            input.Value = "0";
            input.Attributes.Add("class", "form-control");
            input.Attributes.Add("type", "number");

            //---------------- Precio diario ----------------\\
            td = new HtmlGenericControl("td");
            //td.Attributes.Add("class", "hidden");

            td.Controls.Add(input);

            tr.Controls.Add(td);
            //------------------- END -------------------\\
            bodyTablaEquipos.Controls.Add(tr);
        }
    }
}