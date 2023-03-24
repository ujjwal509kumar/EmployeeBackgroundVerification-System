using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO.Ports;
using System.Threading;

namespace EmpBackgroundVerify
{
    public class DB
    {
        SqlConnection con = null;
        SqlCommand cmd = null;

        public DB()
        {
            con = new SqlConnection(Common.ConnectionString.getConnectionString());
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
        }

        public int DoTransaction(string sql)
        {
            cmd.CommandText = sql;
            return cmd.ExecuteNonQuery();
        }

        public DataTable DoNonTransaction(string sql)
        {
            SqlDataAdapter a = new SqlDataAdapter(sql, con);
            DataTable t = new DataTable();
            a.Fill(t);
            return t;
        }

        public int DoAggregate(string sql)
        {
            SqlDataAdapter a = new SqlDataAdapter(sql, con);
            DataTable t = new DataTable();
            a.Fill(t);
            return int.Parse(t.Rows[0][0].ToString());
        }

        public string DoAggregate2(string sql)
        {
            SqlDataAdapter a = new SqlDataAdapter(sql, con);
            DataTable t = new DataTable();
            a.Fill(t);
            return t.Rows[0][0].ToString();
        }
    }
}