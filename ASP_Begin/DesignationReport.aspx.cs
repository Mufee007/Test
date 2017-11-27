using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;
namespace ASP_Begin
{
    public partial class DesignationReport : System.Web.UI.Page
    {
       
        private void BindReport()
        {
            string query = "SELECT ";
            bool isSelected = chkColumns.Items.Cast<ListItem>().Count(i => i.Selected == true) > 0;
            if (!isSelected)
            {
                chkColumns.Items[0].Selected = true;
            }
            foreach (ListItem item in chkColumns.Items)
            {
                if (item.Selected)
                {
                    query += item.Value + ",";
                    isSelected = true;
                }
            }
            query = query.Substring(0, query.Length - 1);
            query += " FROM tblDesignation";
            ReportDocument crystalReport = new ReportDocument();
            CrystalReportViewer1.DisplayGroupTree = false;
            crystalReport.Load(Server.MapPath("crptDesignation.rpt"));
            dsDesignation dsCustomers = GetData(query, crystalReport);
            crystalReport.SetDataSource(dsCustomers);
            CrystalReportViewer1.ReportSource = crystalReport;
        }
        private dsDesignation GetData(string query, ReportDocument crystalReport)
        {
            string conString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                dsDesignation ds1 = new dsDesignation();
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    //Get the List of all TextObjects in Section2.
                    List<TextObject> textObjects = crystalReport.ReportDefinition.Sections["Section2"].ReportObjects.OfType<TextObject>().ToList();
                    for (int i = 0; i < textObjects.Count; i++)
                    {
                        //Set the name of Column in TextObject.
                        textObjects[i].Text = string.Empty;
                        if (sdr.FieldCount > i)
                        {
                            if (sdr.GetName(i).ToUpper() == "DESIGNATIONID")
                            {
                                textObjects[i].Text = "Desgination ID";
                            }
                            else if (sdr.GetName(i).ToUpper() == "DESIGNATIONNAME")
                            {
                                textObjects[i].Text = "Desgination Name";
                            }
                            else if (sdr.GetName(i).ToUpper() == "DESCRIPTION")
                            {
                                textObjects[i].Text = "Description";
                            }
                            else if (sdr.GetName(i).ToUpper() == "ISACTIVE")
                            {
                                textObjects[i].Text = "Is Active";
                            }
                            
                        }
                    }
                    //Load all the data rows in the Dataset.
                    while (sdr.Read())
                    {
                        DataRow dr = ds1.Tables[0].Rows.Add();
                        for (int i = 0; i < sdr.FieldCount; i++)
                        {
                            dr[i] = sdr[i];
                        }
                    }
                }
                con.Close();
                return ds1;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
                this.BindReport();
            
        }

        protected void Columns_Changed(object sender, EventArgs e)
        {
            this.BindReport();
        }
    }
}