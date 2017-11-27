<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP_Begin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="Script/jquery-3.1.1.min.js"></script>
    <link href="Content/css/bootstrap.css" rel="stylesheet" />
    <script src="Script/bootstrap.min.js"></script>
</head>
<body style="background-color:#708090">
     
    <form id="form1" runat="server"  data-toggle="validator">
   <div class="container-fluid">
        <div class="row content">
            <%--</div>--%>
      
        <div class="row content" style="padding-top:250px";>
              <div class="col-sm-1">
                </div>           
              <div class="col-sm-4">
               <div class="panel" >
                    <div class="panel-heading" style="background-color:#B0C4DE"><h4 style="color:white">Login</h4></div>
                    <div class="panel-body">
                          <div class="form-group">
                    <label for ="txtUserName">User Name</label>
                    <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name" class="form-control" required></asp:TextBox>
                              
                    <label for ="txtPassword">Password</label>        
                    <asp:TextBox ID="txtPassword"  runat="server" placeholder="Password" class="form-control" TextMode="Password" required></asp:TextBox>  
                    </div>
                    <asp:Button ID="btLogin" runat="server" Text="Log!n"  class="btn btn-success" style="background-color:#708090" OnClick="btLogin_Click" />

                        </div>
                   </div>
                  
                  
                </div>
              <div class="col-sm-7">
                </div>
            </div>
         </div>
    </form>
</body>
</html>
