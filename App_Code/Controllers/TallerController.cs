using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TallerController
/// </summary>
public class TallerController
{
	public TallerController()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int removeArchivo(string archivo_id)
    {
        return Persistencia.getInstance().removeArchivo(archivo_id);
    }

    public static int insertArchivo(HttpPostedFile file)
    {
        return Persistencia.getInstance().insertArchivo(file);
    }

    public static DataTable getArchivo(string archivo_id)
    {
        return Persistencia.getInstance().getArchivo(archivo_id);
    }

    public static string getTimeStamp()
    {
        return DateTime.Now.ToString("yyyyMMddHHmmssffff");
    }


    #region Presupuesto

    public static int closeOT
    (
        string tallerotId
    )
    {
        return Persistencia.getInstance().closeTallerOT(
            tallerotId
        );
    }

    public static int registerFinReparacionPresupuesto
    (
        string tallerpresupuestoId
    )
    {
        return Persistencia.getInstance().registerFinReparacionTallerPresupuesto(
            tallerpresupuestoId
        );
    }

    public static int removeInformeEntrega
(
    string tallerinformeentregaId
)
    {
        return Persistencia.getInstance().removeTallerInformeEntrega(
            tallerinformeentregaId
        );
    }

    public static DataTable getHeaderListInformeEntrega(string tallerot_id)
    {
        return Persistencia.getInstance().getHeaderListTallerInformeEntrega(tallerot_id);
    }

    public static int insertInformeEntrega
    (
        string tallerOTId,
        string numeroInformeEntrega,
        string observaciones
    )
    {
        return Persistencia.getInstance().insertTallerInformeEntrega(
            tallerOTId,
            numeroInformeEntrega,
            observaciones
        );
    }

    public static int removeRequisicion
    (
        string tallerrequisicionId
    )
    {
        return Persistencia.getInstance().removeTallerRequisicion(
            tallerrequisicionId
        );
    }

    public static Dictionary<string, DataTable> getInfoTallerRequisicion(string tallerrequisicion_id)
    {
        return Persistencia.getInstance().getInfoTallerRequisicion(tallerrequisicion_id);
    }

    public static int insertRequisicion
    (
        string tallerOTId,
        string numeroRequisicion,
        string retiradoPor,
        string[] listRepuestoId,
        string[] listRepuestoCantidad
    )
    {
        return Persistencia.getInstance().insertTallerRequisicion(
            tallerOTId,
            numeroRequisicion,
            retiradoPor,
            listRepuestoId,
            listRepuestoCantidad
        );
    }

    public static DataTable getHeaderListTallerOT_Repuesto_PorRequisar
    (
        string tallerOTId
    )
    {
        return Persistencia.getInstance().getHeaderListTallerOT_Repuesto_PorRequisar(
            tallerOTId
        );
    }

    public static int removeOrdenCompra
    (
        string tallerordencompraId
    )
    {
        return Persistencia.getInstance().removeTallerOrdenCompra(
            tallerordencompraId
        );
    }

    public static DataTable getHeaderListOrdenCompra(string tallerot_id)
    {
        return Persistencia.getInstance().getHeaderListTallerOrdenCompra(tallerot_id);
    }

    public static int insertOrdenCompra
    (
        string tallerOTId,
        string numeroOrdenCompra,
        string observaciones
    )
    {
        return Persistencia.getInstance().insertTallerOrdenCompra(
            tallerOTId,
            numeroOrdenCompra,
            observaciones
        );
    }

    public static int removeSolicitudCompra
    (
        string tallersolicitudcompraId
    )
    {
        return Persistencia.getInstance().removeTallerSolicitudCompra(
            tallersolicitudcompraId
        );
    }

    public static DataTable getHeaderListSolicitudCompra(string tallerot_id)
    {
        return Persistencia.getInstance().getHeaderListTallerSolicitudCompra(tallerot_id);
    }

    public static int insertSolicitudCompra
    (
        string tallerOTId,
        string numeroSolicitudCompra,
        string observaciones
    )
    {
        return Persistencia.getInstance().insertTallerSolicitudCompra(
            tallerOTId,
            numeroSolicitudCompra,
            observaciones
        );
    }

    public static int approvePresupuesto
    (
        string tallerpresupuestoId,
        string observaciones
    )
    {
        return Persistencia.getInstance().approveTallerPresupuesto(
            tallerpresupuestoId,
            observaciones
        );
    }

    public static int rejectPresupuesto
    (
        string tallerpresupuestoId,
        string observaciones
    )
    {
        return Persistencia.getInstance().rejectTallerPresupuesto(
            tallerpresupuestoId,
            observaciones
        );
    }

    public static int removePresupuesto
    (
        string tallerpresupuestoId
    )
    {
        return Persistencia.getInstance().removeTallerPresupuesto(
            tallerpresupuestoId
        );
    }

    public static int removeOT
    (
        string tallerOTId
    )
    {
        return Persistencia.getInstance().removeTallerOT(
            tallerOTId
        );
    }

