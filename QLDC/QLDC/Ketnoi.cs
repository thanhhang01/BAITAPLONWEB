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

    public int kiemtra(string query)
    {
        int result = 0;
        // Mở kết nối đến cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection(@"Data Source=DESKTOP-9U5V67H;Initial Catalog=QLBDC;Integrated Security=True"))
        {
            // Mở kết nối
            connection.Open();

            // Tạo đối tượng Command và thi hành truy vấn
            SqlCommand command = new SqlCommand(query, connection);

            // Thực hiện truy vấn và gán kết quả vào biến result
            result = (int)command.ExecuteScalar();

            // Đóng kết nối
            connection.Close();
        }
        // Trả về kết quả của truy vấn
        return result;
    }
}