using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Threading;
using System.IO;

/// <summary>
/// Summary description for Persistencia
/// </summary>
public class Persistencia
{
    private static Persistencia p;
    private MySqlConnection Conexion;
    private MySqlCommand SQL;
    private MySqlDataAdapter sqlAdpt;
    private string Query;

    #region Conexion

    public Persistencia()
    {
        Conexion = new MySqlConnection();

        Conexion.ConnectionString = 
    }

    public static Persistencia getInstance()
    {
        if (p == null) { p = new Persistencia(); }
        return p;
    }

    private void Open()
    {
        if (Conexion.State == System.Data.ConnectionState.Open)
        {
            Thread.Sleep(1000);
            Close();
        }
        Conexion.Open();
    }

    private void Close()
    {
        Conexion.Close();
    }

    private bool isOpen()
    {
        return (this.Conexion.State == System.Data.ConnectionState.Open);
    }

    #endregion

    #region Taller

    #region Presupuesto

    /*
     *  R E S P O N S E  C O D E S  f o r  c l o s e O T
     * 
     *  -8: La OT no tiene estado "Pendiente cierre"
     *  -7: La OT tiene presupuestos abiertos
     *  -6: La OT tiene presupuestos en estado "Pendiente"
     *  -5: La OT no tiene informes de entrega
     *  -4: La OT no tiene solicitudes de compra
     *  -3: La OT no tiene ordenes de compra
     *  -2: La OT tiene repuestos sin requisar
     *  -1: Excepcion
     *   0: Error
     *   1: Cierre exitoso de la OT
     */

