using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace onlinecarrental.Models
{
    public class Functions
    {
        private SqlConnection Conn;
        private SqlCommand cmd;
        private DataTable dt;
        private string ConnStr;
        private SqlDataAdapter sda;

        public Functions()
        {
<<<<<<< HEAD
            ConnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;
                      AttachDbFilename=C:\Users\ASUS\Downloads\CarRentalDbASP - Copy.mdf;
                      Integrated Security=True;
                      Connect Timeout=30;";

=======
            ConnStr = @"Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\ASUS\\OneDrive\\Documents\\CarRentalDbASP.mdf;Integrated Security=True;Connect Timeout=30";
>>>>>>> e7ac5293f36f4e861df915d515d031954faf6ac6
            Conn = new SqlConnection(ConnStr);
            cmd = new SqlCommand();
            cmd.Connection = Conn;
        }

        public DataTable Getdata(string Query)
        {
            dt = new DataTable();
            sda = new SqlDataAdapter(Query, ConnStr);
            sda.Fill(dt);
            return dt;

        }

        public int SetData(string Query)
        {
            int rcnt = 0;
            if (Conn.State == ConnectionState.Closed)
            {  Conn.Open(); }
            cmd.CommandText = Query;
            rcnt = cmd.ExecuteNonQuery();
            return rcnt;
        }
    }
}