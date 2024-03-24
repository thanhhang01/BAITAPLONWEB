using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

public class Ketnoi
{
    private string chuoiketnoi = @"Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True";
    private SqlConnection con = null;
    private SqlCommand cmd = null;
    private SqlDataAdapter da = null;
    public void Open()
    {
        con = new SqlConnection(chuoiketnoi);
        con.Open();
    }
    public void close()
    {
        con.Close();
    }
    public DataTable laydulieu(string sql)
    {
        cmd = new SqlCommand(sql, con);
        da = new SqlDataAdapter(cmd);
        DataTable db = new DataTable();
        da.Fill(db);
        return db;
    }
    public void xuly(string sql)
    {

        cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
    }
}