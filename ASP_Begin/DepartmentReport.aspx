<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentReport.aspx.cs" Inherits="ASP_Begin.DepartmentReport" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" EnableParameterPrompt="False"
                     HasCrystalLogo="False" HasDrillUpButton="False" HasZoomFactorList="False" ToolPanelView="None"
                      Height="50px" Width="350px"  EnableDatabaseLogonPrompt="False" DisplayToolbar="True" EnableTheming="true" 
                       PrintMode="Pdf" Font-Size="9px" Font-Names="Verdana" />
    
    </div>
    </form>
</body>
</html>
