<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectedRowTop.aspx.cs" Inherits="ASP_Begin.SelectedRowTop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><asp:Button ID="Button1"
        runat="server" Text="Button" OnClientClick="return MoveTo();" />
    <div style=overflow: auto;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Height="230px">
            <Columns>
                <asp:TemplateField HeaderText="ID" SortExpression="ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a name='<%# Eval("ID") %>'></a>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
        </asp:GridView>

    <script type="text/javascript">
        function MoveTo() {
            window.location.href = "#" + document.getElementById('<%= TextBox2.ClientID %>').value;
            return false;
        }
    </script>
    </div>
    </form>
</body>
</html>
