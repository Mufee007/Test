<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmdatalist.aspx.cs" Inherits="ASP_Begin.frmdatalist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="DepartmentId" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                DepartmentName:
                <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>'></asp:Label>
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                <br />
                DepartmentId:
                <asp:Label ID="DepartmentIdLabel" runat="server" Text='<%# Eval("DepartmentId") %>' />
                <br />

                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                <br />
            </ItemTemplate>
        </asp:DataList>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASP_TestDBConnectionString %>" SelectCommand="SELECT [DepartmentName], [Description], [DepartmentId] FROM [tblDepartment]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
