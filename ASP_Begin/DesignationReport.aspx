<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DesignationReport.aspx.cs" Inherits="ASP_Begin.DesignationReport" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Columns:
<asp:CheckBoxList ID="chkColumns" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
    OnSelectedIndexChanged="Columns_Changed">
    <asp:ListItem Text="Designation Id" Value="DesignationId" Selected="True"></asp:ListItem>
    <asp:ListItem Text="Designation Name" Value="DesignationName" Selected="True"></asp:ListItem>
    <asp:ListItem Text="Description" Value="Description" Selected="True"></asp:ListItem>
    <asp:ListItem Text="Is Active" Value="IsActive" Selected="True"></asp:ListItem>   
</asp:CheckBoxList>
<hr />
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
</asp:Content>
