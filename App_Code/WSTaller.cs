using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
public class WSTaller : System.Web.Services.WebService {

    public WSTaller () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getTest_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        /*
        var request = HttpContext.Current.Request;
        if (request.Files.Count > 0)
        {
            foreach (string file in request.Files)
            {
                var postedFile = request.Files[file];
                var filePath = HttpContext.Current.Server.MapPath(string.Format("~/Uploads/{0}", postedFile.FileName));
                postedFile.SaveAs(filePath);
            }

            statusCode = 1;
            msg = "File uploaded successfully!";
        }
        else
        {
            statusCode = 0;
            msg = "Fail to upload file";
        }
        */

        data = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = new Dictionary<string, object>();
        row.Add("timestamp", TallerController.getTimeStamp());
        data.Add(row);

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string removeArchivo_JSON()
    {
        int statusCode = 0;
        string msg = "";
        Dictionary<string, object> data = null;

        var request = HttpContext.Current.Request;

        string archivo_id = request.Form.Get("archivo_id");
        if (archivo_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el archivo a eliminar";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.removeArchivo(archivo_id);

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al eliminar el archivo";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al eliminar el archivo";

                    break;
                }

            case 1:
                {
                    msg = "Se ha eliminado exitosamente el archivo";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertArchivo_JSON()
    {
        int statusCode = 0;
        string msg = "";
        Dictionary<string, object> data = null;

        var request = HttpContext.Current.Request;
        if (request.Files.Count < 1)
        {
            statusCode = -2;
            msg = "No se ha ingresado el archivo para cargar";

            return this.buildResponse(statusCode, msg, data);
        }

        HttpPostedFile file = request.Files[0];

        int contentLength = file.ContentLength;
        if (file.ContentLength > 3145728)
        {
            statusCode = -2;
            msg = "El tamaño máximo de archivo permitido es de 3 megabytes (mb)";

            return this.buildResponse(statusCode, msg, data);
        }


        statusCode = TallerController.insertArchivo(file);

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al cargar el archivo";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al cargar el archivo";

                    break;
                }

            default:
                {
                    msg = "Se ha cargado exitosamente el archivo";
                    data = new Dictionary<string, object>();
                    data.Add("archivo_id", statusCode);

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getArchivo_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string id = request.Form.Get("id");

        DataTable dtArchivo = TallerController.getArchivo(id);

        if (dtArchivo != null)
        {
            if(dtArchivo.Rows.Count > 0)
            {
                statusCode = 1;
                data = new List<Dictionary<string, object>>();
                Dictionary<string, object> row;

                DataRow dr = dtArchivo.Rows[0];
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtArchivo.Columns)
                {
                    if (col.ColumnName.Equals("contenido"))
                    {
                        row.Add(col.ColumnName, Convert.ToBase64String((byte[])dr[col]));
                    }
                    else
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                }

                data.Add(row);
            }
            else
            {
                statusCode = 0;
                msg = "No se ha encontrado el archivo solicitado";
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar el archivo";
        }

        return buildResponse(statusCode, msg, data);
    }

    #region Presupuesto

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string closeOT_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerotId = request.Form.Get("tallerotId");

        if (tallerotId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.closeOT(
            tallerotId
        );

        switch (statusCode)
        {
            case -8:
                {
                    msg = "La OT no tiene estado 'Pendiente cierre'";
                    statusCode = 0;

                    break;
                }

            case -7:
                {
                    msg = "No se puede cerrar la OT mientras tenga presupuestos abiertos";
                    statusCode = 0;

                    break;
                }

            case -6:
                {
                    msg = "No se puede cerrar la OT mientras tenga presupuestos en estado 'Pendiente'";
                    statusCode = 0;

                    break;
                }

            case -5:
                {
                    msg = "Para cerrar la OT debe cargar al menos 1 informe de entrega";
                    statusCode = 0;

                    break;
                }

            case -4:
                {
                    msg = "Para cerrar una OT que tiene repuestos asociados debe cargar al menos 1 solicitud de compra";
                    statusCode = 0;

                    break;
                }

            case -3:
                {
                    msg = "Para cerrar una OT que tiene repuestos asociados debe cargar al menos 1 orden de compra";
                    statusCode = 0;

                    break;
                }

            case -2:
                {
                    msg = "No se puede cerrar la OT mientras tenga repuestos que no han sido requisados";
                    statusCode = 0;

                    break;
                }

            case -1:
                {
                    msg = "*Se ha producido un error de sistema al cerrar la OT";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al cerrar la OT";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente el cierre de la OT";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string registerFinReparacionPresupuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerpresupuestoId = request.Form.Get("tallerpresupuestoId");
        string tallerotId = request.Form.Get("tallerotId");

        if (tallerpresupuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un presupuesto válido";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.registerFinReparacionPresupuesto(
            tallerpresupuestoId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al cerrar la reparación";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al cerrar la reparación";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente el cierre de la reparación";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string removeInformeEntrega_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerinformeentregaId = request.Form.Get("tallerinformeentregaId");

        if (tallerinformeentregaId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un informe de entrega válido";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.removeInformeEntrega(
            tallerinformeentregaId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al eliminar el informe de entrega";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al eliminar el informe de entrega";

                    break;
                }

            case 1:
                {
                    msg = "Se ha eliminado exitosamente el informe de entrega";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListInformeEntrega_JSON(string tallerot_id)
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        if (tallerot_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la OT";

            return this.buildResponse(statusCode, msg, data);
        }

        DataTable dtHeaderInformeEntrega = TallerController.getHeaderListInformeEntrega(tallerot_id);

        if (dtHeaderInformeEntrega != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderInformeEntrega.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderInformeEntrega.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de informes de entrega";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertInformeEntrega_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerOTId = request.Form.Get("tallerOTId");
        string numeroInformeEntrega = request.Form.Get("numeroInformeEntrega");
        string observaciones = request.Form.Get("observaciones");

        if (tallerOTId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (tallerOTId.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroInformeEntrega == null)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de informe de entrega";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroInformeEntrega.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de informe de entrega";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones == null)
        {
            statusCode = -2;
            msg = "No se han indidicado las observaciones";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones.Length < 1)
        {
            observaciones = null;
        }

        statusCode = TallerController.insertInformeEntrega(
            tallerOTId,
            numeroInformeEntrega,
            observaciones
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al registrar el informe de entrega";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al registrar el informe de entrega";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente el informe de entrega";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string removeRequisicion_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerrequisicionId = request.Form.Get("tallerrequisicionId");

        if (tallerrequisicionId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una requisición válido";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.removeRequisicion(
            tallerrequisicionId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al eliminar la requisición";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al eliminar la requisición";

                    break;
                }

            case 1:
                {
                    msg = "Se ha eliminado exitosamente la requisición";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getInfoTallerRequisicion_JSON(string tallerrequisicion_id)
    {
        int statusCode = 0;
        string msg = "";
        Dictionary<string, object> data = null;

        if (tallerrequisicion_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el presupuesto de la requisición";

            return this.buildResponse(statusCode, msg, data);
        }

        Dictionary<string, DataTable> dictInfoTallerRequisicion = TallerController.getInfoTallerRequisicion(tallerrequisicion_id);

        if (dictInfoTallerRequisicion != null)
        {
            statusCode = 1;
            data = new Dictionary<string, object>();

            List<object> table;
            Dictionary<string, object> row;
            foreach (KeyValuePair<string, DataTable> pairDataTable in dictInfoTallerRequisicion)
            {
                if (pairDataTable.Key.ToUpper().Equals("TALLERREQUISICION"))
                {
                    DataRow dr = pairDataTable.Value.Rows[0];

                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in pairDataTable.Value.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }

                    data.Add("TallerRequisicion", row);

                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERREPUESTO"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerRepuesto", table);
                }
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la información del presupuesto";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertRequisicion_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerOTId = request.Form.Get("tallerOTId");
        string numeroRequisicion = request.Form.Get("numeroRequisicion");
        string retiradoPor = request.Form.Get("retiradoPor");
        string stringListRepuestoId = request.Form.Get("stringListRepuestoId");
        string stringListRepuestoCantidad = request.Form.Get("stringListRepuestoCantidad");

        if (tallerOTId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (tallerOTId.Length < 1) 
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroRequisicion == null)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de requisición";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroRequisicion.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de requisición";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (retiradoPor == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la persona que retira los repuestos";

            return this.buildResponse(statusCode, msg, data);
        }
        else if(retiradoPor.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha ingresado la persona que retira los repuestos";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (stringListRepuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoId = null;
        if (stringListRepuestoId.Length > 0)
        {
            listRepuestoId = stringListRepuestoId.Split(',');
            if (listRepuestoId.Length < 1)
            {
                statusCode = -2;
                msg = "La lista de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoId = new string[0];
        }

        if (stringListRepuestoCantidad == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la cantidad de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoCantidad = null;
        if (stringListRepuestoId.Length > 0)
        {
            listRepuestoCantidad = stringListRepuestoCantidad.Split(',');
            if (listRepuestoCantidad.Length < 1)
            {
                statusCode = -2;
                msg = "La cantidad de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoCantidad = new string[0];
        }

        if (listRepuestoId.Length != listRepuestoCantidad.Length)
        {
            statusCode = -2;
            msg = "La lista de repuestos es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if(listRepuestoId.Length < 1)
        {
            statusCode = -2;
            msg = "La lista de repuestos está vacía";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.insertRequisicion(
            tallerOTId,
            numeroRequisicion,
            retiradoPor,
            listRepuestoId,
            listRepuestoCantidad
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al registrar la requisición";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al registrar la requisición";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente la requisición";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListTallerOT_Repuesto_PorRequisar_JSON(string tallerot_id)
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        if (tallerot_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la OT";

            return this.buildResponse(statusCode, msg, data);
        }

        DataTable dtHeaderListTallerOT_Repuesto_PorRequisar = TallerController.getHeaderListTallerOT_Repuesto_PorRequisar(tallerot_id);

        if (dtHeaderListTallerOT_Repuesto_PorRequisar != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderListTallerOT_Repuesto_PorRequisar.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderListTallerOT_Repuesto_PorRequisar.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de repuestos por requisar";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string removeOrdenCompra_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerordencompraId = request.Form.Get("tallerordencompraId");

        if (tallerordencompraId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una orden de compra válida";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.removeOrdenCompra(
            tallerordencompraId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al eliminar la orden de compra";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al eliminar la orden de compra";

                    break;
                }

            case 1:
                {
                    msg = "Se ha eliminado exitosamente la orden de compra";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListOrdenCompra_JSON(string tallerot_id)
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        if (tallerot_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la OT";

            return this.buildResponse(statusCode, msg, data);
        }

        DataTable dtHeaderOrdenCompra = TallerController.getHeaderListOrdenCompra(tallerot_id);

        if (dtHeaderOrdenCompra != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderOrdenCompra.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderOrdenCompra.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de ordenes de compra";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertOrdenCompra_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerOTId = request.Form.Get("tallerOTId");
        string numeroOrdenCompra = request.Form.Get("numeroOrdenCompra");
        string observaciones = request.Form.Get("observaciones");

        if (tallerOTId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (tallerOTId.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroOrdenCompra == null)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de orden de compra";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroOrdenCompra.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de orden de compra";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones == null)
        {
            statusCode = -2;
            msg = "No se han indidicado las observaciones";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones.Length < 1)
        {
            observaciones = null;
        }

        statusCode = TallerController.insertOrdenCompra(
            tallerOTId,
            numeroOrdenCompra,
            observaciones
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al registrar la orden de compra";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al registrar la orden de compra";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente la orden de compra";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string removeSolicitudCompra_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallersolicitudcompraId = request.Form.Get("tallersolicitudcompraId");

        if (tallersolicitudcompraId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una solicitud de compra válida";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.removeSolicitudCompra(
            tallersolicitudcompraId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al eliminar la solicitud de compra";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al eliminar la solicitud de compra";

                    break;
                }

            case 1:
                {
                    msg = "Se ha eliminado exitosamente la solicitud de compra";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListSolicitudCompra_JSON(string tallerot_id)
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        if (tallerot_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la OT";

            return this.buildResponse(statusCode, msg, data);
        }

        DataTable dtHeaderSolicitudCompra = TallerController.getHeaderListSolicitudCompra(tallerot_id);

        if (dtHeaderSolicitudCompra != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderSolicitudCompra.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderSolicitudCompra.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de solicitudes de compra";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertSolicitudCompra_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerOTId = request.Form.Get("tallerOTId");
        string numeroSolicitudCompra = request.Form.Get("numeroSolicitudCompra");
        string observaciones = request.Form.Get("observaciones");

        if (tallerOTId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (tallerOTId.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroSolicitudCompra == null)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de de solicitud de compra";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroSolicitudCompra.Length < 1)
        {
            statusCode = -2;
            msg = "No se ha indicado el número de solicitud de compra";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones == null)
        {
            statusCode = -2;
            msg = "No se han indidicado las observaciones";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones.Length < 1)
        {
            observaciones = null;
        }

        statusCode = TallerController.insertSolicitudCompra(
            tallerOTId,
            numeroSolicitudCompra,
            observaciones
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al registrar la solicitud de compra";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al registrar la solicitud de compra";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente la solicitud de compra";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string approvePresupuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerpresupuestoId = request.Form.Get("tallerpresupuestoId");
        string observaciones = request.Form.Get("observaciones");

        if (tallerpresupuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un presupuesto válido";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((observaciones != null) && (observaciones.Length < 1))
        {
            observaciones = null;
        }

        statusCode = TallerController.approvePresupuesto(
            tallerpresupuestoId,
            observaciones
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al aprobar el presupuesto";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al aprobar el presupuesto";

                    break;
                }

            case 1:
                {
                    msg = "Se ha aprobado exitosamente el presupuesto";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string rejectPresupuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerpresupuestoId = request.Form.Get("tallerpresupuestoId");
        string observaciones = request.Form.Get("observaciones");

        if (tallerpresupuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un presupuesto válido";

            return this.buildResponse(statusCode, msg, data);
        }
        else if(observaciones == null)
        {
            statusCode = -2;
            msg = "No se han indicado las observaciones";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones.Length < 1)
        {
            statusCode = -2;
            msg = "No se han indicado las observaciones";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.rejectPresupuesto(
            tallerpresupuestoId,
            observaciones
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al rechazar el presupuesto";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al rechazar el presupuesto";

                    break;
                }

            case 1:
                {
                    msg = "Se ha rechazado exitosamente el presupuesto";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string removePresupuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerpresupuestoId = request.Form.Get("tallerpresupuestoId");

        if (tallerpresupuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un presupuesto válido";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.removePresupuesto(
            tallerpresupuestoId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al eliminar el presupuesto";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al eliminar el presupuesto";

                    break;
                }

            case 1:
                {
                    msg = "Se ha eliminado exitosamente el presupuesto";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string removeOT_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerOTId = request.Form.Get("tallerOTId");

        if (tallerOTId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.removeOT(
            tallerOTId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al eliminar la OT";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al eliminar la OT";

                    break;
                }

            case 1:
                {
                    msg = "Se ha eliminado exitosamente la OT";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string updatePresupuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerpresupuestoId = request.Form.Get("tallerpresupuestoId");
        string fechaCompromiso = request.Form.Get("fechaCompromiso");
        string descripcionFallo = request.Form.Get("descripcionFallo");
        string causaProbable = request.Form.Get("causaProbable");
        string tecnicoAsignado = request.Form.Get("tecnicoAsignado");
        string cantidadHoras = request.Form.Get("cantidadHoras");
        string valorHH = request.Form.Get("valorHH");
        string stringListRepuestoId = request.Form.Get("stringListRepuestoId");
        string stringListRepuestoCantidad = request.Form.Get("stringListRepuestoCantidad");
        string stringListRepuestoValorUnitario = request.Form.Get("stringListRepuestoValorUnitario");
        string neto = request.Form.Get("neto");
        string iva = request.Form.Get("iva");
        string total = request.Form.Get("total");

        if (tallerpresupuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un presupuesto válido";

            return this.buildResponse(statusCode, msg, data);
        }

        DateTime dtFechaCompromiso;
        try
        {
            dtFechaCompromiso = DateTime.Parse(fechaCompromiso);
        }
        catch (Exception ex)
        {
            statusCode = -2;
            msg = "La fecha de compromiso es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if (dtFechaCompromiso < DateTime.Now)
        {
            statusCode = -2;
            msg = "La fecha de recepción debe ser posterior a la fecha actual";

            return this.buildResponse(statusCode, msg, data);
        }
        
        if (descripcionFallo == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la descripción de la falla";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (descripcionFallo.Length < 1)
        {
            descripcionFallo = null;
        }
        else if (causaProbable == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la causa probable";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (causaProbable.Length < 1)
        {
            causaProbable = null;
        }
        else if (tecnicoAsignado == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el técnico asignado";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((cantidadHoras == null) || (cantidadHoras.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado la cantidad de horas";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((valorHH == null) || (valorHH.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor hora";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (stringListRepuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoId = null;
        if (stringListRepuestoId.Length > 0)
        {
            listRepuestoId = stringListRepuestoId.Split(',');
            if (listRepuestoId.Length < 1)
            {
                statusCode = -2;
                msg = "La lista de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoId = new string[0];
        }

        if (stringListRepuestoCantidad == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la cantidad de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoCantidad = null;
        if (stringListRepuestoId.Length > 0)
        {
            listRepuestoCantidad = stringListRepuestoCantidad.Split(',');
            if (listRepuestoCantidad.Length < 1)
            {
                statusCode = -2;
                msg = "La cantidad de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoCantidad = new string[0];
        }

        if (stringListRepuestoValorUnitario == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor unitario de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoValorUnitario = null;
        if (stringListRepuestoValorUnitario.Length > 0)
        {
            listRepuestoValorUnitario = stringListRepuestoValorUnitario.Split(',');
            if (listRepuestoValorUnitario.Length < 1)
            {
                statusCode = -2;
                msg = "Los valores de repuestos están vacíos";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoValorUnitario = new string[0];
        }


        if ((listRepuestoId.Length != listRepuestoCantidad.Length) || (listRepuestoId.Length != listRepuestoValorUnitario.Length) || (listRepuestoCantidad.Length != listRepuestoValorUnitario.Length))
        {
            statusCode = -2;
            msg = "La lista de repuestos es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if ((neto == null) || (neto.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor neto";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((iva == null) || (iva.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor iva";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((total == null) || (total.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor total";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.updatePresupuesto(
            tallerpresupuestoId,
            fechaCompromiso,
            descripcionFallo,
            causaProbable,
            tecnicoAsignado,
            cantidadHoras,
            valorHH,
            listRepuestoId,
            listRepuestoCantidad,
            listRepuestoValorUnitario,
            neto,
            iva,
            total
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al editar el presupuesto";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al editar el presupuesto";

                    break;
                }

            case 1:
                {
                    msg = "Se ha editado exitosamente el presupuesto";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getInfoTallerPresupuesto_JSON(string tallerpresupuesto_id)
    {
        int statusCode = 0;
        string msg = "";
        Dictionary<string, object> data = null;

        if (tallerpresupuesto_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el presupuesto de la OT";

            return this.buildResponse(statusCode, msg, data);
        }

        Dictionary<string, DataTable> dictInfoTallerPresupuesto = TallerController.getInfoTallerPresupuesto(tallerpresupuesto_id);

        if (dictInfoTallerPresupuesto != null)
        {
            statusCode = 1;
            data = new Dictionary<string, object>();

            List<object> table;
            Dictionary<string, object> row;
            foreach (KeyValuePair<string, DataTable> pairDataTable in dictInfoTallerPresupuesto)
            {
                if (pairDataTable.Key.ToUpper().Equals("TALLERPRESUPUESTO"))
                {
                    DataRow dr = pairDataTable.Value.Rows[0];

                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in pairDataTable.Value.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }

                    data.Add("TallerPresupuesto", row);

                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERREPUESTO"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerRepuesto", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERREQUISICION"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerRequisicion", table);
                }
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la información del presupuesto";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getInfoTallerOT_JSON(string tallerot_id)
    {
        int statusCode = 0;
        string msg = "";
        Dictionary<string, object> data = null;

        if (tallerot_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la OT de taller";

            return this.buildResponse(statusCode, msg, data);
        }

        Dictionary<string, DataTable> dictInfoTallerOT = TallerController.getInfoTallerOT(tallerot_id);

        if (dictInfoTallerOT != null)
        {
            statusCode = 1;
            data = new Dictionary<string, object>();

            List<object> table;
            Dictionary<string, object> row;
            foreach (KeyValuePair<string, DataTable> pairDataTable in dictInfoTallerOT)
            {
                if (pairDataTable.Key.ToUpper().Equals("TALLEROT"))
                {
                    DataRow dr = pairDataTable.Value.Rows[0];

                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in pairDataTable.Value.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }

                    data.Add("TallerOT", row);

                }
                else if (pairDataTable.Key.ToUpper().Equals("FOTO"))
                {
                    table = new List<object>();
                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Foto", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERPRESUPUESTO"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerPresupuesto", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERREPUESTO"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerRepuesto", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERSOLICITUDCOMPRA"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerSolicitudCompra", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERORDENCOMPRA"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerOrdenCompra", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERREQUISICION"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerRequisicion", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TALLERINFORMEENTREGA"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("TallerInformeEntrega", table);
                }
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la información de la OT";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertPresupuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string tallerOTId = request.Form.Get("tallerOTId");
        string fechaCompromiso = request.Form.Get("fechaCompromiso");
        string descripcionFallo = request.Form.Get("descripcionFallo");
        string causaProbable = request.Form.Get("causaProbable");
        string tecnicoAsignado = request.Form.Get("tecnicoAsignado");
        string cantidadHoras = request.Form.Get("cantidadHoras");
        string valorHH = request.Form.Get("valorHH");
        string stringListRepuestoId = request.Form.Get("stringListRepuestoId");
        string stringListRepuestoCantidad = request.Form.Get("stringListRepuestoCantidad");
        string stringListRepuestoValorUnitario = request.Form.Get("stringListRepuestoValorUnitario");
        string neto = request.Form.Get("neto");
        string iva = request.Form.Get("iva");
        string total = request.Form.Get("total");

        if (tallerOTId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado una OT válida";

            return this.buildResponse(statusCode, msg, data);
        }

        DateTime dtFechaCompromiso;
        try
        {
            dtFechaCompromiso = DateTime.Parse(fechaCompromiso);
        }
        catch (Exception ex)
        {
            statusCode = -2;
            msg = "La fecha de compromiso es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if (dtFechaCompromiso < DateTime.Now)
        {
            statusCode = -2;
            msg = "La fecha de recepción debe ser posterior a la fecha actual";

            return this.buildResponse(statusCode, msg, data);
        }

        if (descripcionFallo == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la descripción de la falla";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (descripcionFallo.Length < 1)
        {
            descripcionFallo = null;
        }
        else if (causaProbable == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la causa probable";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (causaProbable.Length < 1)
        {
            causaProbable = null;
        }
        else if (tecnicoAsignado == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el técnico asignado";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((cantidadHoras == null) || (cantidadHoras.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado la cantidad de horas";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((valorHH == null) || (valorHH.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor hora";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (stringListRepuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoId = null;
        if (stringListRepuestoId.Length > 0)
        {
            listRepuestoId = stringListRepuestoId.Split(',');
            if (listRepuestoId.Length < 1)
            {
                statusCode = -2;
                msg = "La lista de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoId = new string[0];
        }

        if (stringListRepuestoCantidad == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la cantidad de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoCantidad = null;
        if (stringListRepuestoId.Length > 0)
        {
            listRepuestoCantidad = stringListRepuestoCantidad.Split(',');
            if (listRepuestoCantidad.Length < 1)
            {
                statusCode = -2;
                msg = "La cantidad de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoCantidad = new string[0];
        }

        if (stringListRepuestoValorUnitario == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor unitario de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoValorUnitario = null;
        if (stringListRepuestoValorUnitario.Length > 0)
        {
            listRepuestoValorUnitario = stringListRepuestoValorUnitario.Split(',');
            if (listRepuestoValorUnitario.Length < 1)
            {
                statusCode = -2;
                msg = "Los valores de repuestos están vacíos";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoValorUnitario = new string[0];
        }


        if ((listRepuestoId.Length != listRepuestoCantidad.Length) || (listRepuestoId.Length != listRepuestoValorUnitario.Length) || (listRepuestoCantidad.Length != listRepuestoValorUnitario.Length))
        {
            statusCode = -2;
            msg = "La lista de repuestos es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if ((neto == null) || (neto.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor neto";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((iva == null) || (iva.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor iva";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((total == null) || (total.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor total";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.insertPresupuesto(
            tallerOTId,
            fechaCompromiso,
            descripcionFallo,
            causaProbable,
            tecnicoAsignado,
            cantidadHoras,
            valorHH,
            listRepuestoId,
            listRepuestoCantidad,
            listRepuestoValorUnitario,
            neto,
            iva,
            total
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al registrar el presupuesto";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al registrar el presupuesto";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente el presupuesto";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListTallerPresupuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderTallerPresupuesto = TallerController.getHeaderListTallerPresupuesto();

        if (dtHeaderTallerPresupuesto != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderTallerPresupuesto.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderTallerPresupuesto.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de presupuestos";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListTallerOT_Cerrada_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderTallerOT = TallerController.getHeaderListTallerOT_Cerrada();

        if (dtHeaderTallerOT != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderTallerOT.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderTallerOT.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de ordenes de trabajo";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListTallerOT_Abierta_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderTallerOT = TallerController.getHeaderListTallerOT_Abierta();

        if (dtHeaderTallerOT != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderTallerOT.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderTallerOT.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de ordenes de trabajo";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListTallerOT_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderTallerOT = TallerController.getHeaderListTallerOT();

        if (dtHeaderTallerOT != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderTallerOT.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderTallerOT.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de ordenes de trabajo";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertOT_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string talleringresoId = request.Form.Get("talleringresoId");
        string equipoId = request.Form.Get("equipoId");
        string fechaCompromiso = request.Form.Get("fechaCompromiso");
        string descripcionFallo = request.Form.Get("descripcionFallo");
        string causaProbable = request.Form.Get("causaProbable");
        string tecnicoAsignado = request.Form.Get("tecnicoAsignado");
        string cantidadHoras = request.Form.Get("cantidadHoras");
        string valorHH = request.Form.Get("valorHH");
        string stringListRepuestoId = request.Form.Get("stringListRepuestoId");
        string stringListRepuestoCantidad = request.Form.Get("stringListRepuestoCantidad");
        string stringListRepuestoValorUnitario = request.Form.Get("stringListRepuestoValorUnitario");
        string neto = request.Form.Get("neto");
        string iva = request.Form.Get("iva");
        string total = request.Form.Get("total");

        if (talleringresoId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un ingreso a taller válido";

            return this.buildResponse(statusCode, msg, data);
        }
        else if(equipoId == null)
        {
            statusCode = -2;
            msg = "No se ha indicado un ingreso a taller válido";

            return this.buildResponse(statusCode, msg, data);
        }

        DateTime dtFechaCompromiso;
        try
        {
            dtFechaCompromiso = DateTime.Parse(fechaCompromiso);
        }
        catch (Exception ex)
        {
            statusCode = -2;
            msg = "La fecha de compromiso es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if (dtFechaCompromiso < DateTime.Now)
        {
            statusCode = -2;
            msg = "La fecha de recepción debe ser posterior a la fecha actual";

            return this.buildResponse(statusCode, msg, data);
        }

        if (descripcionFallo == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la descripción de la falla";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (descripcionFallo.Length < 1)
        {
            descripcionFallo = null;
        }
        else if (causaProbable == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la causa probable";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (causaProbable.Length < 1)
        {
            causaProbable = null;
        }
        else if (tecnicoAsignado == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el técnico asignado";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((cantidadHoras == null) || (cantidadHoras.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado la cantidad de horas";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((valorHH == null) || (valorHH.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor hora";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (stringListRepuestoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoId = null;
        if(stringListRepuestoId.Length > 0)
        {
            listRepuestoId = stringListRepuestoId.Split(',');
            if (listRepuestoId.Length < 1)
            {
                statusCode = -2;
                msg = "La lista de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoId = new string[0];
        }

        if (stringListRepuestoCantidad == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la cantidad de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoCantidad = null;
        if (stringListRepuestoId.Length > 0)
        {
            listRepuestoCantidad = stringListRepuestoCantidad.Split(',');
            if (listRepuestoCantidad.Length < 1)
            {
                statusCode = -2;
                msg = "La cantidad de repuestos está vacía";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoCantidad = new string[0];
        }

        if (stringListRepuestoValorUnitario == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor unitario de repuestos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listRepuestoValorUnitario = null;
        if (stringListRepuestoValorUnitario.Length > 0)
        {
            listRepuestoValorUnitario = stringListRepuestoValorUnitario.Split(',');
            if (listRepuestoValorUnitario.Length < 1)
            {
                statusCode = -2;
                msg = "Los valores de repuestos están vacíos";

                return this.buildResponse(statusCode, msg, data);
            }
        }
        else
        {
            listRepuestoValorUnitario = new string[0];
        }


        if ((listRepuestoId.Length != listRepuestoCantidad.Length) || (listRepuestoId.Length != listRepuestoValorUnitario.Length) || (listRepuestoCantidad.Length != listRepuestoValorUnitario.Length))
        {
            statusCode = -2;
            msg = "La lista de repuestos es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if ((neto == null) || (neto.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor neto";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((iva == null) || (iva.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor iva";

            return this.buildResponse(statusCode, msg, data);
        }
        else if ((total == null) || (total.Length < 1))
        {
            statusCode = -2;
            msg = "No se ha ingresado el valor total";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.insertOT(
            talleringresoId,
            equipoId,
            fechaCompromiso,
            descripcionFallo,
            causaProbable,
            tecnicoAsignado,
            cantidadHoras,
            valorHH,
            listRepuestoId,
            listRepuestoCantidad,
            listRepuestoValorUnitario,
            neto,
            iva,
            total 
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al registrar el presupuesto inicial";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al registrar el presupuesto inicial";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente el presupuesto inicial";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getInfoRepuesto_JSON(string id)
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        if (id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el repuesto";

            return this.buildResponse(statusCode, msg, data);
        }

        DataTable dtHeaderRepuesto = TallerController.getInfoRepuesto(id);

        if (dtHeaderRepuesto != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderRepuesto.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderRepuesto.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la información del repuesto";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListRepuesto_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderRepuesto = TallerController.getHeaderListRepuesto();

        if (dtHeaderRepuesto != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderRepuesto.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderRepuesto.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de repuestos";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    #endregion

    #region Ingreso

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string updateIngreso_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string id = request.Form.Get("id");
        string numeroRecepcion = request.Form.Get("numeroRecepcion");
        string recepcionadoPor = request.Form.Get("recepcionadoPor");
        string fechaRecepcion = request.Form.Get("fechaRecepcion");
        string observaciones = request.Form.Get("observaciones");
        string contacto_id = request.Form.Get("contacto_id");
        string stringListEquipoId = request.Form.Get("stringListEquipoId");
        string stringListFotosArchivoId = request.Form.Get("stringListFotosArchivoId");
        string stringListFotosEquipoId = request.Form.Get("stringListFotosEquipoId");
        string actaRecepcionArchivoId = request.Form.Get("actaRecepcionArchivoId");
        string guiaDespachoArchivoId = request.Form.Get("guiaDespachoArchivoId");

        if (id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el ingreso";

            return this.buildResponse(statusCode, msg, data);
        }
        else if(id.Length < 1)
        {
            statusCode = -2;
            msg = "El ingreso es inválido";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroRecepcion == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el número de recepción";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (numeroRecepcion.Length < 1)
        {
            numeroRecepcion = null;
        }
        else if (recepcionadoPor == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la persona que recepcionó los equipos";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (recepcionadoPor.Length < 1)
        {
            recepcionadoPor = null;
        }
        else if (fechaRecepcion == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la fecha de recepción";

            return this.buildResponse(statusCode, msg, data);
        }

        DateTime dtFechaRecepcion;
        try
        {
            dtFechaRecepcion = DateTime.Parse(fechaRecepcion);
        }
        catch (Exception ex)
        {
            statusCode = -2;
            msg = "La fecha de recepción es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if (dtFechaRecepcion > DateTime.Now)
        {
            statusCode = -2;
            msg = "La fecha de recepción debe ser anterior a la fecha actual";

            return this.buildResponse(statusCode, msg, data);
        }

        if (observaciones == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado las observaciones";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones.Length < 1)
        {
            observaciones = null;
        }
        else if (contacto_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la persona de contacto";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (stringListEquipoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de equipos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listEquipoId = null;
        if (stringListEquipoId.Length > 0)
        {
            listEquipoId = stringListEquipoId.Split(',');
        }
        else
        {
            listEquipoId = new string[0];
        }

        if (listEquipoId.Length < 1)
        {
            statusCode = -2;
            msg = "La lista de equipos está vacía";

            return this.buildResponse(statusCode, msg, data);
        }

        if (stringListFotosEquipoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de fotos para los equipos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listFotosEquipoId = stringListFotosEquipoId.Split(',');
        if (listFotosEquipoId.Length < 1)
        {
            statusCode = -2;
            msg = "La lista de fotos para equipos está vacía";

            return this.buildResponse(statusCode, msg, data);
        }

        if (stringListFotosArchivoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de fotos para los equipos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listFotosArchivoId = stringListFotosArchivoId.Split(',');
        if (listFotosArchivoId.Length < 1)
        {
            statusCode = -2;
            msg = "La lista de fotos para equipos está vacía";

            return this.buildResponse(statusCode, msg, data);
        }

        if (actaRecepcionArchivoId == null)
        {
            statusCode = -2;
            msg = "No se ha cargado el archivo Acta de recepción";

            return this.buildResponse(statusCode, msg, data);
        }

        if (listFotosArchivoId.Length != listFotosEquipoId.Length)
        {
            statusCode = -2;
            msg = "Error al cargar las fotos";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.updateIngreso(
            id,
            numeroRecepcion,
            recepcionadoPor,
            fechaRecepcion,
            observaciones,
            contacto_id,
            listEquipoId,
            listFotosArchivoId,
            listFotosEquipoId,
            actaRecepcionArchivoId,
            guiaDespachoArchivoId
        );

        switch (statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al editar el ingreso";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al editar el ingreso";

                    break;
                }

            case 1:
                {
                    msg = "Se ha editado exitosamente el ingreso";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getInfoTallerIngreso_JSON(string talleringreso_id)
    {
        int statusCode = 0;
        string msg = "";
        Dictionary<string, object> data = null;

        if (talleringreso_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el ingreso a taller";

            return this.buildResponse(statusCode, msg, data);
        }

        Dictionary<string, DataTable> dictInfoTallerIngreso = TallerController.getInfoTallerIngreso(talleringreso_id);

        if(dictInfoTallerIngreso != null)
        {
            statusCode = 1;
            data = new Dictionary<string, object>();

            List<object> table;
            Dictionary<string, object> row;
            foreach(KeyValuePair<string, DataTable> pairDataTable in dictInfoTallerIngreso)
            {
                if (pairDataTable.Key.ToUpper().Equals("FORM_EMPRESA"))
                {
                    table = new List<object>();
                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Form_Empresa", table);
                }
                if (pairDataTable.Key.ToUpper().Equals("FORM_CONTACTO"))
                {
                    table = new List<object>();
                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Form_Contacto", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("FORM_TRABAJADOR"))
                {
                    table = new List<object>();
                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Form_Trabajador", table);
                }
                else if(pairDataTable.Key.ToUpper().Equals("TALLERINGRESO"))
                {
                    DataRow dr = pairDataTable.Value.Rows[0];

                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in pairDataTable.Value.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }

                    data.Add("TallerIngreso", row);

                }
                else if(pairDataTable.Key.ToUpper().Equals("EQUIPO"))
                {
                    table = new List<object>();

                    foreach(DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Equipo", table);
                }
                else if(pairDataTable.Key.ToUpper().Equals("DOCUMENTO"))
                {
                    table = new List<object>();

                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Documento", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("FOTO"))
                {
                    table = new List<object>();
                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Foto", table);
                }
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la información del equipo";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListTallerIngreso_Equipo_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderTallerIngreso_Equipo = TallerController.getHeaderListTallerIngreso_Equipo();

        if (dtHeaderTallerIngreso_Equipo != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderTallerIngreso_Equipo.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderTallerIngreso_Equipo.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de equipos ingresados a taller";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string insertIngreso_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        var request = HttpContext.Current.Request;

        string numeroRecepcion = request.Form.Get("numeroRecepcion");
        string recepcionadoPor = request.Form.Get("recepcionadoPor");
        string fechaRecepcion = request.Form.Get("fechaRecepcion");
        string observaciones = request.Form.Get("observaciones");
        string contacto_id = request.Form.Get("contacto_id");
        string stringListEquipoId = request.Form.Get("stringListEquipoId");
        string stringListFotosArchivoId = request.Form.Get("stringListFotosArchivoId");
        string stringListFotosEquipoId = request.Form.Get("stringListFotosEquipoId");
        string actaRecepcionArchivoId = request.Form.Get("actaRecepcionArchivoId");
        string guiaDespachoArchivoId = request.Form.Get("guiaDespachoArchivoId");

        if (numeroRecepcion == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el número de recepción";

            return this.buildResponse(statusCode, msg, data);
        }
        else if(numeroRecepcion.Length < 1)
        {
            numeroRecepcion = null;
        }
        else if (recepcionadoPor == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la persona que recepcionó los equipos";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (recepcionadoPor.Length < 1)
        {
            recepcionadoPor = null;
        }
        else if (fechaRecepcion == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la fecha de recepción";

            return this.buildResponse(statusCode, msg, data);
        }

        DateTime dtFechaRecepcion;
        try
        {
            dtFechaRecepcion = DateTime.Parse(fechaRecepcion);
        }
        catch(Exception ex)
        {
            statusCode = -2;
            msg = "La fecha de recepción es inválida";

            return this.buildResponse(statusCode, msg, data);
        }

        if(dtFechaRecepcion > DateTime.Now)
        {
            statusCode = -2;
            msg = "La fecha de recepción debe ser anterior a la fecha actual";

            return this.buildResponse(statusCode, msg, data);
        }

        if (observaciones == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado las observaciones";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (observaciones.Length < 1)
        {
            observaciones = null;
        }
        else if (contacto_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la persona de contacto";

            return this.buildResponse(statusCode, msg, data);
        }
        else if (stringListEquipoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de equipos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listEquipoId = stringListEquipoId.Split(',');
        if (listEquipoId.Length < 1)
        {
            statusCode = -2;
            msg = "La lista de equipos está vacía";

            return this.buildResponse(statusCode, msg, data);
        }

        if (stringListFotosEquipoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de fotos para los equipos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listFotosEquipoId = stringListFotosEquipoId.Split(',');
        if (listFotosEquipoId.Length < 1)
        {
            statusCode = -2;
            msg = "La lista de fotos para equipos está vacía";

            return this.buildResponse(statusCode, msg, data);
        }

        if (stringListFotosArchivoId == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la lista de fotos para los equipos";

            return this.buildResponse(statusCode, msg, data);
        }

        string[] listFotosArchivoId = stringListFotosArchivoId.Split(',');
        if (listFotosArchivoId.Length < 1)
        {
            statusCode = -2;
            msg = "La lista de fotos para equipos está vacía";

            return this.buildResponse(statusCode, msg, data);
        }

        if (actaRecepcionArchivoId == null)
        {
            statusCode = -2;
            msg = "No se ha cargado el archivo Acta de recepción";

            return this.buildResponse(statusCode, msg, data);
        }

        if (listFotosArchivoId.Length != listFotosEquipoId.Length)
        {
            statusCode = -2;
            msg = "Error al cargar las fotos";

            return this.buildResponse(statusCode, msg, data);
        }

        statusCode = TallerController.insertIngreso(
            numeroRecepcion,
            recepcionadoPor,
            fechaRecepcion,
            observaciones,
            contacto_id,
            listEquipoId,
            listFotosArchivoId,
            listFotosEquipoId,
            actaRecepcionArchivoId,
            guiaDespachoArchivoId
        );

        switch(statusCode)
        {
            case -1:
                {
                    msg = "*Se ha producido un error de sistema al registrar el ingreso";

                    break;
                }

            case 0:
                {
                    msg = "Se ha producido un error de sistema al registrar el ingreso";

                    break;
                }

            case 1:
                {
                    msg = "Se ha registrado exitosamente el ingreso";

                    break;
                }

            default:
                {
                    msg = "";

                    break;
                }
        }

        return buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getInfoEquipo_JSON(string id)
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        if (id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado el equipo";

            return this.buildResponse(statusCode, msg, data);
        }

        DataTable dtHeaderEquipo = TallerController.getInfoEquipo(id);

        if (dtHeaderEquipo != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderEquipo.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderEquipo.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la información del equipo";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListEquipo_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderEquipo = TallerController.getHeaderListEquipo();

        if (dtHeaderEquipo != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderEquipo.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderEquipo.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de equipos";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListTrabajador_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderTrabajador = TallerController.getHeaderListTrabajador();

        if (dtHeaderTrabajador != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderTrabajador.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderTrabajador.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de trabajadores";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListContacto_JSON(string empresa_id)
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        if (empresa_id == null)
        {
            statusCode = -2;
            msg = "No se ha ingresado la empresa";

            return this.buildResponse(statusCode, msg, data);
        }

        DataTable dtHeaderContacto = TallerController.getHeaderListContacto(empresa_id);

        if (dtHeaderContacto != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderContacto.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderContacto.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de contactos de la empresa";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getHeaderListEmpresa_JSON()
    {
        int statusCode = 0;
        string msg = "";
        List<Dictionary<string, object>> data = null;

        DataTable dtHeaderEmpresa = TallerController.getHeaderListEmpresa();

        if (dtHeaderEmpresa != null)
        {
            statusCode = 1;
            data = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtHeaderEmpresa.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtHeaderEmpresa.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                data.Add(row);
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar la lista de empresas";
        }

        return this.buildResponse(statusCode, msg, data);
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

    #endregion

    #region FormElements

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
    public string getFormElements_TallerIngreso_JSON()
    {
        int statusCode = 0;
        string msg = "";
        Dictionary<string, object> data = null;

        var request = HttpContext.Current.Request;

        Dictionary<string, DataTable> dictFormElements_TallerIngreso = TallerController.getFormElements_TallerIngreso();

        if (dictFormElements_TallerIngreso != null)
        {
            statusCode = 1;
            data = new Dictionary<string, object>();

            List<object> table;
            Dictionary<string, object> row;

            foreach (KeyValuePair<string, DataTable> pairDataTable in dictFormElements_TallerIngreso)
            {
                if (pairDataTable.Key.ToUpper().Equals("EMPRESA"))
                {
                    table = new List<object>();
                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Empresa", table);
                }
                else if (pairDataTable.Key.ToUpper().Equals("TRABAJADOR"))
                {
                    table = new List<object>();
                    foreach (DataRow dr in pairDataTable.Value.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in pairDataTable.Value.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }

                        table.Add(row);
                    }

                    data.Add("Trabajador", table);
                }
            }
        }
        else
        {
            statusCode = -1;
            msg = "Se ha producido un error al recuperar los elementos del formulario";
        }

        return this.buildResponse(statusCode, msg, data);
    }

    #endregion
}
