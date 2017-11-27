using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Diagnostics;
using System.Globalization;

namespace ASP_Begin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack )
            {
               DropDownList1 .DataSource = GetCountry();
               DropDownList1.DataBind();
               
            }
        }

     

    public List<string> GetCountry()
    {
        List<string> Culturelist =new List<string >();
        CultureInfo[] getcultureinfo = CultureInfo.GetCultures(CultureTypes.SpecificCultures);
        foreach (CultureInfo getculture in getcultureinfo)
        {
            RegionInfo getregioninfo = new RegionInfo(getculture.LCID);
            if (!Culturelist.Contains(getregioninfo.EnglishName))
            {
                Culturelist.Add(getregioninfo .ThreeLetterISORegionName + "  " +  getregioninfo.EnglishName);
            }
        }
        Culturelist.Sort();
        return Culturelist;
    }


    }
}