    public int closeTallerOT
    (
        string tallerotId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"SELECT tot.estadoOT FROM TallerOT tot WHERE (tot.id=@tallerot_id);";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                int estadoOT = -1;
                MySqlDataReader sdr = cmd.ExecuteReader();
                if(sdr.HasRows)
                {
                    sdr.Read();

                    estadoOT = sdr.GetInt32(0);
                }
                sdr.Close();

                //Si es "Pendiente cierre"
                if (estadoOT == 4)
                {
                    query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND (tp.estadoPresupuesto=@estadoPresupuesto_Aprobado);";
                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                    cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado

                    int countPresupuestosAbiertos = -1;
                    sdr = cmd.ExecuteReader();
                    if(sdr.HasRows)
                    {
                        sdr.Read();

                        countPresupuestosAbiertos = sdr.GetInt32(0);
                    }
                    sdr.Close();

                    if (countPresupuestosAbiertos == 0)
                    {
                        query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND (tp.estadoPresupuesto=@estadoPresupuesto_Pendiente);";
                        cmd.CommandText = query;

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                        cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1); //Pendiente

                        int countPresupuestosPendientes = -1;
                        sdr = cmd.ExecuteReader();
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            countPresupuestosPendientes = sdr.GetInt32(0);
                        }
                        sdr.Close();

                        if(countPresupuestosPendientes == 0)
                        {
                            query = @"SELECT COUNT(tie.id) FROM TallerInformeEntrega tie WHERE (tie.tallerot_id=@tallerot_id);";
                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                            int countInformeEntrega = -1;
                            sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();

                                countInformeEntrega= sdr.GetInt32(0);
                            }
                            sdr.Close();

                            if(countInformeEntrega > 0)
                            {
                                int cantidadRepuestosTotal = 0;

                                query = @"SELECT "
                                        + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                        + "FROM "
                                        + "   TallerPresupuesto tp, "
                                        + "   TallerPresupuesto_Repuesto tp_r "
                                        + "WHERE "
                                        + "   (tp.tallerot_id=@tallerot_id) AND "
                                        + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                        + "   (tp_r.tallerpresupuesto_id=tp.id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    cantidadRepuestosTotal = sdr.GetInt32(0);
                                }
                                sdr.Close();

                                if (cantidadRepuestosTotal > 0)
                                {
                                    query = @"SELECT COUNT(tsc.id) FROM TallerSolicitudCompra tsc WHERE (tsc.tallerot_id=@tallerot_id);";
                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                                    int countSolicitudCompra = -1;
                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();

                                        countSolicitudCompra = sdr.GetInt32(0);
                                    }
                                    sdr.Close();

                                    if (countSolicitudCompra > 0)
                                    {
                                        query = @"SELECT COUNT(toc.id) FROM TallerOrdenCompra toc WHERE (toc.tallerot_id=@tallerot_id);";
                                        cmd.CommandText = query;

                                        cmd.Parameters.Clear();
                                        cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                                        int countOrdenCompra = -1;
                                        sdr = cmd.ExecuteReader();
                                        if (sdr.HasRows)
                                        {
                                            sdr.Read();

                                            countOrdenCompra = sdr.GetInt32(0);
                                        }
                                        sdr.Close();

                                        if (countOrdenCompra > 0)
                                        {
                                            query = @"SELECT "
                                                  + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                                  + "FROM "
                                                  + "   TallerRequisicion tr, "
                                                  + "   TallerRequisicion_Repuesto tr_r "
                                                  + "WHERE "
                                                  + "   (tr.tallerot_id=@tallerot_id) AND "
                                                  + "   (tr_r.tallerrequisicion_id=tr.id);";

                                            cmd.CommandText = query;

                                            cmd.Parameters.Clear();
                                            cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                                            int cantidadRepuestosRequisados = 0;
                                            sdr = cmd.ExecuteReader();
                                            if (sdr.HasRows)
                                            {
                                                sdr.Read();
                                                cantidadRepuestosRequisados = sdr.GetInt32(0);
                                            }
                                            sdr.Close();

                                            if(cantidadRepuestosRequisados == cantidadRepuestosTotal)
                                            {
                                                responseCode = 1;
                                            }
                                            else
                                            {
                                                responseCode = -2; //La OT tiene repuestos sin requisar
                                            }
                                        }
                                        else
                                        {
                                            responseCode = -3; //La OT no tiene ordenes de compra
                                        }
                                    }
                                    else
                                    {
                                        responseCode = -4; //La OT no tiene solicitudes de compra
                                    }
                                }
                                else
                                {
                                    responseCode = 1; //TIENE informe de entrega y NO TIENE repuestos
                                }
                            }
                            else
                            {
                                responseCode = -5; //La OT no tiene informes de entrega
                            }
                        }
                        else
                        {
                            responseCode = -6; //La OT tiene presupuestos en estado "Pendiente"
                        }
                    }
                    else
                    {
                        responseCode = -7; //La OT tiene presupuestos abiertos
                    }
                }
                else
                {
                    responseCode = -8; //La OT no tiene estado "Pendiente cierre"
                }

                if(responseCode == 1)
                {
                    query = @"SELECT ti_e.equipo_id, ti_e.estadoAnterior FROM TallerIngreso_Equipo ti_e, TallerOT tot WHERE (tot.id=@tallerot_id) AND (ti_e.talleringreso_id=tot.talleringreso_id) AND (ti_e.equipo_id=tot.equipo_id);";
                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                    int equipoId = -1;
                    int estadoAnteriorEquipo = -1;
                    sdr = cmd.ExecuteReader();
                    if(sdr.HasRows)
                    {
                        sdr.Read();

                        equipoId = sdr.GetInt32(0);
                        estadoAnteriorEquipo = sdr.GetInt32(1);
                    }
                    sdr.Close();

                    if((equipoId >= 0) && (estadoAnteriorEquipo >= 0))
                    {
                        query = @"UPDATE TallerOT SET fechaCierre=NOW(), estadoOT=@estadoOT_Cerrada WHERE (id=@tallerot_id);";
                        cmd.CommandText = query;

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("estadoOT_Cerrada", 5); //Cerrada
                        cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if(rowsAffected > 0)
                        {
                            query = @"UPDATE Equipo SET uEstado=@estadoAnteriorEquipo WHERE (id=@equipo_id);";
                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("estadoAnteriorEquipo", estadoAnteriorEquipo);
                            cmd.Parameters.AddWithValue("equipo_id", equipoId);

                            rowsAffected = cmd.ExecuteNonQuery();
                            if(rowsAffected > 0)
                            {
                                responseCode = 1;
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }


                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int registerFinReparacionTallerPresupuesto
    (
        string tallerpresupuestoId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"SELECT tp.tallerot_id FROM TallerPresupuesto tp WHERE (tp.id=@id);";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                int tallerot_id = -1;
                MySqlDataReader sdr = cmd.ExecuteReader();
                if(sdr.HasRows)
                {
                    sdr.Read();
                    tallerot_id = sdr.GetInt32(0);
                }
                sdr.Close();

                if(tallerot_id >= 0)
                {
                    query = @"UPDATE TallerPresupuesto SET fechaCierre=NOW(), estadoPresupuesto=@estadoPresupuesto "
                          + "WHERE "
                          + "   (id=@id);";

                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("estadoPresupuesto", 4); //Cerrado
                    cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        int estadoOT = -1;
                        int cantidadRepuestosTotal = 0;
                        int cantidadRepuestosRequisados = 0;

                        //Comprobar si tiene repuestos no requisados
                        {
                            //Cantidad de repuestos total en la OT
                            {
                                query = @"SELECT "
                                      + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                      + "FROM "
                                      + "   TallerPresupuesto tp, "
                                      + "   TallerPresupuesto_Repuesto tp_r "
                                      + "WHERE "
                                      + "   (tp.tallerot_id=@tallerot_id) AND "
                                      + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                      + "   (tp_r.tallerpresupuesto_id=tp.id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    cantidadRepuestosTotal = sdr.GetInt32(0);
                                }
                                sdr.Close();
                            }

                            //Cantidad de repuestos requisados en la OT
                            {
                                query = @"SELECT "
	                                  + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                      + "FROM "
	                                  + "   TallerRequisicion tr, "
                                      + "   TallerRequisicion_Repuesto tr_r "
                                      + "WHERE "
                                      + "   (tr.tallerot_id=@tallerot_id) AND "
                                      + "   (tr_r.tallerrequisicion_id=tr.id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);


                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    cantidadRepuestosRequisados = sdr.GetInt32(0);
                                }
                                sdr.Close();
                            }

                            if(cantidadRepuestosRequisados == cantidadRepuestosTotal)
                            {
                                //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                                {
                                    query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();
                                        int count = sdr.GetInt32(0);

                                        if (count == 0)
                                        {
                                            estadoOT = 4; //Pendiente cierre
                                        }
                                        else
                                        {
                                            estadoOT = 3; //Reparación
                                        }
                                    }
                                    sdr.Close();
                                }
                            }
                            else
                            {
                                estadoOT = 2; //Espera de repuestos
                            }
                        }

                        if(estadoOT >= 0)
                        {
                            query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                            rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                responseCode = 1;
                            }
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    
                    }
                }
                else
                {
                    responseCode = 0;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                trans.Rollback();
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int removeTallerInformeEntrega
    (
        string tallerinformeentregaId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"DELETE FROM TallerInformeEntrega "
                              + "WHERE "
                              + "   (id=@id);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerinformeentregaId);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                trans.Rollback();
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getHeaderListTallerInformeEntrega(string tallerot_id)
    {
        DataTable dt = null;

        if (tallerot_id == null)
        {
            return dt;
        }

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT tie.id, IFNULL(tie.numeroInformeEntrega, '') AS numeroInformeEntrega, DATE_FORMAT(tie.fecha, '%Y-%m-%d %H:%i:%s') AS fecha, IFNULL(tie.observaciones, '') AS observaciones FROM TallerInformeEntrega tie WHERE (tie.tallerot_id=@tallerot_id) ORDER BY (tie.id) ASC;";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public int insertTallerInformeEntrega
    (
        string tallerOTId,
        string numeroInformeEntrega,
        string observaciones
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"INSERT INTO TallerInformeEntrega ("
                                  + "tallerot_id, "
                                  + "numeroInformeEntrega, "
                                  + "fecha, "
                                  + "observaciones) VALUES ( "
                                  + "@tallerot_id, "
                                  + "@numeroInformeEntrega, "
                                  + "NOW(), "
                                  + "@observaciones);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("tallerot_id", tallerOTId);
                cmd.Parameters.AddWithValue("numeroInformeEntrega", numeroInformeEntrega);
                cmd.Parameters.AddWithValue("observaciones", observaciones);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int removeTallerRequisicion
    (
        string tallerrequisicionId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"SELECT tr.tallerot_id FROM TallerRequisicion tr WHERE (tr.id=@id);";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerrequisicionId);

                int tallerot_id = -1;
                MySqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    sdr.Read();
                    tallerot_id = sdr.GetInt32(0);
                }
                sdr.Close();

                if(tallerot_id >= 0)
                {
                    query = @"DELETE FROM TallerRequisicion "
                          + "WHERE "
                          + "   (id=@id);";

                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("id", tallerrequisicionId);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        responseCode = 1;
                    }
                }
                else
                {
                    responseCode = 0;
                }

                if (responseCode == 1)
                {
                    int estadoOT = -1;
                    int cantidadRepuestosTotal = 0;
                    int cantidadRepuestosRequisados = 0;

                    //Comprobar si tiene repuestos no requisados
                    {
                        //Cantidad de repuestos total en la OT
                        {
                            query = @"SELECT "
                                    + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                    + "FROM "
                                    + "   TallerPresupuesto tp, "
                                    + "   TallerPresupuesto_Repuesto tp_r "
                                    + "WHERE "
                                    + "   (tp.tallerot_id=@tallerot_id) AND "
                                    + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                    + "   (tp_r.tallerpresupuesto_id=tp.id);";

                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                            cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                            cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                            sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                cantidadRepuestosTotal = sdr.GetInt32(0);
                            }
                            else
                            {
                                responseCode = 0;
                            }

                            sdr.Close();
                        }

                        //Cantidad de repuestos requisados en la OT
                        {
                            query = @"SELECT "
                                    + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                    + "FROM "
                                    + "   TallerRequisicion tr, "
                                    + "   TallerRequisicion_Repuesto tr_r "
                                    + "WHERE "
                                    + "   (tr.tallerot_id=@tallerot_id) AND "
                                    + "   (tr_r.tallerrequisicion_id=tr.id);";

                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);


                            sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                cantidadRepuestosRequisados = sdr.GetInt32(0);
                            }
                            else
                            {
                                responseCode = 0;
                            }

                            sdr.Close();
                        }

                        if (cantidadRepuestosRequisados == cantidadRepuestosTotal)
                        {
                            //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                            {
                                query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    int count = sdr.GetInt32(0);

                                    if (count == 0)
                                    {
                                        estadoOT = 4; //Pendiente cierre
                                    }
                                    else
                                    {
                                        estadoOT = 3; //Reparación
                                    }
                                }
                                else
                                {
                                    responseCode = 0;
                                }

                                sdr.Close();
                            }
                        }
                        else
                        {
                            estadoOT = 2; //Espera de repuestos
                        }
                    }

                    if (estadoOT >= 0)
                    {
                        query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                        cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            responseCode = 1;
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public Dictionary<string, DataTable> getInfoTallerRequisicion(string id)
    {
        Dictionary<string, DataTable> dictInfoTallerRequisicion = new Dictionary<string, DataTable>();

        if (id == null)
        {
            return null;
        }

        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                { //TallerRequisicion
                    string query = @"SELECT "
	                             + "    tr.id AS tallerrequisicion_id, "
                                 + "    tr.numeroRequisicion AS tallerrequisicion_numeroRequisicion, "
	                             + "    DATE_FORMAT(tr.fecha, '%Y-%m-%d %H:%i:%s') AS tallerrequisicion_fecha, "
	                             + "    t.id AS trabajador_id, "
                                 + "    IFNULL(t.rut, '') AS trabajador_rut, "
                                 + "    CONCAT(IFNULL(t.nombre, ''), ' ', IFNULL(t.apellido, '')) AS trabajador_nombre, "
                                 + "    IFNULL(t.cargo, '') AS trabajador_cargo, "
                                 + "    IFNULL(t.email, '') AS trabajador_email "
                                 + "FROM "
	                             + "    TallerRequisicion tr, "
	                             + "    Trabajador t "
                                 + "WHERE "
	                             + "    (tr.id=@id) AND "
                                 + "    (t.id=tr.retiradoPor);";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerRequisicion.Add("TallerRequisicion", dt);
                }

                { //TallerRepuesto
                    string query = @"SELECT "
                                 + "    r.id AS repuesto_id, "
                                 + "    IFNULL(r.cod, '') AS repuesto_codigo, "
                                 + "    r.sap AS repuesto_sap, "
                                 + "    IFNULL(r.nombre, '') AS repuesto_nombre, "
                                 + "    IFNULL(r.descripcion, '') AS repuesto_descripcion, "
                                 + "    tr_r.cantidad AS tallerrequisicion_repuesto_cantidad "
                                 + "FROM "
                                 + "    TallerRequisicion_Repuesto tr_r, "
                                 + "    Repuesto r "
                                 + "WHERE "
                                 + "    (tr_r.tallerrequisicion_id=@id) AND "
                                 + "    (r.id=tr_r.repuesto_id) "
                                 + "ORDER BY "
                                 + "    (tr_r.repuesto_id) DESC;";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerRequisicion.Add("TallerRepuesto", dt);
                }
            }
        }
        catch (Exception ex)
        {
            dictInfoTallerRequisicion = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dictInfoTallerRequisicion;
    }

    public int insertTallerRequisicion
    (
        string tallerotId,
        string numeroRequisicion,
        string retiradoPor,
        string[] listRepuestoId,
        string[] listRepuestoCantidad
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                bool repuestosValidos = true;

                string query = @"SELECT "
                                + "    tp_r.repuesto_id AS repuesto_id, "
                                + "    SUM(tp_r.cantidad) AS cantidadTotal, "
                                + "    IFNULL( "
                                + "            ( "
                                + "                SELECT "
                                + "                    SUM(tr_r.cantidad) "
                                + "                FROM "
                                + "                    TallerOT tot, "
                                + "                    TallerRequisicion tr, "
                                + "                    TallerRequisicion_Repuesto tr_r "
                                + "                WHERE "
                                + "                    (tot.id=@tallerot_id) AND "
                                + "                    (tr.tallerot_id=tot.id) AND "
                                + "                    (tr_r.tallerrequisicion_id=tr.id) AND "
                                + "                    (tr_r.repuesto_id=tp_r.repuesto_id) "
                                + "            ), "
                                + "            0 "
                                + "    ) AS cantidadRequisada "
                                + "FROM "
                                + "    TallerOT tot, "
                                + "    TallerPresupuesto tp, "
                                + "    TallerPresupuesto_Repuesto tp_r, "
                                + "    Repuesto r "
                                + "WHERE "
                                + "    (tot.id=@tallerot_id) AND "
                                + "    (tp.tallerot_id=tot.id) AND "
                                + "    ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                + "    (tp_r.tallerpresupuesto_id=tp.id) AND "
                                + "    (r.id=tp_r.repuesto_id) "
                                + "GROUP BY "
                                + "    (tp_r.repuesto_id);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                Dictionary<int, int> dictRepuestosNoRequisados = new Dictionary<int, int>();
                MySqlDataReader sdr = cmd.ExecuteReader();
                if(sdr.HasRows)
                {
                    int repuesto_id = -1;
                    int cantidadTotal = -1;
                    int cantidadRequisada = -1;

                    while(sdr.Read())
                    {

                        repuesto_id = sdr.GetInt32(0);
                        cantidadTotal = sdr.GetInt32(1);
                        cantidadRequisada = sdr.GetInt32(2);

                        dictRepuestosNoRequisados.Add(repuesto_id, cantidadTotal - cantidadRequisada);
                    }
                }
                sdr.Close();

                int cantidadNoRequisada = -1;

                for (int i = 0; i < listRepuestoId.Length; i++)
                {
                    if(dictRepuestosNoRequisados.ContainsKey(Convert.ToInt32(listRepuestoId[i])))
                    {
                        if(dictRepuestosNoRequisados.TryGetValue(Convert.ToInt32(listRepuestoId[i]), out cantidadNoRequisada))
                        {
                            if (Convert.ToInt32(listRepuestoCantidad[i]) > cantidadNoRequisada)
                            {
                                responseCode = 0;
                                repuestosValidos = false;

                                break;
                            }
                        }
                    }
                    else
                    {
                        responseCode = 0;
                        repuestosValidos = false;

                        break;
                    }
                }

                //BLEBLE

                if(repuestosValidos == true)
                {
                    query = @"INSERT INTO TallerRequisicion ("
                          + "tallerot_id, "
                          + "numeroRequisicion, "
                          + "fecha, "
                          + "retiradoPor) VALUES ( "
                          + "@tallerot_id, "
                          + "@numeroRequisicion, "
                          + "NOW(), "
                          + "@retiradoPor);";

                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                    cmd.Parameters.AddWithValue("numeroRequisicion", numeroRequisicion);
                    cmd.Parameters.AddWithValue("retiradoPor", retiradoPor);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        responseCode = 1;

                        query = @"SELECT last_insert_id();";
                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        sdr = cmd.ExecuteReader();

                        int tallerrequisicion_id = -1;
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            tallerrequisicion_id = sdr.GetInt32(0);
                        }

                        sdr.Close();

                        if (tallerrequisicion_id >= 0)
                        {
                            for (int i = 0; i < listRepuestoId.Length; i++)
                            {
                                query = @"INSERT INTO TallerRequisicion_Repuesto (tallerrequisicion_id, repuesto_id, cantidad) VALUES (@tallerrequisicion_id, @repuesto_id, @cantidad);";
                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerrequisicion_id", tallerrequisicion_id);
                                cmd.Parameters.AddWithValue("repuesto_id", listRepuestoId[i]);
                                cmd.Parameters.AddWithValue("cantidad", listRepuestoCantidad[i]);

                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    //nothing
                                }
                                else
                                {
                                    responseCode = 0;

                                    break;
                                }
                            }

                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }

                    if(responseCode == 1)
                    {
                        int estadoOT = -1;
                        int cantidadRepuestosTotal = 0;
                        int cantidadRepuestosRequisados = 0;

                        //Comprobar si tiene repuestos no requisados
                        {
                            //Cantidad de repuestos total en la OT
                            {
                                query = @"SELECT "
                                        + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                        + "FROM "
                                        + "   TallerPresupuesto tp, "
                                        + "   TallerPresupuesto_Repuesto tp_r "
                                        + "WHERE "
                                        + "   (tp.tallerot_id=@tallerot_id) AND "
                                        + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                        + "   (tp_r.tallerpresupuesto_id=tp.id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    cantidadRepuestosTotal = sdr.GetInt32(0);
                                }
                                else
                                {
                                    responseCode = 0;
                                }

                                sdr.Close();
                            }

                            //Cantidad de repuestos requisados en la OT
                            {
                                query = @"SELECT "
                                        + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                        + "FROM "
                                        + "   TallerRequisicion tr, "
                                        + "   TallerRequisicion_Repuesto tr_r "
                                        + "WHERE "
                                        + "   (tr.tallerot_id=@tallerot_id) AND "
                                        + "   (tr_r.tallerrequisicion_id=tr.id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerotId);


                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    cantidadRepuestosRequisados = sdr.GetInt32(0);
                                }
                                else
                                {
                                    responseCode = 0;
                                }

                                sdr.Close();
                            }

                            if (cantidadRepuestosRequisados == cantidadRepuestosTotal)
                            {
                                //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                                {
                                    query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();
                                        int count = sdr.GetInt32(0);

                                        if (count == 0)
                                        {
                                            estadoOT = 4; //Pendiente cierre
                                        }
                                        else
                                        {
                                            estadoOT = 3; //Reparación
                                        }
                                    }
                                    else
                                    {
                                        responseCode = 0;
                                    }

                                    sdr.Close();
                                }
                            }
                            else
                            {
                                estadoOT = 2; //Espera de repuestos
                            }
                        }

                        if (estadoOT >= 0)
                        {
                            query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                            cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                            rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                responseCode = 1;
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                }
                else
                {
                    responseCode = 0;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getHeaderListTallerOT_Repuesto_PorRequisar(string tallerot_id)
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT "
                             + "    tp_r.repuesto_id AS repuesto_id, "
                             + "    r.sap AS repuesto_sap, "
                             + "    IFNULL(r.cod, '') AS repuesto_codigo, "
                             + "    IFNULL(r.nombre, '') AS repuesto_nombre, "
                             + "    IFNULL(r.descripcion, '') AS repuesto_descripcion, "
                             + "    SUM(tp_r.cantidad) AS cantidadTotal, "
                             + "    IFNULL( "
			                 + "            ( "
				             + "                SELECT "
					         + "                    SUM(tr_r.cantidad) "
				             + "                FROM "
					         + "                    TallerOT tot, "
					         + "                    TallerRequisicion tr, "
					         + "                    TallerRequisicion_Repuesto tr_r "
				             + "                WHERE "
					         + "                    (tot.id=@tallerot_id) AND "
					         + "                    (tr.tallerot_id=tot.id) AND "
					         + "                    (tr_r.tallerrequisicion_id=tr.id) AND "
					         + "                    (tr_r.repuesto_id=tp_r.repuesto_id) "
			                 + "            ), "
                             + "            0 "
	                         + "    ) AS cantidadRequisada "
                             + "FROM "
	                         + "    TallerOT tot, "
                             + "    TallerPresupuesto tp, "
                             + "    TallerPresupuesto_Repuesto tp_r, "
                             + "    Repuesto r "
                             + "WHERE "
	                         + "    (tot.id=@tallerot_id) AND "
                             + "    (tp.tallerot_id=tot.id) AND "
                             + "    ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                             + "    (tp_r.tallerpresupuesto_id=tp.id) AND "
                             + "    (r.id=tp_r.repuesto_id) "
                             + "GROUP BY "
	                         + "    (tp_r.repuesto_id);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public int removeTallerOrdenCompra
    (
        string tallerordencompraId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"DELETE FROM TallerOrdenCompra "
                              + "WHERE "
                              + "   (id=@id);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerordencompraId);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                trans.Rollback();
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getHeaderListTallerOrdenCompra(string tallerot_id)
    {
        DataTable dt = null;

        if (tallerot_id == null)
        {
            return dt;
        }

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT toc.id, toc.numeroOrdenCompra, DATE_FORMAT(toc.fecha, '%Y-%m-%d %H:%i:%s') AS fecha, IFNULL(toc.observaciones, '') AS observaciones FROM TallerOrdenCompra toc WHERE (toc.tallerot_id=@tallerot_id) ORDER BY (toc.id) ASC;";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public int insertTallerOrdenCompra
    (
        string tallerOTId,
        string numeroOrdenCompra,
        string observaciones
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"INSERT INTO TallerOrdenCompra ("
                                  + "tallerot_id, "
                                  + "numeroOrdenCompra, "
                                  + "fecha, "
                                  + "observaciones) VALUES ( "
                                  + "@tallerot_id, "
                                  + "@numeroOrdenCompra, "
                                  + "NOW(), "
                                  + "@observaciones);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("tallerot_id", tallerOTId);
                cmd.Parameters.AddWithValue("numeroOrdenCompra", numeroOrdenCompra);
                cmd.Parameters.AddWithValue("observaciones", observaciones);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int removeTallerSolicitudCompra
    (
        string tallersolicitudcompraId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"DELETE FROM TallerSolicitudCompra "
                              + "WHERE "
                              + "   (id=@id);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallersolicitudcompraId);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                trans.Rollback();
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getHeaderListTallerSolicitudCompra(string tallerot_id)
    {
        DataTable dt = null;

        if (tallerot_id == null)
        {
            return dt;
        }

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT tsc.id, tsc.numeroSolicitudCompra, DATE_FORMAT(tsc.fecha, '%Y-%m-%d %H:%i:%s') AS fecha, IFNULL(tsc.observaciones, '') AS observaciones FROM TallerSolicitudCompra tsc WHERE (tsc.tallerot_id=@tallerot_id) ORDER BY (tsc.id) ASC;";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public int insertTallerSolicitudCompra
    (
        string tallerOTId,
        string numeroSolicitudCompra,
        string observaciones
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"INSERT INTO TallerSolicitudCompra ("
                                  + "tallerot_id, "
                                  + "numeroSolicitudCompra, "
                                  + "fecha, "
                                  + "observaciones) VALUES ( "
                                  + "@tallerot_id, "
                                  + "@numeroSolicitudCompra, "
                                  + "NOW(), "
                                  + "@observaciones);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("tallerot_id", tallerOTId);
                cmd.Parameters.AddWithValue("numeroSolicitudCompra", numeroSolicitudCompra);
                cmd.Parameters.AddWithValue("observaciones", observaciones);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int approveTallerPresupuesto
    (
        string tallerpresupuestoId,
        string observaciones
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"SELECT tp.tallerot_id FROM TallerPresupuesto tp WHERE (tp.id=@id);";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                int tallerot_id = -1;
                MySqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    sdr.Read();
                    tallerot_id = sdr.GetInt32(0);
                }
                sdr.Close();

                if(tallerot_id >= 0)
                {
                    query = @"SELECT tp.estadoPresupuesto FROM TallerPresupuesto tp WHERE (tp.id=@id);";
                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                    int estadoPresupuesto = -1;
                    sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        sdr.Read();
                        estadoPresupuesto = sdr.GetInt32(0);
                    }
                    sdr.Close();

                    if(estadoPresupuesto == 1) //Si el presupuesto tiene estado "Pendiente"
                    {
                        query = @"UPDATE TallerPresupuesto SET fechaAprobacion=NOW(), estadoPresupuesto=@estadoPresupuesto, observaciones=@observaciones "
                              + "WHERE "
                              + "   (id=@id);";

                        cmd.CommandText = query;

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("estadoPresupuesto", 3); //Aprobado
                        cmd.Parameters.AddWithValue("observaciones", observaciones);
                        cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        //Cambiar fechaCompromiso de OT
                        if (rowsAffected > 0)
                        {
                            query = @"SELECT tp.fechaCompromiso FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) ORDER BY (tp.fechaCompromiso) DESC LIMIT 0,1;";
                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                            bool dateReaded = false;
                            DateTime fechaCompromiso = DateTime.Now;
                            sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();

                                dateReaded = true;
                                fechaCompromiso = sdr.GetDateTime(0);
                            }
                            sdr.Close();

                            if(dateReaded == true)
                            {
                                query = @"UPDATE TallerOT SET fechaCompromiso=@fechaCompromiso "
                                      + "WHERE "
                                      + "   (id=@tallerot_id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("fechaCompromiso", fechaCompromiso);
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                                rowsAffected = cmd.ExecuteNonQuery();
                                if(rowsAffected > 0)
                                {
                                    responseCode = 1;
                                }
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }

                        if (responseCode == 1)
                        {
                            int estadoOT = -1;
                            int cantidadRepuestosTotal = 0;
                            int cantidadRepuestosRequisados = 0;

                            //Comprobar si tiene repuestos no requisados
                            {
                                //Cantidad de repuestos total en la OT
                                {
                                    query = @"SELECT "
                                            + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                            + "FROM "
                                            + "   TallerPresupuesto tp, "
                                            + "   TallerPresupuesto_Repuesto tp_r "
                                            + "WHERE "
                                            + "   (tp.tallerot_id=@tallerot_id) AND "
                                            + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                            + "   (tp_r.tallerpresupuesto_id=tp.id);";

                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();
                                        cantidadRepuestosTotal = sdr.GetInt32(0);
                                    }
                                    else
                                    {
                                        responseCode = 0;
                                    }

                                    sdr.Close();
                                }

                                //Cantidad de repuestos requisados en la OT
                                {
                                    query = @"SELECT "
                                            + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                            + "FROM "
                                            + "   TallerRequisicion tr, "
                                            + "   TallerRequisicion_Repuesto tr_r "
                                            + "WHERE "
                                            + "   (tr.tallerot_id=@tallerot_id) AND "
                                            + "   (tr_r.tallerrequisicion_id=tr.id);";

                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);


                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();
                                        cantidadRepuestosRequisados = sdr.GetInt32(0);
                                    }
                                    else
                                    {
                                        responseCode = 0;
                                    }

                                    sdr.Close();
                                }

                                if (cantidadRepuestosRequisados == cantidadRepuestosTotal)
                                {
                                    //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                                    {
                                        query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                        cmd.CommandText = query;

                                        cmd.Parameters.Clear();
                                        cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                        cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                        cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                        cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                        sdr = cmd.ExecuteReader();
                                        if (sdr.HasRows)
                                        {
                                            sdr.Read();
                                            int count = sdr.GetInt32(0);

                                            if (count == 0)
                                            {
                                                estadoOT = 4; //Pendiente cierre
                                            }
                                            else
                                            {
                                                estadoOT = 3; //Reparación
                                            }
                                        }
                                        else
                                        {
                                            responseCode = 0;
                                        }

                                        sdr.Close();
                                    }
                                }
                                else
                                {
                                    estadoOT = 2; //Espera de repuestos
                                }
                            }

                            if (estadoOT >= 0)
                            {
                                query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                                rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    responseCode = 1;
                                }
                                else
                                {
                                    responseCode = 0;
                                }
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }
                else
                {
                    responseCode = 0;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int rejectTallerPresupuesto
    (
        string tallerpresupuestoId,
        string observaciones
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"SELECT tp.tallerot_id FROM TallerPresupuesto tp WHERE (tp.id=@id);";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                int tallerot_id = -1;
                MySqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    sdr.Read();
                    tallerot_id = sdr.GetInt32(0);
                }
                sdr.Close();

                if(tallerot_id >= 0)
                {
                    query = @"SELECT tp.estadoPresupuesto FROM TallerPresupuesto tp WHERE (tp.id=@id);";
                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                    int estadoPresupuesto = -1;
                    sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        sdr.Read();
                        estadoPresupuesto = sdr.GetInt32(0);
                    }
                    sdr.Close();

                    if (estadoPresupuesto == 1) //Si el presupuesto tiene estado "Pendiente"
                    {   
                        query = @"UPDATE TallerPresupuesto SET estadoPresupuesto=@estadoPresupuesto, observaciones=@observaciones "
                              + "WHERE "
                              + "   (id=@id);";

                        cmd.CommandText = query;

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("estadoPresupuesto", 2); //Rechazado
                        cmd.Parameters.AddWithValue("observaciones", observaciones);
                        cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        //Cambiar fechaCompromiso de OT
                        if (rowsAffected > 0)
                        {
                            query = @"SELECT tp.fechaCompromiso FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) ORDER BY (tp.fechaCompromiso) DESC LIMIT 0,1;";
                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                            bool dateReaded = false;
                            DateTime fechaCompromiso = DateTime.Now;
                            sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();

                                dateReaded = true;
                                fechaCompromiso = sdr.GetDateTime(0);
                            }
                            sdr.Close();

                            if (dateReaded == true)
                            {
                                query = @"UPDATE TallerOT SET fechaCompromiso=@fechaCompromiso "
                                      + "WHERE "
                                      + "   (id=@tallerot_id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("fechaCompromiso", fechaCompromiso);
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    responseCode = 1;
                                }
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }

                        if (responseCode == 1)
                        {
                            int estadoOT = -1;
                            int cantidadRepuestosTotal = 0;
                            int cantidadRepuestosRequisados = 0;

                            //Comprobar si tiene repuestos no requisados
                            {
                                //Cantidad de repuestos total en la OT
                                {
                                    query = @"SELECT "
                                            + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                            + "FROM "
                                            + "   TallerPresupuesto tp, "
                                            + "   TallerPresupuesto_Repuesto tp_r "
                                            + "WHERE "
                                            + "   (tp.tallerot_id=@tallerot_id) AND "
                                            + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                            + "   (tp_r.tallerpresupuesto_id=tp.id);";

                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();
                                        cantidadRepuestosTotal = sdr.GetInt32(0);
                                    }
                                    else
                                    {
                                        responseCode = 0;
                                    }

                                    sdr.Close();
                                }

                                //Cantidad de repuestos requisados en la OT
                                {
                                    query = @"SELECT "
                                            + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                            + "FROM "
                                            + "   TallerRequisicion tr, "
                                            + "   TallerRequisicion_Repuesto tr_r "
                                            + "WHERE "
                                            + "   (tr.tallerot_id=@tallerot_id) AND "
                                            + "   (tr_r.tallerrequisicion_id=tr.id);";

                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);


                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();
                                        cantidadRepuestosRequisados = sdr.GetInt32(0);
                                    }
                                    else
                                    {
                                        responseCode = 0;
                                    }

                                    sdr.Close();
                                }

                                if (cantidadRepuestosRequisados == cantidadRepuestosTotal)
                                {
                                    //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                                    {
                                        query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                        cmd.CommandText = query;

                                        cmd.Parameters.Clear();
                                        cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                        cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                        cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                        cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                        sdr = cmd.ExecuteReader();
                                        if (sdr.HasRows)
                                        {
                                            sdr.Read();
                                            int count = sdr.GetInt32(0);

                                            if (count == 0)
                                            {
                                                estadoOT = 4; //Pendiente cierre
                                            }
                                            else
                                            {
                                                estadoOT = 3; //Reparación
                                            }
                                        }
                                        else
                                        {
                                            responseCode = 0;
                                        }

                                        sdr.Close();
                                    }
                                }
                                else
                                {
                                    estadoOT = 2; //Espera de repuestos
                                }
                            }

                            if (estadoOT >= 0)
                            {
                                query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                                rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    responseCode = 1;
                                }
                                else
                                {
                                    responseCode = 0;
                                }
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }
                else
                {
                    responseCode = 0;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int removeTallerPresupuesto
    (
        string tallerpresupuestoId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"SELECT tp.tallerot_id FROM TallerPresupuesto tp WHERE (tp.id=@id);";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                int tallerot_id = -1;
                MySqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    sdr.Read();
                    tallerot_id = sdr.GetInt32(0);
                }
                sdr.Close();
                
                int countPresupuestos = -1;

                if (tallerot_id >= 0)
                {
                    query = @"DELETE FROM TallerPresupuesto "
                          + "WHERE "
                          + "   (id=@id);";

                    cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id);";
                        cmd.CommandText = query;

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                        cmd.Parameters.AddWithValue("estadoPresupuesto", 5);

                        sdr = cmd.ExecuteReader();
                        if (sdr.HasRows)
                        {
                            responseCode = 1;

                            sdr.Read();
                            countPresupuestos = sdr.GetInt32(0);
                            sdr.Close();

                            if (countPresupuestos == 0)
                            {
                                query = @"DELETE FROM TallerOT WHERE (id=@tallerot_id);";
                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                                rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    responseCode = 1;
                                }
                                else
                                {
                                    responseCode = 0;
                                }
                            }
                        }
                        else
                        {
                            sdr.Close();
                        }

                    }
                }

                //Cambiar fechaCompromiso de OT
                if ((responseCode == 1) && (countPresupuestos > 0))
                {
                    query = @"SELECT tp.fechaCompromiso FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) ORDER BY (tp.fechaCompromiso) DESC LIMIT 0,1;";
                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                    bool dateReaded = false;
                    DateTime fechaCompromiso = DateTime.Now;
                    sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        sdr.Read();

                        dateReaded = true;
                        fechaCompromiso = sdr.GetDateTime(0);
                    }
                    sdr.Close();

                    if (dateReaded == true)
                    {
                        query = @"UPDATE TallerOT SET fechaCompromiso=@fechaCompromiso "
                              + "WHERE "
                              + "   (id=@tallerot_id);";

                        cmd.CommandText = query;

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("fechaCompromiso", fechaCompromiso);
                        cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            responseCode = 1;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }

                if ((responseCode == 1) && (countPresupuestos > 0))
                {
                    int estadoOT = -1;
                    int cantidadRepuestosTotal = 0;
                    int cantidadRepuestosRequisados = 0;

                    //Comprobar si tiene repuestos no requisados
                    {
                        //Cantidad de repuestos total en la OT
                        {
                            query = @"SELECT "
                                    + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                    + "FROM "
                                    + "   TallerPresupuesto tp, "
                                    + "   TallerPresupuesto_Repuesto tp_r "
                                    + "WHERE "
                                    + "   (tp.tallerot_id=@tallerot_id) AND "
                                    + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                    + "   (tp_r.tallerpresupuesto_id=tp.id);";

                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                            cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                            cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                            sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                cantidadRepuestosTotal = sdr.GetInt32(0);
                            }
                            else
                            {
                                responseCode = 0;
                            }

                            sdr.Close();
                        }

                        //Cantidad de repuestos requisados en la OT
                        {
                            query = @"SELECT "
                                    + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                    + "FROM "
                                    + "   TallerRequisicion tr, "
                                    + "   TallerRequisicion_Repuesto tr_r "
                                    + "WHERE "
                                    + "   (tr.tallerot_id=@tallerot_id) AND "
                                    + "   (tr_r.tallerrequisicion_id=tr.id);";

                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);


                            sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                cantidadRepuestosRequisados = sdr.GetInt32(0);
                            }
                            else
                            {
                                responseCode = 0;
                            }

                            sdr.Close();
                        }

                        if (cantidadRepuestosRequisados == cantidadRepuestosTotal)
                        {
                            //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                            {
                                query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    int count = sdr.GetInt32(0);

                                    if (count == 0)
                                    {
                                        estadoOT = 4; //Pendiente cierre
                                    }
                                    else
                                    {
                                        estadoOT = 3; //Reparación
                                    }
                                }
                                else
                                {
                                    responseCode = 0;
                                }

                                sdr.Close();
                            }
                        }
                        else
                        {
                            estadoOT = 2; //Espera de repuestos
                        }
                    }

                    if (estadoOT >= 0)
                    {
                        query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                        cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            responseCode = 1;
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int removeTallerOT
    (
        string tallerOTId
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"DELETE FROM TallerOT "
                              + "WHERE "
                              + "   (id=@id);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerOTId);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }

            }
            else
            {
                trans.Rollback();
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int updateTallerPresupuesto
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
        MySqlTransaction trans = null;

        int responseCode = 0;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = @"SELECT tp.tallerot_id FROM TallerPresupuesto tp WHERE (tp.id=@id);";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                int tallerot_id = -1;
                MySqlDataReader sdr = cmd.ExecuteReader();
                if(sdr.HasRows)
                {
                    sdr.Read();
                    tallerot_id = sdr.GetInt32(0);
                }
                sdr.Close();

                if(tallerot_id >= 0)
                {
                    query = @"UPDATE TallerPresupuesto SET "
                          + "   fechaCompromiso=@fechaCompromiso, "
                          + "   descripcionFallo=@descripcionFallo, "
                          + "   causaProbable=@causaProbable, "
                          + "   tecnicoAsignado=@tecnicoAsignado, "
                          + "   cantidadHoras=@cantidadHoras, "
                          + "   valorHH=@valorHH, "
                          + "   neto=@neto, "
                          + "   iva=@iva, "
                          + "   total=@total "
                          + "WHERE "
                          + "   (id=@id);";

                    cmd.CommandText = query;

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("fechaCompromiso", fechaCompromiso);
                    cmd.Parameters.AddWithValue("descripcionFallo", descripcionFallo);
                    cmd.Parameters.AddWithValue("causaProbable", causaProbable);
                    cmd.Parameters.AddWithValue("tecnicoAsignado", tecnicoAsignado);
                    cmd.Parameters.AddWithValue("cantidadHoras", cantidadHoras);
                    cmd.Parameters.AddWithValue("valorHH", valorHH);
                    cmd.Parameters.AddWithValue("neto", neto);
                    cmd.Parameters.AddWithValue("iva", iva);
                    cmd.Parameters.AddWithValue("total", total);
                    cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        responseCode = 1;

                        query = @"DELETE FROM TallerPresupuesto_Repuesto WHERE (tallerpresupuesto_id=@id);";
                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("id", tallerpresupuestoId);

                        rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected >= 0)
                        {
                            int valorUnitario = -1;
                            for (int i = 0; i < listRepuestoId.Length; i++)
                            {
                                try
                                {
                                    valorUnitario = Convert.ToInt32(listRepuestoValorUnitario[i]);
                                }
                                catch (Exception ex2)
                                {
                                    responseCode = 0;

                                    break;
                                }

                                query = @"INSERT INTO TallerPresupuesto_Repuesto (tallerpresupuesto_id, repuesto_id, cantidad, valorUnitario) VALUES (@tallerpresupuesto_id, @repuesto_id, @cantidad, @valorUnitario);";
                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerpresupuesto_id", tallerpresupuestoId);
                                cmd.Parameters.AddWithValue("repuesto_id", listRepuestoId[i]);
                                cmd.Parameters.AddWithValue("cantidad", listRepuestoCantidad[i]);
                                cmd.Parameters.AddWithValue("valorUnitario", valorUnitario);

                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    //nothing
                                }
                                else
                                {
                                    responseCode = 0;

                                    break;
                                }
                            }
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }

                    /*
                    if (responseCode == 1)
                    {
                        int estadoOT = -1;
                        int cantidadRepuestosTotal = 0;
                        int cantidadRepuestosRequisados = 0;

                        //Comprobar si tiene repuestos no requisados
                        {
                            //Cantidad de repuestos total en la OT
                            {
                                query = @"SELECT "
                                        + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                        + "FROM "
                                        + "   TallerPresupuesto tp, "
                                        + "   TallerPresupuesto_Repuesto tp_r "
                                        + "WHERE "
                                        + "   (tp.tallerot_id=@tallerot_id) AND "
                                        + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                        + "   (tp_r.tallerpresupuesto_id=tp.id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    cantidadRepuestosTotal = sdr.GetInt32(0);
                                }
                                else
                                {
                                    responseCode = 0;
                                }

                                sdr.Close();
                            }

                            //Cantidad de repuestos requisados en la OT
                            {
                                query = @"SELECT "
                                        + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                        + "FROM "
                                        + "   TallerRequisicion tr, "
                                        + "   TallerRequisicion_Repuesto tr_r "
                                        + "WHERE "
                                        + "   (tr.tallerot_id=@tallerot_id) AND "
                                        + "   (tr_r.tallerrequisicion_id=tr.id);";

                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);


                                sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    cantidadRepuestosRequisados = sdr.GetInt32(0);
                                }
                                else
                                {
                                    responseCode = 0;
                                }

                                sdr.Close();
                            }

                            if (cantidadRepuestosRequisados == cantidadRepuestosTotal)
                            {
                                //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                                {
                                    query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                    cmd.CommandText = query;

                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                    cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                    sdr = cmd.ExecuteReader();
                                    if (sdr.HasRows)
                                    {
                                        sdr.Read();
                                        int count = sdr.GetInt32(0);

                                        if (count == 0)
                                        {
                                            estadoOT = 4; //Pendiente cierre
                                        }
                                        else
                                        {
                                            estadoOT = 3; //Reparación
                                        }
                                    }
                                    else
                                    {
                                        responseCode = 0;
                                    }

                                    sdr.Close();
                                }
                            }
                            else
                            {
                                estadoOT = 2; //Espera de repuestos
                            }
                        }

                        if (estadoOT >= 0)
                        {
                            query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                            cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);

                            rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                responseCode = 1;
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    */

                    if (responseCode == 1)
                    {
                        trans.Commit();
                    }
                    else
                    {
                        trans.Rollback();
                    }
                }
                else
                {
                    trans.Rollback();
                    responseCode = 0;
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public Dictionary<string, DataTable> getInfoTallerPresupuesto(string id)
    {
        Dictionary<string, DataTable> dictInfoTallerPresupuesto = new Dictionary<string, DataTable>();

        if (id == null)
        {
            return null;
        }

        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                { //TallerPresupuesto
                    string query = @"SELECT "
                                 + "    tp.id AS tallerpresupuesto_id, "
                                 + "    tp.tallerot_id AS tallerot_id, "
                                 + "    DATE_FORMAT(tp.fecha, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fecha, "
                                 + "    DATE_FORMAT(tp.fechaCompromiso, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaCompromiso, "
                                 + "    DATE_FORMAT(tp.fechaAprobacion, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaAprobacion, "
                                 + "    DATE_FORMAT(tp.fechaRecepcionRepuesto, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaRecepcionRepuesto, "
                                 + "    DATE_FORMAT(tp.fechaInicioReparacion, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaInicioReparacion, "
                                 + "    IFNULL(DATE_FORMAT(tp.fechaCierre, '%Y-%m-%d %H:%i:%s'), '') AS tallerpresupuesto_fechaCierre, "
                                 + "    IFNULL(tp.descripcionFallo, '') AS tallerpresupuesto_descripcionFallo, "
                                 + "    IFNULL(tp.causaProbable, '') AS tallerpresupuesto_causaProbable, "
                                 + "    tp.cantidadHoras AS tallerpresupuesto_cantidadHoras, "
                                 + "    tp.valorHH AS tallerpresupuesto_valorHH, "
                                 + "    (tp.cantidadHoras*tp.valorHH) AS tallerpresupuesto_valorTecnico, "
                                 + "    (SELECT SUM(tp_r.valorUnitario*tp_r.cantidad) FROM TallerPresupuesto_Repuesto tp_r WHERE (tp_r.tallerpresupuesto_id=tp.id)) AS tallerpresupuesto_valorRepuestos, "
                                 + "    tp.neto AS tallerpresupuesto_neto, "
                                 + "    tp.iva AS tallerpresupuesto_iva, "
                                 + "    tp.total AS tallerpresupuesto_total, "
                                 + "    ep.id AS tallerpresupuesto_estadoId, "
                                 + "    ep.nombre AS tallerpresupuesto_estadoNombre, "
                                 + "    IFNULL(tp.observaciones, '') AS tallerpresupuesto_observaciones, "
                                 + "    t.id AS trabajador_id, "
                                 + "    IFNULL(t.rut, '') AS trabajador_rut, "
                                 + "    CONCAT(t.nombre, ' ', t.apellido) AS trabajador_nombre, "
                                 + "    IFNULL(t.cargo, '') AS trabajador_cargo, "
                                 + "    IFNULL(t.email, '') AS trabajador_email "
                                 + "FROM "
	                             + "    TallerPresupuesto tp, "
                                 + "    EstadoPresupuesto ep, "
                                 + "    Trabajador t "
                                 + "WHERE "
                                 + "    (tp.id=@id) AND "
                                 + "    (ep.id=tp.estadoPresupuesto) AND "
                                 + "    (t.id=tp.tecnicoAsignado);";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerPresupuesto.Add("TallerPresupuesto", dt);
                }

                { //TallerRepuesto
                    string query = @"SELECT "
	                             + "    r.id AS repuesto_id, "
                                 + "    r.cod AS repuesto_codigo, "
                                 + "    r.sap AS repuesto_sap, "
                                 + "    r.nombre AS repuesto_nombre, "
                                 + "    r.descripcion AS repuesto_descripcion, "
                                 + "    tp_r.valorUnitario AS tallerpresupuesto_repuesto_valorUnitario, "
                                 + "    tp_r.cantidad AS tallerpresupuesto_repuesto_cantidad, "
                                 + "    (tp_r.valorUnitario*tp_r.cantidad) AS tallerpresupuesto_repuesto_total "
                                 + "FROM "
	                             + "    TallerPresupuesto_Repuesto tp_r, "
                                 + "    Repuesto r "
                                 + "WHERE "
                                 + "    (tp_r.tallerpresupuesto_id=@id) AND "
                                 + "    (r.id=tp_r.repuesto_id) "
                                 + "ORDER BY "
                                 + "    (tp_r.repuesto_id) DESC;";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerPresupuesto.Add("TallerRepuesto", dt);
                }
            }
        }
        catch (Exception ex)
        {
            dictInfoTallerPresupuesto = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dictInfoTallerPresupuesto;
    }

    public Dictionary<string, DataTable> getInfoTallerOT(string id)
    {
        Dictionary<string, DataTable> dictInfoTallerOT = new Dictionary<string, DataTable>();

        if (id == null)
        {
            return null;
        }

        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                { //TallerOT
                    string query = @"SELECT "
                                 + "    tot.id AS tallerot_id, "
                                 + "    DATE_FORMAT(tot.fecha, '%Y-%m-%d %H:%i:%s') AS tallerot_fecha, "
                                 + "    IFNULL(DATE_FORMAT(tot.fechaCompromiso, '%Y-%m-%d %H:%i:%s'), '') AS tallerot_fechaCompromiso, "
                                 + "    IFNULL(DATE_FORMAT(tot.fechaCierre, '%Y-%m-%d %H:%i:%s'), '') AS tallerot_fechaCierre, "
                                 + "    tot.estadoOT AS tallerot_estadoId, "
                                 + "    eot.nombre AS tallerot_estadoNombre, "
	                             + "    ti.id AS talleringreso_id, "
                                 + "    DATE_FORMAT(ti.fechaRecepcion, '%Y-%m-%d %H:%i:%s') AS talleringreso_fechaRecepcion, "
	                             + "    ti.numeroRecepcion AS talleringreso_numeroRecepcion, "
                                 + "    tot.id AS id, "
                                 + "    IFNULL(em.rut, '') AS empresa_rut, "
                                 + "    CASE "
                                 + "        WHEN (em.alias IS NOT NULL) THEN em.alias "
                                 + "        ELSE em.razonSocial "
                                 + "    END AS empresa_nombre, "
                                 + "    IFNULL(em.formaTrabajar, '') AS empresa_formaTrabajar, "
                                 + "    IFNULL(c.nombre, '') AS contacto_nombre, "
                                 + "    IFNULL(c.telefono, '') AS contacto_telefono, "
                                 + "    IFNULL(c.email, '') AS contacto_email, "
                                 + "    eq.id AS equipo_id, "
                                 + "    IFNULL(eq.nombre, '') AS equipo_nombre, "
                                 + "    IFNULL(eq.modelo, '') AS equipo_modelo, "
                                 + "    IFNULL(eq.numeroSerie, '') AS equipo_numeroSerie "
                                 + "FROM "
	                             + "    TallerOT tot, "
                                 + "    EstadoOT eot, "
                                 + "    TallerIngreso_Equipo ti_e, "
                                 + "    TallerIngreso ti, "
	                             + "    Contacto c, "
                                 + "    Empresa em, "
                                 + "    Equipo eq "
                                 + "WHERE "
	                             + "    (tot.id=@id) AND "
                                 + "    (eot.id=tot.estadoOT) AND "
                                 + "    ((tot.talleringreso_id=ti_e.talleringreso_id) AND (tot.equipo_id=ti_e.equipo_id)) AND "
                                 + "    (ti.id=ti_e.talleringreso_id) AND "
	                             + "    (c.id=ti.contacto_id) AND "
                                 + "    (em.id=c.empresa_id) AND "
                                 + "    (eq.id=ti_e.equipo_id)";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("TallerOT", dt);
                }

                { //Fotos (de equipo)
                    string query = @"SELECT "
                                 + "        ti_e_a.archivo_id AS archivo_id, "
                                 + "        a.nombre AS archivo_nombre, "
                                 + "        a.longitud AS archivo_longitud, "
                                 + "        a.tipo AS archivo_tipoContenido, "
                                 + "        a.extension AS archivo_extension "
                                 + "FROM "
                                 + "        TallerOT tot, "
                                 + "        TallerIngreso_Equipo_Archivo ti_e_a, "
                                 + "        Archivo a "
                                 + "WHERE "
                                 + "        (tot.id=@id) AND "
                                 + "        (ti_e_a.talleringreso_id=tot.talleringreso_id) AND "
                                 + "        (ti_e_a.equipo_id=tot.equipo_id) AND "
                                 + "        (a.id=ti_e_a.archivo_id) "
                                 + "ORDER BY "
                                 + "        (a.id) ASC;";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("Foto", dt);
                }

                { //TallerPresupuesto
                    string query = @"SELECT "
                                 + "    tot.id AS tallerot_id, "
                                 + "    tp.id AS tallerpresupuesto_id, "
                                 + "    IFNULL(tp.descripcionFallo, '') AS tallerpresupuesto_descripcionFallo, "
                                 + "    DATE_FORMAT(tp.fecha, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fecha, "
                                 + "    DATE_FORMAT(tp.fechaCompromiso, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaCompromiso, "
                                 + "    DATE_FORMAT(tp.fechaAprobacion, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaAprobacion, "
                                 + "    DATE_FORMAT(tp.fechaRecepcionRepuesto, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaRecepcionRepuesto, "
                                 + "    DATE_FORMAT(tp.fechaInicioReparacion, '%Y-%m-%d %H:%i:%s') AS tallerpresupuesto_fechaInicioReparacion, "
                                 + "    IFNULL(DATE_FORMAT(tp.fechaCierre, '%Y-%m-%d %H:%i:%s'), '') AS tallerpresupuesto_fechaCierre, "
                                 + "    CONCAT(IFNULL(t.nombre, ''), ' ', IFNULL(t.apellido, '')) AS trabajador_nombre, "
                                 + "    (tp.valorHH*tp.cantidadHoras) AS tallerpresupuesto_valorTecnico, "
                                 + "    (SELECT SUM(tp_r.valorUnitario*tp_r.cantidad) FROM TallerPresupuesto_Repuesto tp_r WHERE (tp_r.tallerpresupuesto_id=tp.id)) AS tallerpresupuesto_valorRepuestos, "
                                 + "    tp.neto AS tallerpresupuesto_neto, "
                                 + "    tp.iva AS tallerpresupuesto_iva, "
                                 + "    tp.total AS tallerpresupuesto_total, "
                                 + "    ep.id AS tallerpresupuesto_estadoId, "
                                 + "    ep.nombre AS tallerpresupuesto_estadoNombre "
                                 + "FROM "
                                 + "    TallerOT tot, "
                                 + "    TallerPresupuesto tp, "
                                 + "    Trabajador t, "
                                 + "    EstadoPresupuesto ep "
                                 + "WHERE "
                                 + "    (tot.id=@id) AND "
                                 + "    (tp.tallerot_id=tot.id) AND "
                                 + "    (t.id=tp.tecnicoAsignado) AND "
                                 + "    (ep.id=tp.estadoPresupuesto) "
                                 + "ORDER BY "
                                 + "    (tp.id) DESC;";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("TallerPresupuesto", dt);
                }

                { //Repuesto
                    string query = @"SELECT "
	                             + "    tot.id AS tallerot_id, "
                                 + "    tp_r.repuesto_id AS repuesto_id, "
                                 + "    r.sap AS repuesto_sap, "
                                 + "    IFNULL(r.cod, '') AS repuesto_codigo, "
                                 + "    IFNULL(r.nombre, '') AS repuesto_nombre, "
                                 + "    IFNULL(r.descripcion, '') AS repuesto_descripcion, "
                                 + "    SUM(tp_r.cantidad) AS cantidadTotal "
                                 + "FROM "
	                             + "    TallerOT tot, "
                                 + "    TallerPresupuesto tp, "
                                 + "    TallerPresupuesto_Repuesto tp_r, "
                                 + "    Repuesto r "
                                 + "WHERE "
	                             + "    (tot.id=@id) AND "
                                 + "    ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                 + "    (tp.tallerot_id=tot.id) AND "
                                 + "    (tp_r.tallerpresupuesto_id=tp.id) AND "
                                 + "    (r.id=tp_r.repuesto_id) "
                                 + "GROUP BY "
	                             + "    (tp_r.repuesto_id);";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);
                    cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                    cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("TallerRepuesto", dt);
                }

                { //TallerSolicitudCompra
                    string query = @"SELECT "
                                 + "    tsc.id AS tallersolicitudcompra_id, "
                                 + "    tsc.numeroSolicitudCompra AS tallersolicitudcompra_numeroSolicitudCompra, "
                                 + "    DATE_FORMAT(tsc.fecha, '%Y-%m-%d %H:%i:%s') AS tallersolicitudcompra_fecha, "
                                 + "    IFNULL(tsc.observaciones, '') AS tallersolicitudcompra_observaciones "
                                 + "FROM "
                                 + "    TallerSolicitudCompra tsc "
                                 + "WHERE "
                                 + "    (tsc.tallerot_id=@id);";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("TallerSolicitudCompra", dt);
                }

                { //TallerOrdenCompra
                    string query = @"SELECT "
                                 + "    toc.id AS tallerordencompra_id, "
                                 + "    toc.numeroOrdenCompra AS tallerordencompra_numeroOrdenCompra, "
                                 + "    DATE_FORMAT(toc.fecha, '%Y-%m-%d %H:%i:%s') AS tallerordencompra_fecha, "
                                 + "    IFNULL(toc.observaciones, '') AS tallerordencompra_observaciones "
                                 + "FROM "
                                 + "    TallerOrdenCompra toc "
                                 + "WHERE "
                                 + "    (toc.tallerot_id=@id);";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("TallerOrdenCompra", dt);
                }

                { //TallerRequisicion
                    string query = @"SELECT "
                                 + "    tr.id AS tallerrequisicion_id, "
                                 + "    tr.numeroRequisicion AS tallerrequisicion_numeroRequisicion, "
                                 + "    DATE_FORMAT(tr.fecha, '%Y-%m-%d %H:%i:%s') AS tallerrequisicion_fecha, "
                                 + "    CONCAT(IFNULL(t.nombre, ''), ' ', IFNULL(t.apellido, '')) AS trabajador_nombre "
                                 + "FROM "
                                 + "    TallerRequisicion tr, "
                                 + "    Trabajador t "
                                 + "WHERE "
                                 + "    (tr.tallerot_id=@id) AND "
                                 + "    (t.id=tr.retiradoPor) "
                                 + "ORDER BY "
                                 + "    (tr.id) DESC;";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("TallerRequisicion", dt);
                }

                { //TallerInformeEntrega
                    string query = @"SELECT "
                                 + "    tie.id AS tallerinformeentrega_id, "
                                 + "    tie.numeroInformeEntrega AS tallerinformeentrega_numeroInformeEntrega, "
                                 + "    DATE_FORMAT(tie.fecha, '%Y-%m-%d %H:%i:%s') AS tallerinformeentrega_fecha, "
                                 + "    IFNULL(tie.observaciones, '') AS tallerinformeentrega_observaciones "
                                 + "FROM "
                                 + "    TallerInformeEntrega tie "
                                 + "WHERE "
                                 + "    (tie.tallerot_id=@id);";

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerOT.Add("TallerInformeEntrega", dt);
                }
            }
        }
        catch (Exception ex)
        {
            dictInfoTallerOT = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dictInfoTallerOT;
    }

    public int insertTallerPresupuesto
    (
        string tallerotId,
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
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"INSERT INTO TallerPresupuesto ("
                        + "tallerot_id, "
                        + "fecha, "
                        + "fechaCompromiso, "
                        + "fechaAprobacion, "
                        + "fechaRecepcionRepuesto, "
                        + "fechaInicioReparacion, "
                        + "fechaCierre, "
                        + "descripcionFallo, "
                        + "causaProbable, "
                        + "tecnicoAsignado, "
                        + "cantidadHoras, "
                        + "valorHH, "
                        + "neto, "
                        + "iva, "
                        + "total, "
                        + "estadoPresupuesto, "
                        + "observaciones) VALUES ( "
                        + "@tallerot_id, "
                        + "NOW(), "
                        + "@fechaCompromiso, "
                        + "@fechaAprobacion, "
                        + "@fechaRecepcionRepuesto, "
                        + "@fechaInicioReparacion, "
                        + "@fechaCierre, "
                        + "@descripcionFallo, "
                        + "@causaProbable, "
                        + "@tecnicoAsignado, "
                        + "@cantidadHoras, "
                        + "@valorHH, "
                        + "@neto, "
                        + "@iva, "
                        + "@total, "
                        + "@estadoPresupuesto, "
                        + "@observaciones);";

                trans = this.Conexion.BeginTransaction();
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;
                cmd.CommandText = query;

                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                cmd.Parameters.AddWithValue("fechaCompromiso", fechaCompromiso);
                cmd.Parameters.AddWithValue("fechaAprobacion", null);
                cmd.Parameters.AddWithValue("fechaRecepcionRepuesto", null);
                cmd.Parameters.AddWithValue("fechaInicioReparacion", null);
                cmd.Parameters.AddWithValue("fechaCierre", null);
                cmd.Parameters.AddWithValue("descripcionFallo", descripcionFallo);
                cmd.Parameters.AddWithValue("causaProbable", causaProbable);
                cmd.Parameters.AddWithValue("tecnicoAsignado", tecnicoAsignado);
                cmd.Parameters.AddWithValue("cantidadHoras", cantidadHoras);
                cmd.Parameters.AddWithValue("valorHH", valorHH);
                cmd.Parameters.AddWithValue("neto", neto);
                cmd.Parameters.AddWithValue("iva", iva);
                cmd.Parameters.AddWithValue("total", total);
                cmd.Parameters.AddWithValue("estadoPresupuesto", 1); //Pendiente
                cmd.Parameters.AddWithValue("observaciones", null);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    responseCode = 1;

                    query = @"SELECT last_insert_id();";
                    cmd.CommandText = query;
                    cmd.Parameters.Clear();
                    MySqlDataReader sdr = cmd.ExecuteReader();

                    int tallerpresupuesto_id = -1;
                    if (sdr.HasRows)
                    {
                        sdr.Read();
                        tallerpresupuesto_id = sdr.GetInt32(0);
                    }

                    sdr.Close();

                    if (tallerpresupuesto_id >= 0)
                    {
                        int valorUnitario = -1;
                        for (int i = 0; i < listRepuestoId.Length; i++)
                        {
                            try
                            {
                                valorUnitario = Convert.ToInt32(listRepuestoValorUnitario[i]);
                            }
                            catch (Exception ex2)
                            {
                                responseCode = 0;

                                break;
                            }

                            query = @"INSERT INTO TallerPresupuesto_Repuesto (tallerpresupuesto_id, repuesto_id, cantidad, valorUnitario) VALUES (@tallerpresupuesto_id, @repuesto_id, @cantidad, @valorUnitario);";
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerpresupuesto_id", tallerpresupuesto_id);
                            cmd.Parameters.AddWithValue("repuesto_id", listRepuestoId[i]);
                            cmd.Parameters.AddWithValue("cantidad", listRepuestoCantidad[i]);
                            cmd.Parameters.AddWithValue("valorUnitario", valorUnitario);

                            rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                //nothing
                            }
                            else
                            {
                                responseCode = 0;

                                break;
                            }
                        }

                    }
                    else
                    {
                        responseCode = 0;
                    }
                }

                if (responseCode == 1)
                {
                    int estadoOT = -1;
                    int cantidadRepuestosTotal = 0;
                    int cantidadRepuestosRequisados = 0;

                    //Comprobar si tiene repuestos no requisados
                    {
                        //Cantidad de repuestos total en la OT
                        {
                            query = @"SELECT "
                                    + "   IFNULL((SUM(tp_r.cantidad)), 0) "
                                    + "FROM "
                                    + "   TallerPresupuesto tp, "
                                    + "   TallerPresupuesto_Repuesto tp_r "
                                    + "WHERE "
                                    + "   (tp.tallerot_id=@tallerot_id) AND "
                                    + "   ((tp.estadoPresupuesto=@estadoPresupuesto_Aprobado) OR (tp.estadoPresupuesto=@estadoPresupuesto_Cerrado)) AND "
                                    + "   (tp_r.tallerpresupuesto_id=tp.id);";

                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                            cmd.Parameters.AddWithValue("estadoPresupuesto_Aprobado", 3); //Aprobado
                            cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4); //Cerrado

                            MySqlDataReader sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                cantidadRepuestosTotal = sdr.GetInt32(0);
                            }
                            else
                            {
                                responseCode = 0;
                            }

                            sdr.Close();
                        }

                        //Cantidad de repuestos requisados en la OT
                        {
                            query = @"SELECT "
                                    + "   IFNULL((SUM(tr_r.cantidad)), 0) "
                                    + "FROM "
                                    + "   TallerRequisicion tr, "
                                    + "   TallerRequisicion_Repuesto tr_r "
                                    + "WHERE "
                                    + "   (tr.tallerot_id=@tallerot_id) AND "
                                    + "   (tr_r.tallerrequisicion_id=tr.id);";

                            cmd.CommandText = query;

                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("tallerot_id", tallerotId);


                            MySqlDataReader sdr = cmd.ExecuteReader();
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                cantidadRepuestosRequisados = sdr.GetInt32(0);
                            }
                            else
                            {
                                responseCode = 0;
                            }

                            sdr.Close();
                        }

                        if (cantidadRepuestosRequisados == cantidadRepuestosTotal)
                        {
                            //Si fueron requisados todos los repuestos comprueba si tiene presupuestos abiertos
                            {
                                query = @"SELECT COUNT(tp.id) FROM TallerPresupuesto tp WHERE (tp.tallerot_id=@tallerot_id) AND ((tp.estadoPresupuesto<>@estadoPresupuesto_Pendiente) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Rechazado) AND (tp.estadoPresupuesto<>@estadoPresupuesto_Cerrado));";
                                cmd.CommandText = query;

                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("tallerot_id", tallerotId);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Pendiente", 1);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Rechazado", 2);
                                cmd.Parameters.AddWithValue("estadoPresupuesto_Cerrado", 4);

                                MySqlDataReader sdr = cmd.ExecuteReader();
                                if (sdr.HasRows)
                                {
                                    sdr.Read();
                                    int count = sdr.GetInt32(0);

                                    if (count == 0)
                                    {
                                        estadoOT = 4; //Pendiente cierre
                                    }
                                    else
                                    {
                                        estadoOT = 3; //Reparación
                                    }
                                }
                                else
                                {
                                    responseCode = 0;
                                }

                                sdr.Close();
                            }
                        }
                        else
                        {
                            estadoOT = 2; //Espera de repuestos
                        }
                    }

                    if (estadoOT >= 0)
                    {
                        query = @"UPDATE TallerOT SET estadoOT=@estadoOT WHERE (id=@tallerot_id);";
                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("estadoOT", estadoOT);
                        cmd.Parameters.AddWithValue("tallerot_id", tallerotId);

                        rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            responseCode = 1;
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getHeaderListTallerPresupuesto()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT "
                             + "        tp.id AS id, "
                             + "        IFNULL(tp.descripcionFallo, '') AS descripcionFallo, "
                             + "        tp.estadoPresupuesto AS tallerpresupuesto_estadoId,"
                             + "        ep.nombre AS tallerpresupuesto_estadoNombre,"
                             + "        tot.id AS tallerot_id, "
                             + "        tot.talleringreso_id AS talleringreso_id, "
                             + "        tot.equipo_id AS equipo_id, "
                             + "        IFNULL(e.razonSocial, '') AS empresa, "
                             + "        IFNULL(c.nombre, '') AS contacto, "
                             + "        DATE_FORMAT(tp.fecha, '%Y-%m-%d %H:%i:%s') AS fecha, "
                             + "        DATE_FORMAT(tp.fechaCompromiso, '%Y-%m-%d %H:%i:%s') AS fechaCompromiso, "
                             + "        DATE_FORMAT(tp.fechaAprobacion, '%Y-%m-%d %H:%i:%s') AS fechaAprobacion, "
                             + "        DATE_FORMAT(tp.fechaRecepcionRepuesto, '%Y-%m-%d %H:%i:%s') AS fechaRecepcionRepuesto, "
                             + "        DATE_FORMAT(tp.fechaInicioReparacion, '%Y-%m-%d %H:%i:%s') AS fechaInicioReparacion, "
                             + "        DATE_FORMAT(tp.fechaCierre, '%Y-%m-%d %H:%i:%s') AS fechaCierre "
                             + "FROM "
                             + "        TallerPresupuesto tp, "
                             + "        EstadoPresupuesto ep, "
                             + "        TallerOT tot, "
                             + "        TallerIngreso ti, "
                             + "        Empresa e, "
                             + "        Contacto c "
                             + "WHERE "
                             + "        (ep.id=tp.estadoPresupuesto) AND " 
                             + "        (tot.id=tp.tallerot_id) AND "
                             + "        (ti.id=tot.talleringreso_id) AND "
                             + "        (c.id=ti.contacto_id) AND "
                             + "        (e.id=c.empresa_id) "
                             + "ORDER BY "
                             + "        (tp.id) DESC;";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                cmd.Parameters.Clear();

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListTallerOT_Abierta()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT "
                             + "        tot.id AS tallerot_id, "
                             + "        tot.talleringreso_id AS talleringreso_id, "
                             + "        tot.equipo_id AS equipo_id, "
                             + "        tot.estadoOT AS tallerot_estadoId, "
                             + "        eo.nombre AS tallerot_estadoNombre, "
                             + "        IFNULL(e.razonSocial, '') AS empresa, "
                             + "        IFNULL(c.nombre, '') AS contacto, "
                             + "        DATE_FORMAT(tot.fecha, '%Y-%m-%d %H:%i:%s') AS fecha, "
                             + "        DATE_FORMAT(tot.fechaCompromiso, '%Y-%m-%d %H:%i:%s') AS fechaCompromiso, "
                             + "        DATE_FORMAT(tot.fechaCierre, '%Y-%m-%d %H:%i:%s') AS fechaCierre "
                             + "FROM "
                             + "        TallerOT tot, "
                             + "        EstadoOT eo, "
                             + "        TallerIngreso ti, "
                             + "        Empresa e, "
                             + "        Contacto c "
                             + "WHERE "
                             + "        ((tot.estadoOT=2) OR (tot.estadoOT=3) OR (tot.estadoOT=4)) AND " //"Espera de repuesto", "Reparación" o "Pendiente cierre"
                             + "        (eo.id=tot.estadoOT) AND "
                             + "        (ti.id=tot.talleringreso_id) AND "
                             + "        (c.id=ti.contacto_id) AND "
                             + "        (e.id=c.empresa_id) "
                             + "ORDER BY "
                             + "        (tot.id) DESC;";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.Clear();

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListTallerOT_Cerrada()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT "
                             + "        tot.id AS tallerot_id, "
                             + "        tot.talleringreso_id AS talleringreso_id, "
                             + "        tot.equipo_id AS equipo_id, "
                             + "        tot.estadoOT AS tallerot_estadoId, "
                             + "        eo.nombre AS tallerot_estadoNombre, "
                             + "        IFNULL(e.razonSocial, '') AS empresa, "
                             + "        IFNULL(c.nombre, '') AS contacto, "
                             + "        DATE_FORMAT(tot.fecha, '%Y-%m-%d %H:%i:%s') AS fecha, "
                             + "        DATE_FORMAT(tot.fechaCompromiso, '%Y-%m-%d %H:%i:%s') AS fechaCompromiso, "
                             + "        DATE_FORMAT(tot.fechaCierre, '%Y-%m-%d %H:%i:%s') AS fechaCierre "
                             + "FROM "
                             + "        TallerOT tot, "
                             + "        EstadoOT eo, "
                             + "        TallerIngreso ti, "
                             + "        Empresa e, "
                             + "        Contacto c "
                             + "WHERE "
                             + "        (tot.estadoOT=5) AND " //Cerrada
                             + "        (eo.id=tot.estadoOT) AND "
                             + "        (ti.id=tot.talleringreso_id) AND "
                             + "        (c.id=ti.contacto_id) AND "
                             + "        (e.id=c.empresa_id) "
                             + "ORDER BY "
                             + "        (tot.id) DESC;";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.Clear();

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListTallerOT()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT "
	                         + "        tot.id AS tallerot_id, "
                             + "        tot.talleringreso_id AS talleringreso_id, "
                             + "        tot.equipo_id AS equipo_id, "
                             + "        eo.nombre AS tallerot_estadoNombre, "
                             + "        IFNULL(e.razonSocial, '') AS empresa, "
                             + "        IFNULL(c.nombre, '') AS contacto, "
                             + "        DATE_FORMAT(tot.fecha, '%Y-%m-%d %H:%i:%s') AS fecha, "
                             + "        DATE_FORMAT(tot.fechaCompromiso, '%Y-%m-%d %H:%i:%s') AS fechaCompromiso, "
                             + "        DATE_FORMAT(tot.fechaCierre, '%Y-%m-%d %H:%i:%s') AS fechaCierre "
                             + "FROM "
	                         + "        TallerOT tot, "
                             + "        EstadoOT eo, "
                             + "        TallerIngreso ti, "
                             + "        Empresa e, "
                             + "        Contacto c "
                             + "WHERE "
                             + "        (eo.id=tot.estadoOT) AND "
	                         + "        (ti.id=tot.talleringreso_id) AND "
                             + "        (c.id=ti.contacto_id) AND "
                             + "        (e.id=c.empresa_id) AND "
                             + "        (tot.estadoOT>0) "
                             + "ORDER BY "
                             + "        (tot.id) DESC;";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public int insertTallerOT
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
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();
                
                string query = @"INSERT INTO TallerOT ("
                             + "talleringreso_id, "
                             + "equipo_id, "
                             + "fecha, "
                             + "fechaCompromiso, "
                             + "fechaCierre, "
                             + "estadoOT) VALUES ( "
                             + "@talleringreso_id, "
                             + "@equipo_id, "
                             + "NOW(), "
                             + "NULL, "
                             + "NULL, "
                             + "@estadoOT);";

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;

                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("talleringreso_id", talleringresoId);
                cmd.Parameters.AddWithValue("equipo_id", equipoId);
                cmd.Parameters.AddWithValue("estadoOT", 1); //Pendiente

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;

                    query = @"SELECT last_insert_id();";
                    cmd.CommandText = query;
                    cmd.Parameters.Clear();
                    MySqlDataReader sdr = cmd.ExecuteReader();
                    int tallerot_id = -1;

                    if (sdr.HasRows)
                    {
                        sdr.Read();
                        tallerot_id = sdr.GetInt32(0);
                    }

                    sdr.Close();

                    if (tallerot_id >= 0)
                    {
                        query = @"INSERT INTO TallerPresupuesto ("
                              + "tallerot_id, "
                              + "fecha, "
                              + "fechaCompromiso, "
                              + "fechaAprobacion, "
                              + "fechaRecepcionRepuesto, "
                              + "fechaInicioReparacion, "
                              + "fechaCierre, "
                              + "descripcionFallo, "
                              + "causaProbable, "
                              + "tecnicoAsignado, "
                              + "cantidadHoras, "
                              + "valorHH, "
                              + "neto, "
                              + "iva, "
                              + "total, "
                              + "estadoPresupuesto, "
                              + "observaciones) VALUES ( "
                              + "@tallerot_id, "
                              + "NOW(), "
                              + "@fechaCompromiso, "
                              + "@fechaAprobacion, "
                              + "@fechaRecepcionRepuesto, "
                              + "@fechaInicioReparacion, "
                              + "@fechaCierre, "
                              + "@descripcionFallo, "
                              + "@causaProbable, "
                              + "@tecnicoAsignado, "
                              + "@cantidadHoras, "
                              + "@valorHH, "
                              + "@neto, "
                              + "@iva, "
                              + "@total, "
                              + "@estadoPresupuesto, "
                              + "@observaciones);";

                        cmd.CommandText = query;

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("tallerot_id", tallerot_id);
                        cmd.Parameters.AddWithValue("fechaCompromiso", fechaCompromiso);
                        cmd.Parameters.AddWithValue("fechaAprobacion", null);
                        cmd.Parameters.AddWithValue("fechaRecepcionRepuesto", null);
                        cmd.Parameters.AddWithValue("fechaInicioReparacion", null);
                        cmd.Parameters.AddWithValue("fechaCierre", null);
                        cmd.Parameters.AddWithValue("descripcionFallo", descripcionFallo);
                        cmd.Parameters.AddWithValue("causaProbable", causaProbable);
                        cmd.Parameters.AddWithValue("tecnicoAsignado", tecnicoAsignado);
                        cmd.Parameters.AddWithValue("cantidadHoras", cantidadHoras);
                        cmd.Parameters.AddWithValue("valorHH", valorHH);
                        cmd.Parameters.AddWithValue("neto", neto);
                        cmd.Parameters.AddWithValue("iva", iva);
                        cmd.Parameters.AddWithValue("total", total);
                        cmd.Parameters.AddWithValue("estadoPresupuesto", 1); //Pendiente
                        cmd.Parameters.AddWithValue("observaciones", null);

                        rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            query = @"SELECT last_insert_id();";
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            sdr = cmd.ExecuteReader();

                            int tallerpresupuesto_id = -1;
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                tallerpresupuesto_id = sdr.GetInt32(0);
                            }

                            sdr.Close();

                            if (tallerpresupuesto_id >= 0)
                            {
                                int valorUnitario = -1;
                                for (int i = 0; i < listRepuestoId.Length; i++)
                                {

                                    try
                                    {
                                        valorUnitario = Convert.ToInt32(listRepuestoValorUnitario[i]);
                                    }
                                    catch(Exception ex2)
                                    {
                                        responseCode = 0;

                                        break;
                                    }

                                    query = @"INSERT INTO TallerPresupuesto_Repuesto (tallerpresupuesto_id, repuesto_id, cantidad, valorUnitario) VALUES (@tallerpresupuesto_id, @repuesto_id, @cantidad, @valorUnitario);";
                                    cmd.CommandText = query;
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("tallerpresupuesto_id", tallerpresupuesto_id);
                                    cmd.Parameters.AddWithValue("repuesto_id", listRepuestoId[i]);
                                    cmd.Parameters.AddWithValue("cantidad", listRepuestoCantidad[i]);
                                    cmd.Parameters.AddWithValue("valorUnitario", valorUnitario);

                                    rowsAffected = cmd.ExecuteNonQuery();
                                    if (rowsAffected > 0)
                                    {
                                        //nothing
                                    }
                                    else
                                    {
                                        responseCode = 0;

                                        break;
                                    }
                                }

                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                    else
                    {
                        responseCode = 0;
                    }
                }
                else
                {
                    responseCode = 0;
                }

                if(responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                    responseCode = 0;
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getInfoRepuesto(string id)
    {
        DataTable dt = null;

        if (id == null)
        {
            return dt;
        }

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT r.id, r.sap, IFNULL(r.cod, '') AS cod, IFNULL(r.nombre, '') AS nombre, IFNULL(r.descripcion, '') AS descripcion, r.valorUnitario FROM Repuesto r WHERE r.sap=@sap;";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("sap", id);

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListRepuesto()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = @"SELECT r.id AS id, r.sap AS name FROM Repuesto r ORDER BY (r.id) ASC;";
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    #endregion

    #region Ingreso

    public int updateTallerIngreso
    (
        string id,
        string numeroRecepcion,
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
        MySqlTransaction trans = null;

        int responseCode = 1;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();
                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;

                string query = null;
                int rowsAffected = -1;

                //TallerIngreso
                {
                    query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("numeroRecepcion", numeroRecepcion);
                    cmd.Parameters.AddWithValue("recepcionadoPor", recepcionadoPor);
                    cmd.Parameters.AddWithValue("fechaRecepcion", fechaRecepcion);
                    cmd.Parameters.AddWithValue("observaciones", observaciones);
                    cmd.Parameters.AddWithValue("contacto_id", contacto_id);
                    cmd.Parameters.AddWithValue("id", id);

                    rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected < 1)
                    {
                        responseCode = 0;
                    }
                }

                //Equipos
                if (responseCode == 1)
                {
                    //Regresar al estado anterior
                    {
                        query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("id", id);
                        MySqlDataReader sdr = cmd.ExecuteReader();

                        Dictionary<int, int> dictEquipo_estadoAnterior = new Dictionary<int, int>();
                        if (sdr.HasRows)
                        {
                            while (sdr.Read())
                            {
                                dictEquipo_estadoAnterior.Add(sdr.GetInt32(0), sdr.GetInt32(1));
                            }
                        }

                        sdr.Close();

                        query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */
                        foreach (KeyValuePair<int, int> pair in dictEquipo_estadoAnterior)
                        {
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("uEstado", pair.Value);
                            cmd.Parameters.AddWithValue("equipo_id", pair.Key);

                            rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected < 1)
                            {
                                responseCode = 0;

                                break;
                            }
                        }                        
                    }


                    if (responseCode == 1)
                    {
                        query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("talleringreso_id", id);


                        rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {                      
                            query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("id", id);
                            rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                for (int i = 0; i < listEquipoId.Length; i++)
                                {
                                    query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                                    cmd.CommandText = query;
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("talleringreso_id", id);
                                    cmd.Parameters.AddWithValue("equipo_id", listEquipoId[i]);

                                    rowsAffected = cmd.ExecuteNonQuery();
                                    if (rowsAffected > 0)
                                    {
                                        query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                                        cmd.CommandText = query;
                                        cmd.Parameters.Clear();
                                        cmd.Parameters.AddWithValue("uEstado", 4); //uEstado="Ingreso"
                                        cmd.Parameters.AddWithValue("id", listEquipoId[i]);

                                        rowsAffected = cmd.ExecuteNonQuery();
                                        if (rowsAffected < 1)
                                        {
                                            responseCode = 0;

                                            break;
                                        }
                                    }
                                    else
                                    {
                                        responseCode = 0;

                                        break;
                                    }
                                }
                            }
                            else
                            {
                                responseCode = 0;
                            }
                        }
                        else
                        {
                            responseCode = 0;
                        }
                    }
                }

                //Archivos
                if(responseCode == 1)
                {
                    //ActaRecepcion
                    {
                        query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */


                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("talleringreso_id", id);
                        cmd.Parameters.AddWithValue("archivo_id", actaRecepcionArchivoId);
                        cmd.Parameters.AddWithValue("tipoArchivo", "ActaRecepcion");

                        rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected < 1)
                        {
                            responseCode = 0;
                        }
                    }

                    //GuiaDespacho
                    {
                        query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */


                        cmd.CommandText = query;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("talleringreso_id", id);
                        cmd.Parameters.AddWithValue("tipoArchivo", "GuiaDespacho");

                        MySqlDataReader sdr = cmd.ExecuteReader();

                        int previousGuiaDespachoArchivoId = -1;
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            previousGuiaDespachoArchivoId = sdr.GetInt32(0);
                        }

                        sdr.Close();


                        if(previousGuiaDespachoArchivoId >= 0)
                        {
                            if(guiaDespachoArchivoId == null)
                            {
                                //DELETE PREVIOUS
                                query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("talleringreso_id", id);
                                cmd.Parameters.AddWithValue("tipoArchivo", "GuiaDespacho");

                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected < 1)
                                {
                                    responseCode = 0;
                                }
                            }
                            else
                            {
                                //UPDATE
                                query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */


                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("talleringreso_id", id);
                                cmd.Parameters.AddWithValue("archivo_id", guiaDespachoArchivoId);
                                cmd.Parameters.AddWithValue("tipoArchivo", "GuiaDespacho");

                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected < 1)
                                {
                                    responseCode = 0;
                                }
                            }
                        }
                        else
                        {
                            if(guiaDespachoArchivoId == null)
                            {

                            }
                            else
                            {
                                //INSERT
                                query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("talleringreso_id", id);
                                cmd.Parameters.AddWithValue("archivo_id", guiaDespachoArchivoId);
                                cmd.Parameters.AddWithValue("tipoArchivo", "GuiaDespacho");

                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected < 1)
                                {
                                    responseCode = 0;
                                }
                            }

                        }
                    }

                    //Fotos
                    {
                        //INSERT
                        {
                            //Asocia cada archivo al equipo (foto)
                            for (int i = 0; i < listFotosArchivoId.Length; i++)
                            {
                                query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */


                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("talleringreso_id", id);
                                cmd.Parameters.AddWithValue("equipo_id", listFotosEquipoId[i]);
                                cmd.Parameters.AddWithValue("archivo_id", listFotosArchivoId[i]);
                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected < 1)
                                {
                                    responseCode = 0;

                                    break;
                                }
                            }
                        }
                    }
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
            
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public Dictionary<string, DataTable> getInfoTallerIngreso(string id)
    {
        Dictionary<string, DataTable> dictInfoTallerIngreso = new Dictionary<string, DataTable>();

        if (id == null)
        {
            return null;
        }

        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                { //FORM_Empresa
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerIngreso.Add("FORM_Empresa", dt);
                }

                { //FORM_Contacto

                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("talleringreso_id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerIngreso.Add("FORM_Contacto", dt);
                }

                { //FORM_Trabajador
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerIngreso.Add("FORM_Trabajador", dt);
                }

                { //TallerIngreso
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerIngreso.Add("TallerIngreso", dt);
                }

                { //Equipo
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerIngreso.Add("Equipo", dt);
                }

                { //Documento
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerIngreso.Add("Documento", dt);
                }

                { //Fotos (de equipos)
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;
                    cmd.Parameters.AddWithValue("id", id);

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictInfoTallerIngreso.Add("Foto", dt);
                }
            }
        }
        catch (Exception ex)
        {
            dictInfoTallerIngreso = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dictInfoTallerIngreso;
    }

    public DataTable getHeaderListTallerIngreso_Equipo()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public int insertTallerIngreso
    (
        string numeroRecepcion,
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
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Transaction = trans;

                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("numeroRecepcion", numeroRecepcion);
                cmd.Parameters.AddWithValue("recepcionadoPor", recepcionadoPor);
                cmd.Parameters.AddWithValue("fechaRecepcion", fechaRecepcion);
                cmd.Parameters.AddWithValue("observaciones", observaciones);
                cmd.Parameters.AddWithValue("contacto_id", contacto_id);

                int rowsAffected = cmd.ExecuteNonQuery();
                if(rowsAffected > 0)
                {
                    responseCode = 1;

                    query = @"SELECT last_insert_id();";
                    cmd.CommandText = query;
                    cmd.Parameters.Clear();
                    MySqlDataReader sdr = cmd.ExecuteReader();

                    int talleringreso_id = -1;
                    if (sdr.HasRows)
                    {
                        sdr.Read();
                        talleringreso_id = sdr.GetInt32(0);
                    }

                    sdr.Close();

                    if (talleringreso_id >= 0)
                    {

                        for (int i = 0; i < listEquipoId.Length; i++)
                        {
                            query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("talleringreso_id", talleringreso_id);
                            cmd.Parameters.AddWithValue("equipo_id", listEquipoId[i]);

                            rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                responseCode = 1;

                                query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                                cmd.CommandText = query;
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("uEstado", 4); //Ingreso
                                cmd.Parameters.AddWithValue("id", listEquipoId[i]);

                                rowsAffected = cmd.ExecuteNonQuery();
                                if (rowsAffected < 1)
                                {
                                    responseCode = 0;

                                    break;
                                }
                            }
                            else
                            {
                                responseCode = 0;

                                break;
                            }
                        }

                        query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                        //Asocia el acta de recepcion al ingreso
                        {
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("talleringreso_id", talleringreso_id);
                            cmd.Parameters.AddWithValue("archivo_id", actaRecepcionArchivoId);
                            cmd.Parameters.AddWithValue("tipoArchivo", "ActaRecepcion");
                            rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected < 1)
                            {
                                responseCode = 0;
                            }
                        }

                        //Asocia la guia de despacho al ingreso
                        if (guiaDespachoArchivoId != null)
                        {
                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("talleringreso_id", talleringreso_id);
                            cmd.Parameters.AddWithValue("archivo_id", guiaDespachoArchivoId);
                            cmd.Parameters.AddWithValue("tipoArchivo", "GuiaDespacho");
                            rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected < 1)
                            {
                                responseCode = 0;
                            }
                        }

                        //Asocia cada archivo al equipo (foto)
                        for (int i = 0; i < listFotosArchivoId.Length; i++)
                        {
                            query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                            cmd.CommandText = query;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("talleringreso_id", talleringreso_id);
                            cmd.Parameters.AddWithValue("equipo_id", listFotosEquipoId[i]);
                            cmd.Parameters.AddWithValue("archivo_id", listFotosArchivoId[i]);
                            rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected < 1)
                            {
                                responseCode = 0;

                                break;
                            }
                        }

                        if (responseCode == 1)
                        {
                            trans.Commit();
                        }
                        else
                        {
                            trans.Rollback();
                        }

                    }
                    else
                    {
                        trans.Rollback();
                        responseCode = 0;
                    }
                }
                else
                {
                    trans.Rollback();
                    responseCode = 0;
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if(trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getInfoEquipo(string id)
    {
        DataTable dt = null;

        if (id == null)
        {
            return dt;
        }

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("sap", id);

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListEquipo()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListTrabajador()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListContacto(string empresa_id)
    {
        DataTable dt = null;

        if (empresa_id == null)
        {
            return dt;
        }

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("empresa_id", empresa_id);

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    public DataTable getHeaderListEmpresa()
    {
        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    #endregion

    #region FormElements

    public Dictionary<string, DataTable> getFormElements_TallerIngreso()
    {
        Dictionary<string, DataTable> dictFormElements_TallerIngreso = new Dictionary<string, DataTable>();

        DataTable dt = null;

        try
        {
            this.Open();

            if (this.isOpen())
            {
                { //Empresa
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictFormElements_TallerIngreso.Add("Empresa", dt);
                }

                { //Trabajador
                    string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                    MySqlCommand cmd = this.Conexion.CreateCommand();
                    cmd.CommandText = query;

                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);

                    dictFormElements_TallerIngreso.Add("Trabajador", dt);
                }
            }
        }
        catch (Exception ex)
        {
            dictFormElements_TallerIngreso = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dictFormElements_TallerIngreso;
    }

    #endregion

    #region Extras

    public int removeArchivo
    (
        string id
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Connection = this.Conexion;
                cmd.Transaction = trans;

                cmd.CommandText = query;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("archivo_id", id);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    responseCode = 1;
                }

                if (responseCode == 1)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public int insertArchivo
    (
        HttpPostedFile file
    )
    {
        MySqlTransaction trans = null;

        int responseCode = 0;
        try
        {
            this.Open();

            if (this.isOpen())
            {
                trans = this.Conexion.BeginTransaction();

                BinaryReader binaryReader = new BinaryReader(file.InputStream);
                byte[] fileContent = binaryReader.ReadBytes(Convert.ToInt32(file.InputStream.Length));

                string fileName = file.FileName;
                long fileSize = file.ContentLength;
                string fileExtension = Path.GetExtension(file.FileName).ToLower();
                string fileType = file.ContentType;

                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.Connection = this.Conexion;
                cmd.Transaction = trans;

                cmd.CommandText = query;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("nombre", fileName);
                cmd.Parameters.AddWithValue("longitud", fileSize);
                cmd.Parameters.AddWithValue("tipo", fileType);
                cmd.Parameters.AddWithValue("extension", fileExtension);
                cmd.Parameters.AddWithValue("contenido", fileContent);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    query = @"SELECT last_insert_id();";
                    cmd.CommandText = query;
                    cmd.Parameters.Clear();
                    MySqlDataReader sdr = cmd.ExecuteReader();

                    int archivo_id = -1;
                    if (sdr.HasRows)
                    {
                        sdr.Read();
                        archivo_id = sdr.GetInt32(0);
                    }
                    sdr.Close();

                    if(archivo_id > 0)
                    {
                        responseCode = archivo_id;
                    }
                }

                if (responseCode > 0)
                {
                    trans.Commit();
                }
                else
                {
                    trans.Rollback();
                }
            }
            else
            {
                responseCode = 0;
            }
        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }

            responseCode = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return responseCode;
    }

    public DataTable getArchivo(string archivo_id)
    {
        DataTable dt = null;

        if((archivo_id == null) || (archivo_id.Length < 1))
        {
            return dt;
        }

        try
        {
            this.Open();

            if (this.isOpen())
            {
                string query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

                MySqlCommand cmd = this.Conexion.CreateCommand();
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("archivo_id", archivo_id);

                MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            dt = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }

        return dt;
    }

    #endregion

    #endregion

    #region Código de Gabriel

    #region SelectUser

    public ArrayList ListaUser()
    {
        ArrayList Lista = new ArrayList();

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);

        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        foreach (DataRow Row in dSet.Tables[0].Rows)
        {
            string rut = Row["rut"].ToString();
            string nombre = Row["nombre"].ToString();
            string apellido = Row["apellido"].ToString();
            string usuario = Row["usuario"].ToString();
            string pass = Row["pass"].ToString();
            string mail = Row["mail"].ToString();
            //string tipo = Row["tipo"].ToString();
            bool uActivo = (Row["uEstado"].ToString().Equals("1"));
            bool rActivo = (Row["rEstado"].ToString().Equals("1"));
            int idrol = Convert.ToInt32(Row["idrol"].ToString());
            string rol = Row["rol"].ToString();
            string descripcion = Row["descripcion"].ToString();
            User user = new User(rut, nombre, apellido, mail, idrol, rol, "", uActivo, rActivo, pass, usuario, descripcion);

            Lista.Add(user);
        }
        Close();
        return Lista;
    }

    #endregion

    #region SelectLogin

    internal Permiso getPermiso(User user, string pagina)
    {
        Permiso per = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("idRol", user.idRol);
        SQL.Parameters.AddWithValue("pagina", pagina);

        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();

        if (dSet.Tables[0].Rows.Count > 0)
        {
            DataRow Row = dSet.Tables[0].Rows[0];

            int id = Convert.ToInt32(Row["id"].ToString());
            string nombre = Row["nombrePagina"].ToString();
            bool acceso = Convert.ToBoolean(Row["acceso"].ToString().Equals("1"));
            bool edicion = Convert.ToBoolean(Row["edicion"].ToString().Equals("1"));
            bool eliminacion = Convert.ToBoolean(Row["eliminacion"].ToString().Equals("1"));
            bool creacion = Convert.ToBoolean(Row["creacion"].ToString().Equals("1"));

            per = new Permiso(id, user.idRol, nombre, pagina, acceso, edicion, eliminacion, creacion);
        }
        return per;
    }

    public DataSet getRoles()
    {
        Rol rol = null;
        
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();

        return dSet;
    }

    public ArrayList ListaFaena()
    {
        ArrayList lista = new ArrayList();
        Faena faena = null;
        
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        foreach (DataRow Row in dSet.Tables[0].Rows)
        {
            int id = Convert.ToInt32(Row["id"].ToString());
            string nombre = Row["nombre"].ToString();
            string cliente = Row["cliente"].ToString();
            string empresa = Row["empresa"].ToString();
            string descripcion = Row["descripcion"].ToString();
            string estado = Row["estado"].ToString();
            faena = new Faena(id, nombre, cliente, empresa, descripcion, estado);
            lista.Add(faena);
        }
        return lista;
    }

    public DataSet getEmpresa()
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        return dSet;
    }

    public ArrayList ListaEmpresa()
    {
        ArrayList lista = new ArrayList();
        Empresa empresa = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        foreach (DataRow Row in dSet.Tables[0].Rows)
        {
            int id = Convert.ToInt32(Row["id"].ToString());
            string razonsocial = Row["razonSocial"].ToString();
            string rut = Row["rut"].ToString();
            string alias = Row["Alias"].ToString();
            string desc = Row["descripcion"].ToString();
            empresa = new Empresa(id, razonsocial, rut, alias, desc);
            lista.Add(empresa);
        }
        return lista;
    }

    internal Permiso getPermiso(int idRol, string pagina)
    {
        Permiso per = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("idRol", idRol);
        SQL.Parameters.AddWithValue("pagina", pagina);

        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();

        if (dSet.Tables[0].Rows.Count > 0)
        {
            DataRow Row = dSet.Tables[0].Rows[0];

            int id = Convert.ToInt32(Row["id"].ToString());
            string nombre = Row["nombrePagina"].ToString();
            bool acceso = Convert.ToBoolean(Row["acceso"].ToString().Equals("1"));
            bool edicion = Convert.ToBoolean(Row["edicion"].ToString().Equals("1"));
            bool eliminacion = Convert.ToBoolean(Row["eliminacion"].ToString().Equals("1"));
            bool creacion = Convert.ToBoolean(Row["creacion"].ToString().Equals("1"));

            per = new Permiso(id, idRol, nombre, pagina, acceso, edicion, eliminacion, creacion);
        }
        return per;
    }


    public DataSet getClientes()
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        return dSet;
    }

    public bool ValidateUser(object user, string pass)
    {
        bool val = false;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("usuario", user);
        SQL.Parameters.AddWithValue("pass", pass);

        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        val = dSet.Tables[0].Rows.Count != 0;
        return val;
    }

    public void IngresarFaena(Faena faena)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("nombre", faena.nombre);
        SQL.Parameters.AddWithValue("cliente", faena.cliente);
        SQL.Parameters.AddWithValue("empresa", faena.empresa);
        SQL.Parameters.AddWithValue("descripcion", faena.desc);
        SQL.Parameters.AddWithValue("estado", faena.estado);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void deleteFaena(string key)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("id", key);

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void modificarFaena(Faena faena)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("id", faena.id);
        SQL.Parameters.AddWithValue("nombre", faena.nombre);
        SQL.Parameters.AddWithValue("cliente", faena.cliente);
        SQL.Parameters.AddWithValue("empresa", faena.empresa);
        SQL.Parameters.AddWithValue("desc", faena.desc);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void IngresarEmpresa(Empresa empresa)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("razonSocial", empresa.razonsocial);
        SQL.Parameters.AddWithValue("rut", empresa.rut);
        SQL.Parameters.AddWithValue("alias", empresa.alias);
        SQL.Parameters.AddWithValue("descripcion", empresa.desc);
        SQL.Parameters.AddWithValue("estado", empresa.activo);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void deleteEmpresa(string key)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("id", key);

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void modificarEmpresa(Empresa empresa)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("id", empresa.id);
        SQL.Parameters.AddWithValue("rasonSocial", empresa.razonsocial);
        SQL.Parameters.AddWithValue("rut", empresa.rut);
        SQL.Parameters.AddWithValue("alias", empresa.alias);
        SQL.Parameters.AddWithValue("desc", empresa.desc);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public Rol getRol(int idRol)
    {
        Rol rol = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("id", idRol);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        if (dSet.Tables[0].Rows.Count > 0)
        {
            DataRow Row = dSet.Tables[0].Rows[0];
            string nombre = Row["nombre"].ToString();
            string descripcion = Row["descripcion"].ToString();
            bool activo = Row["estado"].ToString().Equals("1");
            //bool mostrar = Row["mostrar"].ToString().Equals("1");
            rol = new Rol(idRol, nombre, descripcion, activo, true);
        }
        return rol;
    }

    public User getUser(string usuario, string pass)
    {
        User user = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("usuario", usuario);
        SQL.Parameters.AddWithValue("pass", pass);

        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        if (dSet.Tables[0].Rows.Count > 0)
        {
            DataRow Row = dSet.Tables[0].Rows[0];
            string rut = Row["rut"].ToString();
            string nombre = Row["nombre"].ToString();
            string apellido = Row["apellido"].ToString();
            string mail = Row["mail"].ToString();
            bool activo = (Row["estado"].ToString().Equals("1"));
            int idrol = Convert.ToInt32(Row["idrol"].ToString());
            string rol = Row["rol"].ToString();
            bool uActivo = Row["activo"].ToString().Equals("1");
            string descripcion = Row["descripcion"].ToString();
            user = new User(rut, nombre, apellido, mail, idrol, rol, pass, uActivo, activo, pass, usuario, descripcion);
        }
        return user;
    }

    public void IngresarUsuario(User user)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("rut", user.Rut);
        SQL.Parameters.AddWithValue("nombre", user.Nombre);
        SQL.Parameters.AddWithValue("apellido", user.Apellido);
        SQL.Parameters.AddWithValue("mail", user.Mail);
        SQL.Parameters.AddWithValue("rol", user.idRol);
        SQL.Parameters.AddWithValue("tipo", user.Rol);
        SQL.Parameters.AddWithValue("estado", user.uActivo);
        SQL.Parameters.AddWithValue("usuario", user.Usuario);
        SQL.Parameters.AddWithValue("pass", user.Pass); ;

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public bool rolActivo(string idRol)
    {
        bool activo = false;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("idRol", idRol);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        if (dSet.Tables[0].Rows.Count > 0)
        {
            DataRow Row = dSet.Tables[0].Rows[0];
            activo = (Row["estado"].ToString().Equals("1"));
        }
        return activo;
    }

    #endregion

    #region InsertLogin

    internal void InsertLog(Log log)
    {
        throw new NotImplementedException();
    }

    #endregion

    public void modificarUsuario(User user)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        if (user.Pass.Length != 0) { Query += " ,pass=@pass "; }

        Query += /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("rut", user.Rut);
        SQL.Parameters.AddWithValue("nombre", user.Nombre);
        SQL.Parameters.AddWithValue("apellido", user.Apellido);
        SQL.Parameters.AddWithValue("mail", user.Mail);
        SQL.Parameters.AddWithValue("tipo", user.Rol);
        SQL.Parameters.AddWithValue("rol", user.idRol);
        SQL.Parameters.AddWithValue("usuario", user.Usuario);
        SQL.Parameters.AddWithValue("estado", user.uActivo);

        if (user.Pass != null)
        {
            if (user.Pass.Trim().Length > 0)
            {
                SQL.Parameters.AddWithValue("pass", user.Pass);
            }
        }

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void deleteUser(string rut)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("rut", rut);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public ArrayList ListaCliente()
    {
        ArrayList lista = new ArrayList();
        Cliente cliente = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        foreach (DataRow Row in dSet.Tables[0].Rows)
        {
            int cod = Convert.ToInt32(Row["cod"].ToString());
            string sap = Row["sap"].ToString();
            string rut = Row["rut"].ToString();
            string nombre = Row["nombre"].ToString();
            string apellido = Row["apellido"].ToString();
            string direccion = Row["direccion"].ToString();
            string fono = Row["fono"].ToString();
            string formadepago = Row["formadepago"].ToString();
            string estado = Row["estado"].ToString();
            DateTime fecha = DateTime.Parse(Row["fecha"].ToString());
            string razonsocial = Row["razonsocial"].ToString();
            string mail = Row["mail"].ToString();
            string descripcion = Row["observacion"].ToString();
            cliente = new Cliente(cod, sap, rut, nombre, apellido, direccion, fono, formadepago, estado, fecha,mail, razonsocial,descripcion);
            lista.Add(cliente);
        }
        return lista;
    }

    public void IngresarCliente(Cliente cliente)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("sap", cliente.sap);
        SQL.Parameters.AddWithValue("rut", cliente.rut);
        SQL.Parameters.AddWithValue("nombre", cliente.nombre);
        SQL.Parameters.AddWithValue("apellido", cliente.apellido);
        SQL.Parameters.AddWithValue("direccion", cliente.direccion);
        SQL.Parameters.AddWithValue("fono", cliente.fono);
        SQL.Parameters.AddWithValue("formadepago", cliente.formadepago);
        SQL.Parameters.AddWithValue("estado", cliente.estado);
        SQL.Parameters.AddWithValue("fecha", cliente.fecha);
        SQL.Parameters.AddWithValue("razonsocial", cliente.razonsocial);
        SQL.Parameters.AddWithValue("mail", cliente.mail);
        SQL.Parameters.AddWithValue("observacion", cliente.descripcion);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void modificarCliente(Cliente cliente)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */
       
        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("cod", cliente.cod);
        SQL.Parameters.AddWithValue("sap", cliente.sap);
        SQL.Parameters.AddWithValue("rut", cliente.rut);
        SQL.Parameters.AddWithValue("nombre", cliente.nombre);
        SQL.Parameters.AddWithValue("apellido", cliente.apellido);
        SQL.Parameters.AddWithValue("direccion", cliente.direccion);
        SQL.Parameters.AddWithValue("fono", cliente.fono);
        SQL.Parameters.AddWithValue("formadepago", cliente.formadepago);
        SQL.Parameters.AddWithValue("razonsocial", cliente.razonsocial);
        SQL.Parameters.AddWithValue("mail", cliente.mail);
        SQL.Parameters.AddWithValue("observacion", cliente.descripcion);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void deleteCliente(string cod)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("cod", cod);

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public ArrayList ListaProveedor()
    {
        ArrayList lista = new ArrayList();
        Proveedor proveedor = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        foreach (DataRow Row in dSet.Tables[0].Rows)
        {
            int cod = Convert.ToInt32(Row["cod"].ToString());
            string sap = Row["sap"].ToString();
            string rut = Row["rut"].ToString();
            string nombre = Row["nombre"].ToString();
            string apellido = Row["apellido"].ToString();
            string direccion = Row["direccion"].ToString();
            string fono = Row["fono"].ToString();
            //string formadepago = Row["formadepago"].ToString();
            string estado = Row["estado"].ToString();
            DateTime fecha = DateTime.Parse(Row["fecha"].ToString());
            string razonsocial = Row["razonsocial"].ToString();
            string mail = Row["mail"].ToString();
            string descripcion = Row["descripcion"].ToString();
            proveedor = new Proveedor(cod, sap, rut, nombre, apellido, direccion, fono, estado, fecha, razonsocial,mail,descripcion);
            lista.Add(proveedor);
        }
        return lista;
    }

    public void IngresarProveedor(Proveedor proveedor)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("sap", proveedor.sap);
        SQL.Parameters.AddWithValue("rut", proveedor.rut);
        SQL.Parameters.AddWithValue("nombre", proveedor.nombre);
        SQL.Parameters.AddWithValue("apellido", proveedor.apellido);
        SQL.Parameters.AddWithValue("direccion", proveedor.direccion);
        SQL.Parameters.AddWithValue("fono", proveedor.fono);
        SQL.Parameters.AddWithValue("estado", proveedor.estado);
        SQL.Parameters.AddWithValue("fecha", proveedor.fecha);
        SQL.Parameters.AddWithValue("razonsocial", proveedor.razonsocial);
        SQL.Parameters.AddWithValue("mail", proveedor.mail);
        SQL.Parameters.AddWithValue("descripcion", proveedor.descripcion);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void modificarProveedor(Proveedor proveedor)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("cod", proveedor.cod);
        SQL.Parameters.AddWithValue("sap", proveedor.sap);
        SQL.Parameters.AddWithValue("rut", proveedor.rut);
        SQL.Parameters.AddWithValue("nombre", proveedor.nombre);
        SQL.Parameters.AddWithValue("apellido", proveedor.apellido);
        SQL.Parameters.AddWithValue("direccion", proveedor.direccion);
        SQL.Parameters.AddWithValue("fono", proveedor.fono);
        SQL.Parameters.AddWithValue("razonsocial", proveedor.razonsocial);
        SQL.Parameters.AddWithValue("mail", proveedor.mail);
        SQL.Parameters.AddWithValue("descripcion", proveedor.descripcion);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void deleteProveedor(string key)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("cod", key);

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void IngresarTrabajador(Trabajador trabajador)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("rut", trabajador.rut);
        SQL.Parameters.AddWithValue("nombre", trabajador.nombre);
        SQL.Parameters.AddWithValue("apellido", trabajador.apellido);
        SQL.Parameters.AddWithValue("mail", trabajador.mail);
        SQL.Parameters.AddWithValue("cargo", trabajador.cargo);
        SQL.Parameters.AddWithValue("estado", trabajador.estado);
        SQL.Parameters.AddWithValue("fecha", trabajador.fecha);
        SQL.Parameters.AddWithValue("descripcion", trabajador.descripcion);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public void modificarTrabajador(Trabajador trabajador)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("id", trabajador.id);
        SQL.Parameters.AddWithValue("rut", trabajador.rut);
        SQL.Parameters.AddWithValue("nombre", trabajador.nombre);
        SQL.Parameters.AddWithValue("apellido", trabajador.apellido);
        SQL.Parameters.AddWithValue("mail", trabajador.mail);
        SQL.Parameters.AddWithValue("cargo", trabajador.cargo);
        SQL.Parameters.AddWithValue("descripcion", trabajador.descripcion);
        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public ArrayList ListaTrabajador()
    {
        ArrayList lista = new ArrayList();
        Trabajador trabajador = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        foreach (DataRow Row in dSet.Tables[0].Rows)
        {
            string id = Row["id"].ToString();
            string rut = Row["rut"].ToString();
            string nombre = Row["nombre"].ToString();
            string apellido = Row["apellido"].ToString();
            string mail = Row["mail"].ToString();
            string cargo = Row["cargo"].ToString();
            string estado = Row["estado"].ToString();
            DateTime fecha = DateTime.Parse(Row["fecha"].ToString());
            string descripcion = Row["descripcion"].ToString();
            trabajador = new Trabajador(Convert.ToInt32(id), rut, nombre, apellido, mail, cargo, estado, fecha,descripcion);
            lista.Add(trabajador);
        }
        return lista;
    }

    public void deleteTrabajador(string key)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("cod", key);

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    public ArrayList ListaEquipo()
    {
        ArrayList lista = new ArrayList();
        Equipo equipo = null;

        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        foreach (DataRow Row in dSet.Tables[0].Rows)
        {
            string id = Row["id"].ToString();
            string sap = Row["sap"].ToString();
            string cod = Row["cod"].ToString();
            DateTime fechaCompra = DateTime.Parse(Row["fechaCompra"].ToString());
            string precioCompra = Row["precioCompra"].ToString();
            string nombre = Row["nombre"].ToString();
            string tipo = Row["tipo"].ToString();
            Boolean estado = Boolean.Parse(Row["estado"].ToString());
            string descripcion = Row["descripcion"].ToString();
            string numeroSerie = Row["numeroSerie"].ToString();
            string proveedor = Row["proveedor"].ToString();
            string horometro = Row["horometro"].ToString();
            DateTime fechaHorometro = DateTime.Parse(Row["fechaHorometro"].ToString());
            DateTime fecha = DateTime.Parse(Row["fecha"].ToString());
            string modelo = Row["modelo"].ToString();
            string uEstado = Row["uEstado"].ToString();
            string familia = Row["familia"].ToString();
            equipo = new Equipo(id, sap, cod, fechaCompra, precioCompra, nombre, tipo, estado, descripcion,
                numeroSerie, proveedor, horometro, fechaHorometro, modelo, fecha, uEstado, familia);
            lista.Add(equipo);
        }
        return lista;
    }

    public int IngresarEquipo(Equipo equipo)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("sap", equipo.sap);
            SQL.Parameters.AddWithValue("cod", equipo.cod);
            SQL.Parameters.AddWithValue("precioCompra", equipo.precioCompra);
            SQL.Parameters.AddWithValue("fechaCompra", equipo.fechaCompra);
            SQL.Parameters.AddWithValue("modelo", equipo.modelo);
            SQL.Parameters.AddWithValue("familia", equipo.familia);
            SQL.Parameters.AddWithValue("descripcion", equipo.descripcion);
            SQL.Parameters.AddWithValue("numeroSerie", equipo.numeroSerie);
            SQL.Parameters.AddWithValue("proveedor", equipo.proveedor);
            SQL.Parameters.AddWithValue("estado", equipo.estado);
            SQL.Parameters.AddWithValue("horometro", equipo.horometro);
            SQL.Parameters.AddWithValue("fechaHorometro", equipo.fechaHorometro);
            SQL.Parameters.AddWithValue("fecha", equipo.fecha);
            SQL.Parameters.AddWithValue("nombre", equipo.nombre);
            SQL.Parameters.AddWithValue("tipo", equipo.tipo);
            SQL.Parameters.AddWithValue("uEstado", equipo.uEstado);
            Open();
            SQL.ExecuteNonQuery();
            Close();
            respuesta = 1;
        }
        catch (Exception ex)
        {
            respuesta = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }
        return respuesta;
    }
    public int modificarEquipo(Equipo equipo)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("id", equipo.id);
            SQL.Parameters.AddWithValue("sap", equipo.sap);
            SQL.Parameters.AddWithValue("cod", equipo.cod);
            SQL.Parameters.AddWithValue("precioCompra", equipo.precioCompra);
            SQL.Parameters.AddWithValue("fechaCompra", equipo.fechaCompra);
            SQL.Parameters.AddWithValue("modelo", equipo.modelo);
            SQL.Parameters.AddWithValue("familia", equipo.familia);
            SQL.Parameters.AddWithValue("descripcion", equipo.descripcion);
            SQL.Parameters.AddWithValue("numeroSerie", equipo.numeroSerie);
            SQL.Parameters.AddWithValue("proveedor", equipo.proveedor);
            SQL.Parameters.AddWithValue("estado", equipo.estado);
            SQL.Parameters.AddWithValue("horometro", equipo.horometro);
            SQL.Parameters.AddWithValue("fechaHorometro", equipo.fechaHorometro);
            SQL.Parameters.AddWithValue("fecha", equipo.fecha);
            SQL.Parameters.AddWithValue("nombre", equipo.nombre);
            SQL.Parameters.AddWithValue("tipo", equipo.tipo);
            SQL.Parameters.AddWithValue("uEstado", equipo.uEstado);
            Open();
            SQL.ExecuteNonQuery();
            Close();
            respuesta = 1;
        }
        catch (Exception ex)
        {
            respuesta = -1;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }
        return respuesta;
    }

    public void deleteEquipo(string key)
    {
        Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

        SQL = new MySqlCommand(Query, Conexion);
        SQL.Parameters.AddWithValue("cod", key);

        Open();
        SQL.ExecuteNonQuery();
        Close();
    }

    #endregion
}