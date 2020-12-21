using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Descripción breve de SHA512
/// </summary>
public class EncrSHA512
{
	public EncrSHA512()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public static string getSHA512(string pass)
    {
        SHA512 sha = SHA512CryptoServiceProvider.Create();
        byte[] dataSha = sha.ComputeHash(Encoding.Default.GetBytes(pass));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < dataSha.Length; i++)
        {
            sb.AppendFormat("{0:x2}", dataSha[i]);
        }
        pass = sb.ToString();
        return pass;
    }
}