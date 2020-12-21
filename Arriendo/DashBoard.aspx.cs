using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Arriendo_DashBoard : System.Web.UI.Page
{
    private List<string> ListaFamily;

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadFiltro();
        LoadReserva();
        LoadListaB();
        LoadEquipos();
    }

    private void LoadFiltro()
    {
        List<string> Lista = CtrlDashBoard.getInstalnce().ListFamily();
        sFiltro.Items.Clear();
        sFiltro.Items.Add(new ListItem("TODOS", "All"));
        for (int i = 1; i < Lista.Count; i++)
        {
            string Text = Lista[i];
            string Value = Text.Replace(" ", "");
            ListItem op = new ListItem(Text, Value);         
            sFiltro.Items.Add(op);
        }
    }
    private void LoadReserva()
    {
        string html = "<table class='table table-striped'>";
        html += @"<tr>
					<th>Serie</th>
					<th>Equipo</th>
					<th>Cliente</th>
					<th>Vendedor</th>
                    <th>Hasta</th>
					</tr>
				</thead>";
        html += "<tbody>";

        for (int i = 1; i < 11; i++)
        {
            string Serie = "SERIE "+i;
            string Equipo = "EQUIPO "+i;
            string Cliente = "CLIENTE "+i;
            string Vendedor = "VENDEDOR "+i;
            string Fecha = DateTime.Now.AddDays(i).ToString("yyyy/MM/dd");

            html += "<tr>";
            html += "<td>" + Serie + "</td>";
            html += "<td>" + Equipo + "</td>";
            html += "<td>" + Cliente + "</td>";
            html += "<td>" + Vendedor + "</td>";
            html += "<td>" + Fecha + "</td>";
            html += "</tr>";



        }

        html += "</tbody>";
        html += "</table>";

        bodyReserva.InnerHtml = html;
    }
    private void LoadListaB()
    {
        string html = "<table class='table table-striped'>";
        html += @"<tr>
					<th>Cliente</th>
					<th>Deuda</th>
					<th>Ultimo Pago</th>
					<th></th>
					</tr>
				</thead>";
        html += "<tbody>";

        Random r = new Random();
        for (int i = 1; i < 21; i++)
        {
            

            string Cliente = "CLIENTE " + i;
            string Deuda = r.Next(100000, 2500000).ToString("C0");
            string Fecha = DateTime.Now.AddDays(i).ToString("yyyy/MM/dd");
            string Mark = "";
            if (i % 2 == 0) { Mark = "<i class='fa fa-times' style='color: red;'></i>"; }
            else { Mark = "<i class='fa fa-check' style='color: green;'></i>"; }

            html += "<tr>";
            html += "<td>" + Cliente + "</td>";
            html += "<td>" + Deuda + "</td>";
            html += "<td>" + Fecha + "</td>";
            html += "<td>" + Mark + "</td>";
            html += "</tr>";



        }

        html += "</tbody>";
        html += "</table>";

        bodyListaB.InnerHtml = html;
    }
    private void LoadEquipos()
    {
        string html = "";
        Random rnd = new Random();
        int Family = rnd.Next(5, 25);
        
        for (int i = 0; i < Family; i++)
        {
            html += "<div class='panel panel-default'>";
            //HEAD
            string strTIpo = "divTipo" + (i + 1);
            int cant = rnd.Next(5, 20);
            int eqRes = rnd.Next(0, 3);
            int eqdis = rnd.Next(0, cant - eqRes);            
            int eqArr = rnd.Next(0, cant - eqdis - eqRes);
            int eqMan = cant - eqdis - eqArr;


            double pr = (double)eqRes / (double)cant;
            double pd = (double)eqdis / (double)cant;            
            double pa = (double)eqArr / (double)cant;
            double pm = 0.9999 - pd - pa - pr;

            string pDis = pd.ToString("P").Replace(" ", "").Replace(",", ".");
            string pRes = pr.ToString("P").Replace(" ", "").Replace(",", ".");
            string pArr = pa.ToString("P").Replace(" ", "").Replace(",", ".");
            string pMan = pm.ToString("P").Replace(" ", "").Replace(",", ".");

            html += "<div class='panel-heading'>";
            html += "<h3 class='panel-title'>";
            html += "<a class='accordion-toggle' data-toggle='collapse' data-parent='#accordion' href='#" + strTIpo + "'>";
            html += "TYPE " + (i + 1);
            html += "<span class='badge badge-blue' style='margin-left: 10px;'>" + cant + "</span>";
            html += "<div class='progress' style='height: 20px !important;width: 60%;float: right;margin-bottom: 0px;'>";
            html += "";//PROGRESS BAR
            html += "<div class='progress-bar progress-bar-info tip-right' data-original-title='Reserva' style='width: " + pRes + "'>";
            html += "<span class='h1' style='font-size: 19px;'>" + eqRes + "</span>";
            html += "</div>";
            html += "<div class='progress-bar progress-bar-success tip-right' data-original-title='Disponible' style='width: " + pDis + "'>";
            html += "<span class='h1' style='font-size: 19px;'>" + eqdis + "</span>";
            html += "</div>";            
            html += "<div class='progress-bar progress-bar-warning tip-left' data-original-title='Arriendo' style='width: " + pArr + "'>";
            html += "<span class='h1' style='font-size: 19px;'>" + eqArr + "</span>";
            html += "</div>";
            html += "<div class='progress-bar progress-bar-danger tip-left' data-original-title='Mantencion' style='width: " + pMan + "'>";
            html += "<span class='h1' style='font-size: 19px;'>" + eqMan + "</span>";
            html += "</div>";
            html += "</div>";
            html += "</a>";                                 
            html += "</h3>";
            html += "</div>";

            //BODY
            if (cant > 0)
            {
                html += "<div id='" + strTIpo + "' class='panel-collapse collapse'>";
                html += "<div class='panel-body'>";
                html += "<table class='table table-striped'>";
                html += "<thead>";
                html += "<tr>";
                html += "<th>Equipo</th>";
                html += "<th>Serie</th>";
                html += "<th>Horometro</th>";
                html += "</tr>";
                html += "</thead>";
                html += "<tbody>";
                for (int j = 0; j < cant; j++)
                {
                    string Equipo = "Equipo " + i + "." + j;
                    string Serie = i + "." + j;
                    int h = rnd.Next(100,5000);

                    html += "<tr>";
                    html += "<td>" + Equipo + "</td>";
                    html += "<td>" + Serie + "</td>";
                    html += "<td>" + h + " h</td>";
                    html += "</tr>";
                }
                html += "</tbody>";
                html += "</table>";
                html += "</div>";
                html += "</div>";
            }
            html += "</div>";
        }
        accordionEquipos.InnerHtml = html;
    }
}