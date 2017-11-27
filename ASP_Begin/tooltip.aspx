<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tooltip.aspx.cs" Inherits="ASP_Begin.tooltip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
     <script src="Script/jquery-1.11.0.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $("#Label1").mouseenter(function () {
                var pageUrl = '<%= ResolveUrl("~/tooltip.aspx/jqueryAjaxCall") %>';
             var firstName = 'abc'
             var lastName = '11'
             var parameter = { "firstName": firstName, "lastName": lastName }

             $.ajax({
                 type: 'POST',
                 url: pageUrl,
                 data: JSON.stringify(parameter),
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     onSuccess(data);
                 },
                 error: function (data, success, error) {
                     alert("Error : " + error);
                 }
             });

             return false;
        


        });
    });
</script>
     <script type="text/javascript" language="javascript">

         function JqueryAjaxCall() {
             var pageUrl = '<%= ResolveUrl("~/tooltip.aspx/jqueryAjaxCall") %>';
            var firstName = 'abc'
            var lastName = '11'
            var parameter = { "firstName": firstName, "lastName": lastName }

            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    onSuccess(data);
                },
                error: function (data, success, error) {
                    alert("Error : " + error);
                }
            });

            return false;
        }

        function onSuccess(data) {
            alert(data.d);
        }

    </script>


</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server"  Text="Label" ToolTip="hiiiiii"></asp:Label>
        <asp:HiddenField ID="HiddenField1" runat="server" OnValueChanged="HiddenField1_ValueChanged" />
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
      <asp:Button ID="btnSubmit" runat="server" OnClientClick="return JqueryAjaxCall();"
                        Text="Submit" />
    </div>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" OnClientClick="return JqueryAjaxCall();">Multiple Selection</asp:LinkButton>
        <div id="divabc" runat ="server" visible ="false" style="width  :300px; background-color :azure;  height :auto;  " >
          <ul>
              <li>123 </li>
              <li>123 </li>
              <li>123 </li>
              <li>123 </li>

          </ul>
        </div>
    </form>
</body>
</html>
