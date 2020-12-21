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
public class WSContacto : System.Web.Services.WebService
{

    public WSContacto()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    #region Contacto
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string ingresarContacto()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        int id = Int32.Parse(request.Form.Get("id"));
        string area = request.Form.Get("area");
        string nom = request.Form.Get("nombre");
        string email = request.Form.Get("email");
        string fono = request.Form.Get("fono");
        string celular = request.Form.Get("celular");
        string direccion = request.Form.Get("direccion");
        string observacion = request.Form.Get("observacion");
        string ciudad = request.Form.Get("ciudad");
        DateTime fecha = DateTime.Now;
        bool estado = true;
        int empresa_id = Int32.Parse(request.Form.Get("empresa_id"));

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
        if (email == null)
        {
            statusCode = -2;
            msg = "Error, recargue la página";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (email.Length > 255)
        {
            statusCode = -2;
            msg = "El email no puede sobrepasar los 255 caracteres";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (nom.Length == 0)
        {
            statusCode = -2;
            msg = "El email debe tener caracteres";

            return this.buildResponse(statusCode, msg, data);
        }

        Contacto contacto = new Contacto(id, area, nom, email, fono, celular, direccion, observacion, ciudad, fecha, estado, empresa_id);
        statusCode = PersArr.getInstance().ingresarContacto(contacto);

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string modificarContacto()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        int id = Int32.Parse(request.Form.Get("id"));
        string area = request.Form.Get("area");
        string nom = request.Form.Get("nombre");
        string email = request.Form.Get("email");
        string fono = request.Form.Get("fono");
        string celular = request.Form.Get("celular");
        string direccion = request.Form.Get("direccion");
        string observacion = request.Form.Get("observacion");
        string ciudad = request.Form.Get("ciudad");
        DateTime fecha = DateTime.Now;
        bool estado = true;
        int empresa_id = Int32.Parse(request.Form.Get("empresa_id"));

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
        if (email == null)
        {
            statusCode = -2;
            msg = "Error, recargue la página";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (email.Length > 255)
        {
            statusCode = -2;
            msg = "El email no puede sobrepasar los 255 caracteres";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (nom.Length == 0)
        {
            statusCode = -2;
            msg = "El email debe tener caracteres";

            return this.buildResponse(statusCode, msg, data);
        }

        Contacto contacto = new Contacto(id, area, nom, email, fono, celular, direccion, observacion, ciudad, fecha, estado, empresa_id);
        statusCode = PersArr.getInstance().modificarContacto(contacto);

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
