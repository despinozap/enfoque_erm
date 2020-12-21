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
/// Summary description for PersArr
/// </summary>
public class PersArr
{

    private static PersArr p;
    private MySqlConnection Conexion;
    private MySqlCommand SQL;
    private MySqlDataAdapter sqlAdpt;
    private string Query;

    #region //--------------------------------- CONEXION ---------------------------------\\
    public PersArr()
    {
        Conexion = new MySqlConnection();
        
         Conexion.ConnectionString = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */
    }

    public static PersArr getInstance()
    {
        if (p == null) { p = new PersArr(); }
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

    #region //--------------------------------- DASHBOARD ---------------------------------\\
    internal DataSet getFamily()
    {
        Query = @"SELECT DISTINCT familia FROM equipo";

        SQL = new MySqlCommand(Query, Conexion);

        DataSet dSet = new DataSet();
        Open();
        sqlAdpt = new MySqlDataAdapter();
        sqlAdpt.SelectCommand = SQL;
        sqlAdpt.Fill(dSet);
        Close();
        return dSet;
    }
    internal DataSet getEquipoDisponible()
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
    internal DataSet getEquipoReserva()
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

    #endregion

    #region //--------------------------------- EQUIPO ---------------------------------\\
    public void deleteEquipo(string key)
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
    //Pendiente, agregar el uEstado en query
    public ArrayList listarEquiposDisponibles()
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
            string numeroSerie = Row["numeroSerie"].ToString();
            string nombre = Row["nombre"].ToString();
            string familia = Row["familia"].ToString();
            string tipo = Row["tipo"].ToString();
            Boolean estado = true;
            string descripcion = null;
            string proveedor = null;
            string horometro = null;
            DateTime fechaHorometro = DateTime.Today;
            DateTime fecha = DateTime.Today;
            string modelo = null;
            string uEstado = null;
            DateTime fechaCompra = DateTime.Today;
            string precioCompra = null;
            equipo = new Equipo(id, sap, cod, fechaCompra, precioCompra, nombre, tipo, estado, descripcion,
                numeroSerie, proveedor, horometro, fechaHorometro, modelo, fecha, uEstado, familia);
            lista.Add(equipo);
        }
        return lista;
    }
    public ArrayList getFamilias()
    {
        ArrayList familia = new ArrayList();
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            DataSet dSet = new DataSet();
            Open();
            sqlAdpt = new MySqlDataAdapter();
            sqlAdpt.SelectCommand = SQL;
            sqlAdpt.Fill(dSet);
            Close();
            familia.Add(new { id = 0, name = "Seleccione una familia" });
            foreach (DataRow Row in dSet.Tables[0].Rows)
            {
                string familiaDb = Row["familia"].ToString();
                familia.Add(new { id = familiaDb, name = familiaDb });
            }
        }
        catch (Exception ex)
        {
            familia = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }
        return familia;
    }
    public ArrayList getTipos(string familiaIn)
    {
        ArrayList familia = new ArrayList();
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("familia", familiaIn);
            DataSet dSet = new DataSet();
            Open();
            sqlAdpt = new MySqlDataAdapter();
            sqlAdpt.SelectCommand = SQL;
            sqlAdpt.Fill(dSet);
            Close();
            foreach (DataRow Row in dSet.Tables[0].Rows)
            {
                string familiaDb = Row["familia"].ToString();
                familia.Add(new { id = familiaDb, name = familiaDb });
            }
        }
        catch (Exception ex)
        {
            familia = null;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }
        return familia;
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
    #endregion

    #region //--------------------------------- EMPRESA ---------------------------------\\
    public ArrayList ListaEmpresa()
    {
        ArrayList lista = new ArrayList();
        Empresa empresa = null;
        //        Query = @"SELECT *
        //                FROM Empresa
        //                where estado = 1";

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
            string strContacto = Row["strContacto"].ToString();
            string strObra = Row["strObra"].ToString();
            empresa = new Empresa(id, razonsocial, rut, alias, desc, strContacto, strObra);
            lista.Add(empresa);
        }
        return lista;
    }
    public int IngresarEmpresa(Empresa empresa)
    {
        try
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
            return 1;
        }
        catch (Exception ex)
        {
            return 2;
        }
        finally
        {
            if (this.isOpen())
            {
                this.Close();
            }
        }
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
    #endregion

    #region //--------------------------------- CONTACTO ---------------------------------\\
    public int ingresarContacto(Contacto contacto)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("area", contacto.area);
            SQL.Parameters.AddWithValue("nombre", contacto.nombre);
            SQL.Parameters.AddWithValue("email", contacto.email);
            SQL.Parameters.AddWithValue("telefono", contacto.telefono);
            SQL.Parameters.AddWithValue("celular", contacto.celular);
            SQL.Parameters.AddWithValue("direccion", contacto.direccion);
            SQL.Parameters.AddWithValue("observacion", contacto.observacion);
            SQL.Parameters.AddWithValue("ciudad", contacto.ciudad);
            SQL.Parameters.AddWithValue("fecha", contacto.fecha);
            SQL.Parameters.AddWithValue("estado", contacto.estado);
            SQL.Parameters.AddWithValue("empresa_id", contacto.empresa_id);
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
    public int modificarContacto(Contacto contacto)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("area", contacto.area);
            SQL.Parameters.AddWithValue("nombre", contacto.nombre);
            SQL.Parameters.AddWithValue("email", contacto.email);
            SQL.Parameters.AddWithValue("telefono", contacto.telefono);
            SQL.Parameters.AddWithValue("celular", contacto.celular);
            SQL.Parameters.AddWithValue("direccion", contacto.direccion);
            SQL.Parameters.AddWithValue("observacion", contacto.observacion);
            SQL.Parameters.AddWithValue("ciudad", contacto.ciudad);
            SQL.Parameters.AddWithValue("fecha", contacto.fecha);
            SQL.Parameters.AddWithValue("estado", contacto.estado);
            SQL.Parameters.AddWithValue("empresa_id", contacto.empresa_id);
            SQL.Parameters.AddWithValue("id", contacto.id);

            Open();
            SQL.ExecuteNonQuery();
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
    public int eliminarContacto(string id, DateTime fecha)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("estado", false);
            SQL.Parameters.AddWithValue("fecha", fecha);
            SQL.Parameters.AddWithValue("id", id);

            Open();
            SQL.ExecuteNonQuery();
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
    #endregion

    #region //--------------------------------- OBRA ---------------------------------\\
    public int eliminarObra(string id, DateTime fecha)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("estado", false);
            SQL.Parameters.AddWithValue("fecha", fecha);
            SQL.Parameters.AddWithValue("id", id);

            Open();
            SQL.ExecuteNonQuery();
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
    public int ingresarObra(Obra obra)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("nombre", obra.nombre);
            SQL.Parameters.AddWithValue("direccion", obra.direccion);
            SQL.Parameters.AddWithValue("observacion", obra.observacion);
            SQL.Parameters.AddWithValue("ciudad", obra.ciudad);
            SQL.Parameters.AddWithValue("fecha", obra.fecha);
            SQL.Parameters.AddWithValue("estado", obra.estado);
            SQL.Parameters.AddWithValue("empresa_id", obra.empresa_id);
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

    public int modificarObra(Obra obra)
    {
        int respuesta = 0;
        try
        {
            Query = /* THIS SQL QUERY HAS BEEN HIDDEN FOR CONFIDENTIALITY PURPOSES */

            SQL = new MySqlCommand(Query, Conexion);
            SQL.Parameters.AddWithValue("nombre", obra.nombre);
            SQL.Parameters.AddWithValue("direccion", obra.direccion);
            SQL.Parameters.AddWithValue("observacion", obra.observacion);
            SQL.Parameters.AddWithValue("ciudad", obra.ciudad);
            SQL.Parameters.AddWithValue("fecha", obra.fecha);
            SQL.Parameters.AddWithValue("estado", obra.estado);
            SQL.Parameters.AddWithValue("empresa_id", obra.empresa_id);
            SQL.Parameters.AddWithValue("id", obra.id);

            Open();
            SQL.ExecuteNonQuery();
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
    #endregion
}