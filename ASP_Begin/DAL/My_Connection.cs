using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ASP_Begin.DAL
{
    public class My_Connection
    {
        public SqlConnection con = new SqlConnection();
        public SqlCommand cmd;
        public SqlDataAdapter da;

        public void _initObjects(string SpName)
        {
            cmd = new SqlCommand();
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            cmd.CommandText = SpName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = openCon();

        }
        public SqlConnection openCon()
        {
            try
            {
                //string _constring = ConfigurationManager.ConnectionStrings["MyCon"].ToString();
                string _constring = @"Data Source=ASLAM-PC\SQL;Initial Catalog=TAACS_ANSALDO;Persist Security Info=True;User ID=sa;Password=myserver";
                //Data Source=ASLAM-PC\SQL;Initial Catalog=TAACS_ANSALDO;Persist Security Info=True;User ID=sa;Password=***********
                con.ConnectionString = _constring;
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                return con;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void CloseCon()
        {
            con.Dispose();
        }
    }
}