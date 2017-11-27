using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
namespace ASP_Begin.DAL
{
    public  class GeneralDAL:My_Connection
    {
        public  void BindDropdown(DropDownList ddl,string SpName,string Action, string DispField,string ValueField)
        {
            _initObjects(SpName);
            cmd.Parameters.AddWithValue("@Action", Action);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ddl.DataSource = dt;
                ddl.DataValueField = ValueField;
                ddl.DataTextField = DispField;
                ddl.DataBind();
                ddl.SelectedIndex = 0;
            }
        }
        public DataTable GetTable(string SpName,string Action)
        {
            _initObjects(SpName);
            cmd.Parameters.AddWithValue("@Action", Action);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}