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
/// Summary description for WSContacto
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WSObra : System.Web.Services.WebService
{
    #region Obra
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string ingresarObra()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string nom = request.Form.Get("nombre");
        string ciudad = request.Form.Get("ciudad");
        string direccion = request.Form.Get("direccion");
        string observacion = request.Form.Get("observacion");
        DateTime fecha = DateTime.Now;
        Boolean estado = true;
        int empresaId = Int32.Parse(request.Form.Get("empresa_id"));

        if (nom == null)
        {
            statusCode = -2;
            msg = "Error, recargue la página";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (nom.Length > 255)
        {
            statusCode = -2;
            msg = "El nombre no puede sobrepasar los 255 caracteres";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (nom.Length == 0)
        {
            statusCode = -2;
            msg = "El nombre debe tener caracteres";

            return this.buildResponse(statusCode, msg, data);
        }
        
        Obra obra = new Obra(0,nom,ciudad,direccion,observacion,fecha,estado,empresaId);

        statusCode = PersArr.getInstance().ingresarObra(obra);

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string modificarObra()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        int id = Int32.Parse(request.Form.Get("id"));
        string nom = request.Form.Get("nombre");
        string ciudad = request.Form.Get("ciudad");
        string direccion = request.Form.Get("direccion");
        string observacion = request.Form.Get("observacion");
        DateTime fecha = DateTime.Now;
        Boolean estado = true;
        int empresaId = Int32.Parse(request.Form.Get("empresa_id"));

        if (id == null)
        {
            statusCode = -2;
            msg = "Error, recargue la página";

            return this.buildResponse(statusCode, msg, data);
        }
        if (nom == null)
        {
            statusCode = -2;
            msg = "Error, recargue la página";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (nom.Length > 255)
        {
            statusCode = -2;
            msg = "El nombre no puede sobrepasar los 255 caracteres";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (nom.Length == 0)
        {
            statusCode = -2;
            msg = "El nombre debe tener caracteres";

            return this.buildResponse(statusCode, msg, data);
        }

        Obra obra = new Obra(id, nom, ciudad, direccion, observacion, fecha, estado, empresaId);
        statusCode = PersArr.getInstance().modificarObra(obra);

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string eliminarContacto()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string id = request.Form.Get("id");
        DateTime fecha = DateTime.Now;

        if (id == null)
        {
            statusCode = -2;
            msg = "Error, recargue la página";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = PersArr.getInstance().eliminarContacto(id,fecha);

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
