using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using ASP_Begin.DAL;
namespace ASP_Begin
{
    public partial class DepartmentReport : System.Web.UI.Page
    {
        private void LoadReport()
        {
            DepartmentDAL obj = new DepartmentDAL();
            ReportDocument crystalReport = new ReportDocument();
            crystalReport.Load(Server.MapPath("crptDepartment.rpt"));
            dsGeneral ds = obj.LoadDepartmentReport();
            crystalReport.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = crystalReport;
            CrystalReportViewer1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReport();
            }
        }
    }
}