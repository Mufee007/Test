<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="ASP_Begin.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JQUERY TEST</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#btn1").click(function () {
                $("p").hide(1000);
            });
            $("#btn1").dblclick(function () {
                $("p").show(1000);
            });
            $("#btn2").click(function () {
                $("p").fadeTo('fast',0.5);
            });
            
            $("#p1").on({
                mouseenter: function () {
                    $(this).css("background-color", "lightgray");
                },
                mouseleave: function () {
                    $(this).css("background-color", "lightblue");
                },
                click: function () {
                    $(this).css("background-color", "yellow");
                }
            });

            $("#input1").focus(function(){
                $(this).css("background-color", "#cccccc");
            });
            $("#input1").blur(function () {
                $(this).css("background-color", "#cccc12");
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p id="p1">Hi this is for testing Jquery action</p>
    </div>
        <input type ="button" id="btn1" value= "Hide Paragraph" />
        <input type ="button" id="btn2" value= "Show Hidden Paragraph" />
        <input type="text" id="input1" />
    </form>
</body>
</html>
