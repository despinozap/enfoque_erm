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
/// Summary description for WSTaller
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WSEmpresa : System.Web.Services.WebService
{
    #region Empresa
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertarEmpresa()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string rs = request.Form.Get("razonSocial");
        string rut = request.Form.Get("rut");
        string alias = request.Form.Get("alias");
        string obs = request.Form.Get("observacion");
        Empresa empresa = new Empresa(0, rs, rut, alias, obs);
        empresa.activo = 1;

        if (rs == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la Razón Social";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (rs.Length > 255)
        {
            statusCode = -2;
            msg = "La Razón Social no puede sobrepasar los 255 caracteres";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = PersArr.getInstance().IngresarEmpresa(empresa);

        return buildResponse(statusCode, msg, data);
    }
    #endregion

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
