using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DestekTalep
{
    public class DbHelper
    {
        SqlConnection _baglanti = new SqlConnection();
        public DbHelper()
        {
            var connStr = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            _baglanti = new SqlConnection(connStr);
        }
        public DataTable GetDataTable(string sql)
        {
            _baglanti.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, _baglanti);
            DataTable dt = new DataTable();
            da.Fill(dt);
            _baglanti.Close();
            return dt;
        }
        public DataRow GetDataRow(string sql, Dictionary<string, object> parameters)
        {
            var dt = GetDataTable(sql, parameters);
            if (dt == null)
            {
                return null;
            }

            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }

            return null;
        }
        public DataTable GetDataTable(string sql, Dictionary<string, object> parameters)
        {
            _baglanti.Open();
            SqlCommand komut = new SqlCommand(sql, _baglanti);

            if (parameters != null && parameters.Count > 0)
            {
                foreach (KeyValuePair<string, object> par in parameters)
                {
                    komut.Parameters.AddWithValue(par.Key, par.Value);
                }
            }

            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);

            _baglanti.Close();

            return dt;
        }
        public int Execute(string query, Dictionary<string, object> parameters)
        {
            _baglanti.Open();
            SqlCommand komut = new SqlCommand(query, _baglanti);

            if (parameters != null && parameters.Count > 0)
            {
                foreach (KeyValuePair<string, object> par in parameters)
                {
                    komut.Parameters.AddWithValue(par.Key, par.Value);
                }
            }

            var result = komut.ExecuteNonQuery();
            _baglanti.Close();

            return result;
        }
        public DataRow GetDataRow(string sql)
        {
            var dt = GetDataTable(sql);
            if (dt == null)
            {
                return null;
            }

            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }

            return null;
        }
    }
}