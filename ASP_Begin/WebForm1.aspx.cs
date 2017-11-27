using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace ASP_Begin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private void LoadEarning()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SlNo");
            dt.Columns.Add("Payhead");
            dt.Columns.Add("amountold");
            dt.Columns.Add("amount");
            dt.Rows.Add("1", "Basic", "15000", "0.00");
            dt.Rows.Add("2", "Conveyance", "3000", "0.00");
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (dt.Rows.Count > 0)
            {
                decimal decTotal = dt.AsEnumerable().Sum(x => Convert.ToDecimal(x["amount"]));
                txtTotalEarning.Text = decTotal.ToString();

                decimal decTotalOld = dt.AsEnumerable().Sum(x => Convert.ToDecimal(x["amountOld"]));
                txtTotalEarningOld.Text = decTotalOld.ToString();

            }
            else
            {
                txtTotalEarning.Text = "0.00";
                txtTotalEarningOld.Text = "0.00";
            }
            CalculateNetOldSalary();
        }
        private void LoadDeduction()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SlNo");
            dt.Columns.Add("Payhead");
            dt.Columns.Add("amountold");
            dt.Columns.Add("amount");
            dt.Rows.Add("1", "PF", "1000", "0.00");
            dt.Rows.Add("2", "ESI", "200", "0.00");
            dt.Rows.Add("1", "PT", "200", "0.00");
            dt.Rows.Add("2", "HRA", "1000", "0.00");

            GridView2.DataSource = dt;
            GridView2.DataBind();

            if (dt.Rows.Count > 0)
            {
                decimal decTotal = dt.AsEnumerable().Sum(x => Convert.ToDecimal(x["amount"]));
                txtTotalDeduction.Text = decTotal.ToString();

                decimal decTotalOld = dt.AsEnumerable().Sum(x => Convert.ToDecimal(x["amountOld"]));
                txtTotalDeductionOld.Text = decTotalOld.ToString();

            }
            else
            {
                txtTotalDeduction.Text = "0.00";
                txtTotalDeductionOld.Text = "0.00";
            }
            CalculateNetOldSalary();
        }
        private void CalculateNetOldSalary()
        {
            decimal _DedOld = 0, _EarnOld = 0;
            if (txtTotalDeductionOld.Text.Trim() != "")
            {
                _DedOld = Convert.ToDecimal(txtTotalDeductionOld.Text.Trim());
            }
            if (txtTotalEarningOld.Text.Trim() != "")
            {
                _EarnOld = Convert.ToDecimal(txtTotalEarningOld.Text.Trim());
            }
            txtNetSalaryOld.Text = (_EarnOld - _DedOld).ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            LoadEarning();
            LoadDeduction();
        }

       

       

       
    }
}