    public static int updatePresupuesto
    (
        string tallerpresupuestoId,
        string fechaCompromiso,
        string descripcionFallo,
        string causaProbable,
        string tecnicoAsignado,
        string cantidadHoras,
        string valorHH,
        string[] listRepuestoId,
        string[] listRepuestoCantidad,
        string[] listRepuestoValorUnitario,
        string neto,
        string iva,
        string total
    )
    {
        return Persistencia.getInstance().updateTallerPresupuesto(
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
    }

    public static Dictionary<string, DataTable> getInfoTallerPresupuesto(string tallerpresupuesto_id)
    {
        return Persistencia.getInstance().getInfoTallerPresupuesto(tallerpresupuesto_id);
    }

    public static Dictionary<string, DataTable> getInfoTallerOT(string tallerot_id)
    {
        return Persistencia.getInstance().getInfoTallerOT(tallerot_id);
    }

    public static int insertPresupuesto
    (
        string tallerOTId,
        string fechaCompromiso,
        string descripcionFallo,
        string causaProbable,
        string tecnicoAsignado,
        string cantidadHoras,
        string valorHH,
        string[] listRepuestoId,
        string[] listRepuestoCantidad,
        string[] listRepuestoValorUnitario,
        string neto,
        string iva,
        string total
    )
    {
        return Persistencia.getInstance().insertTallerPresupuesto(
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
    }

    public static DataTable getHeaderListTallerPresupuesto()
    {
        return Persistencia.getInstance().getHeaderListTallerPresupuesto();
    }

    public static DataTable getHeaderListTallerOT_Abierta()
    {
        return Persistencia.getInstance().getHeaderListTallerOT_Abierta();
    }

    public static DataTable getHeaderListTallerOT_Cerrada()
    {
        return Persistencia.getInstance().getHeaderListTallerOT_Cerrada();
    }

    public static DataTable getHeaderListTallerOT()
    {
        return Persistencia.getInstance().getHeaderListTallerOT();
    }

    public static int insertOT
    (
        string talleringresoId,
        string equipoId,
        string fechaCompromiso,
        string descripcionFallo,
        string causaProbable,
        string tecnicoAsignado,
        string cantidadHoras,
        string valorHH,
        string[] listRepuestoId,
        string[] listRepuestoCantidad,
        string[] listRepuestoValorUnitario,
        string neto,
        string iva,
        string total
    )
    {
        return Persistencia.getInstance().insertTallerOT(
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
    }

    public static DataTable getInfoRepuesto(string id)
    {
        return Persistencia.getInstance().getInfoRepuesto(id);
    }

    public static DataTable getHeaderListRepuesto()
    {
        return Persistencia.getInstance().getHeaderListRepuesto();
    }

    #endregion

    #region Ingreso

    public static int updateIngreso
    (
        string id,
        string guiaDespacho,
        string recepcionadoPor,
        string fechaRecepcion,
        string observaciones,
        string contacto_id,
        string[] listEquipoId,
        string[] listFotosArchivoId,
        string[] listFotosEquipoId,
        string actaRecepcionArchivoId,
        string guiaDespachoArchivoId
    )
    {
        return Persistencia.getInstance().updateTallerIngreso(
            id,
            guiaDespacho,
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
    }

    public static Dictionary<string, DataTable> getInfoTallerIngreso(string talleringreso_id)
    {
        return Persistencia.getInstance().getInfoTallerIngreso(talleringreso_id);
    }

    public static DataTable getHeaderListTallerIngreso_Equipo()
    {
        return Persistencia.getInstance().getHeaderListTallerIngreso_Equipo();
    }

    public static int insertIngreso
    (
        string guiaDespacho,
        string recepcionadoPor,
        string fechaRecepcion,
        string observaciones,
        string contacto_id,
        string[] listEquipoId,
        string[] listFotosArchivoId,
        string[] listFotosEquipoId,
        string actaRecepcionArchivoId,
        string guiaDespachoArchivoId
    )
    {
        return Persistencia.getInstance().insertTallerIngreso(
            guiaDespacho,
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
    }

    public static DataTable getHeaderListTrabajador()
    {
        return Persistencia.getInstance().getHeaderListTrabajador();
    }

    public static DataTable getHeaderListContacto(string empresa_id)
    {
        return Persistencia.getInstance().getHeaderListContacto(empresa_id);
    }

    public static DataTable getHeaderListEmpresa()
    {
        return Persistencia.getInstance().getHeaderListEmpresa();
    }

    public static DataTable getHeaderListEquipo()
    {
        return Persistencia.getInstance().getHeaderListEquipo();
    }

    public static DataTable getInfoEquipo(string id)
    {
        return Persistencia.getInstance().getInfoEquipo(id);
    }

    #endregion

    #region FormElements

    public static Dictionary<string, DataTable> getFormElements_TallerIngreso()
    {
        return Persistencia.getInstance().getFormElements_TallerIngreso();
    }

    #endregion
}