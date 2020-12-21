using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CtrlDashBoard
/// </summary>
public class CtrlDashBoard
{
    private static CtrlDashBoard ctrl;

    public static CtrlDashBoard getInstalnce()
    {
        if (ctrl == null) { ctrl = new CtrlDashBoard(); }
        return ctrl;
    }

	public CtrlDashBoard()
	{
		
	}
    public List<string> ListFamily()
    {
        List<string> Lista = new List<string>();
        DataSet ds = PersArr.getInstance().getFamily();
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            string categoria = dr["familia"].ToString();
            Lista.Add(categoria);
        }
        return Lista;
    }
}