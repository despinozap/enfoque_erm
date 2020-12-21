using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for WSBeautify
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WSEquipo : WebService
{

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void getFamilias()
    {
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Clear();
        Context.Response.ContentType = "application/json";
        try
        {
            ArrayList data = null;
            data = PersArr.getInstance().getFamilias();
            if (data == null)
            {
                Context.Response.Write(js.Serialize(""));
            }
            Context.Response.Write(js.Serialize(data));
        }
        catch (Exception ex)
        {
            Context.Response.Write(js.Serialize(""));
        }
    }

    //[WebMethod]
    //[ScriptMethod(UseHttpGet = true)]
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getTipos()
    {
        var request = HttpContext.Current.Request;
        string familia = request.Form.Get("familia");
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Clear();
        Context.Response.ContentType = "application/json";
        try
        {
            ArrayList data = null;
            data = PersArr.getInstance().getTipos(familia);
            if (data == null)
            {
                Context.Response.Write(js.Serialize(""));
            }
            //Context.Response.Write(js.Serialize(data));
            return js.Serialize(data);
        }
        catch (Exception ex)
        {
            //Context.Response.Write(js.Serialize(""));
            return js.Serialize("");
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertarEquipo()
    {
        try
        {
            int statusCode = 0;
            string msg = "";
            List<Dictionary<string, object>> data = null;
            var request = HttpContext.Current.Request;
            string sap = request.Form.Get("sap");
            string cod = request.Form.Get("cod");
            DateTime fechaCompra = new DateTime();
            try{
                 fechaCompra= DateTime.Parse(request.Form.Get("fechaCompra"));
            }
            catch (Exception ex)
            {
                statusCode = -2;
                msg = "El formato de la fecha de compra no es válido.";
                return this.buildResponse(statusCode, msg, data);
            }
            string precioCompra = request.Form.Get("precioCompra");
            string nombre = request.Form.Get("nombre");
            string tipo = request.Form.Get("tipo");
            Boolean estado = true;
            string descripcion = request.Form.Get("observacion");
            string numeroSerie = request.Form.Get("numeroSerie");
            string proveedor = request.Form.Get("proveedor");
            string horometro = request.Form.Get("horometro");
            DateTime fechaHorometro = new DateTime();
            try
            {
                fechaHorometro = DateTime.Parse(request.Form.Get("fechaHorometro"));
            }
            catch (Exception ex)
            {
                statusCode = -2;
                msg = "El formato de la fecha de horometro no es válido.";
                return this.buildResponse(statusCode, msg, data);
            }
            string modelo = request.Form.Get("modelo");
            string uEstado = "1";
            string familia = request.Form.Get("familia");

            Equipo equipo = new Equipo("0",sap,cod,fechaCompra,precioCompra,nombre,tipo,estado,
                descripcion,numeroSerie,proveedor,horometro,fechaHorometro,modelo,DateTime.Now,uEstado,familia);

            validarCamposEquipo(ref statusCode, ref msg, equipo, false);

            if (statusCode == -2)
            {
                return buildResponse(statusCode, msg, data);
            }

            statusCode = PersArr.getInstance().IngresarEquipo(equipo);

            return buildResponse(statusCode, msg, data);
         }
        catch (Exception ex)
        {
            return buildResponse(-1, "Error al procesar la solicitud.", null);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string modificarEquipo()
    {
        try
        {
            int statusCode = 0;
            string msg = "";
            List<Dictionary<string, object>> data = null;

            var request = HttpContext.Current.Request;

            string id = request.Form.Get("id");
            string sap = request.Form.Get("sap");
            string cod = request.Form.Get("cod");
            DateTime fechaCompra = new DateTime();
            try
            {
                fechaCompra = DateTime.Parse(request.Form.Get("fechaCompra"));
            }
            catch (Exception ex)
            {
                statusCode = -2;
                msg = "El formato de la fecha de compra no es válido.";
                return this.buildResponse(statusCode, msg, data);
            }
            string precioCompra = request.Form.Get("precioCompra");
            string nombre = request.Form.Get("nombre");
            string tipo = request.Form.Get("tipo");
            Boolean estado = true;
            string descripcion = request.Form.Get("observacion");
            string numeroSerie = request.Form.Get("numeroSerie");
            string proveedor = request.Form.Get("proveedor");
            string horometro = request.Form.Get("horometro");
            DateTime fechaHorometro = new DateTime();
            try
            {
                fechaHorometro = DateTime.Parse(request.Form.Get("fechaHorometro"));
            }
            catch (Exception ex)
            {
                statusCode = -2;
                msg = "El formato de la fecha de horometro no es válido.";

                return this.buildResponse(statusCode, msg, data);
            }
            string modelo = request.Form.Get("modelo");
            string uEstado = "1";
            string familia = request.Form.Get("familia");

            Equipo equipo = new Equipo(id, sap, cod, fechaCompra, precioCompra, nombre, tipo, estado,
                descripcion, numeroSerie, proveedor, horometro, fechaHorometro, modelo, DateTime.Now, uEstado, familia);

            validarCamposEquipo(ref statusCode, ref msg, equipo, false);

            if (statusCode == -2)
            {
                return buildResponse(statusCode, msg, data);
            }

            statusCode = PersArr.getInstance().modificarEquipo(equipo);

            return buildResponse(statusCode, msg, data);
        }
        catch (Exception ex)
        {
            return buildResponse(-1, "Error al procesar la solicitud.", null);
        }
    }

    static private void validarCamposEquipo(ref int statusCode, ref string msg, Equipo equipo, Boolean edita)
    {
        int id = 0;
        //ID
        if (edita)
        {
            if (equipo.id == null)
            {
                statusCode = -2;
                msg = "No se ha seleccionado la id";
                return;
            }
            else if (!Int32.TryParse(equipo.id, out id))
            {
                statusCode = -2;
                msg = "El id del equipo es incorrecto";
                return;
            }
            else if(Int32.Parse(equipo.id) < 0)
            {
                statusCode = -2;
                msg = "El id del equipo es incorrecto";
                return;
            }
        }
        //SAP
        if (equipo.sap == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algún código SAP";
            return;
        }
        else if (equipo.sap.Length > 255)
        {
            statusCode = -2;
            msg = "El código SAP no puede superar los 255 caracteres, actual (" + equipo.sap.Length.ToString() + ")";
            return;
        }
        else if (equipo.sap.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar algún código SAP";
            return;
        }
        //Cod
        if (equipo.cod == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algún código";
            return;
        }
        else if (equipo.cod.Length > 255)
        {
            statusCode = -2;
            msg = "El código no puede superar los 255 caracteres, actual (" + equipo.cod.Length.ToString() + ")";
            return;
        }
        else if (equipo.cod.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar algún código";
            return;
        }
        //Número de serie
        if (equipo.numeroSerie == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algún número de serie";
            return;
        }
        else if (equipo.numeroSerie.Length > 255)
        {
            statusCode = -2;
            msg = "El número de serie no puede superar los 255 caracteres, actual (" + equipo.numeroSerie.Length.ToString() + ")";
            return;
        }
        else if (equipo.numeroSerie.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar algún número de serie";
            return;
        }
        //Nombre
        if (equipo.nombre == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algún nombre";
            return;
        }
        else if (equipo.nombre.Length > 255)
        {
            statusCode = -2;
            msg = "El nombre no puede superar los 255 caracteres, actual (" + equipo.nombre.Length.ToString() + ")";
            return;
        }
        else if (equipo.nombre.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar algún nombre";
            return;
        }
        //Precio de compra
        if (equipo.precioCompra == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el precio de compra";
            return;
        }
        else if (!Int32.TryParse(equipo.precioCompra, out id))
        {
            statusCode = -2;
            msg = "El precio de compra  es incorrecto";
            return;
        }
        else if (Int32.Parse(equipo.precioCompra) < 0)
        {
            statusCode = -2;
            msg = "El precio de compra es incorrecto";
            return;
        }
        //Proveedor
        if (equipo.proveedor == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algún proveedor";
            return;
        }
        else if (equipo.proveedor.Length > 255)
        {
            statusCode = -2;
            msg = "El proveedor no puede superar los 255 caracteres, actual (" + equipo.proveedor.Length.ToString() + ")";
            return;
        }
        else if (equipo.proveedor.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar algún proveedor";
            return;
        }
        //Modelo
        if (equipo.modelo == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algún modelo";
            return;
        }
        else if (equipo.modelo.Length > 255)
        {
            statusCode = -2;
            msg = "El modelo no puede superar los 255 caracteres, actual (" + equipo.modelo.Length.ToString() + ")";
            return;
        }
        else if (equipo.modelo.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar algún modelo";
            return;
        }
        //Horometro
        if (equipo.horometro == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado horometro";
            return;
        }
        else if (!Int32.TryParse(equipo.horometro, out id))
        {
            statusCode = -2;
            msg = "El valor del horometro es incorrecto";
            return;
        }
        else if (Int32.Parse(equipo.horometro) < 0)
        {
            statusCode = -2;
            msg = "El valor del horometro es incorrecto";
            return;
        }
        //Familia
        if (equipo.familia == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algúna familia";
            return;
        }
        else if (equipo.familia.Length > 255)
        {
            statusCode = -2;
            msg = "La familia no puede superar los 255 caracteres, actual (" + equipo.familia.Length.ToString() + ")";
            return;
        }
        else if (equipo.familia.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar alguna familia";
            return;
        }
        //Tipo
        if (equipo.tipo == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algún tipo";
            return;
        }
        else if (equipo.tipo.Length > 255)
        {
            statusCode = -2;
            msg = "El tipo no puede superar los 255 caracteres, actual (" + equipo.tipo.Length.ToString() + ")";
            return;
        }
        else if (equipo.tipo.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar algún tipo";
            return;
        }
        //Observaciones
        if (equipo.descripcion == null)
        {
            statusCode = -2;
            msg = "Debe ingresar algúna descripcion";
            return;
        }
        else if (equipo.descripcion.Length > 255)
        {
            statusCode = -2;
            msg = "La descripcion no puede superar los 255 caracteres, actual (" + equipo.descripcion.Length.ToString() + ")";
            return;
        }
        else if (equipo.descripcion.Length == 0)
        {
            statusCode = -2;
            msg = "Debe ingresar alguna descripcion";
            return;
        }
    }

    private string buildResponse(int statusCode, string msg, object data)
    {
        Dictionary<string, object> response = new Dictionary<string, object>();
        response.Add("statusCode", statusCode);
        response.Add("msg", msg);
        response.Add("data", data);

        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        return jsSerializer.Serialize(response);
    }
}
