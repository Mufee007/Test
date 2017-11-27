<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tset.aspx.cs" Inherits="ASP_Begin.tset" %>

<%@ Register Src="~/Message1.ascx" TagPrefix="uc1" TagName="Message1" %>

<uc1:Message1 runat="server" id="Message1" />
<!DOCTYPE html>
<html>
<body>
    <h1>What Can JavaScript Do?</h1>

<p id="demo">JavaScript can change HTML content.</p>

<button type="button" onclick='document.getElementById("demo").innerHTML = "First text"'>text 1</button>
    <button type="button" onclick='document.getElementById("demo").innerHTML = "Seconed text"'>text 2</button>
    <hr />
<h1>What Can JavaScript Do?</h1>

<p>JavaScript can change HTML attributes.</p>

<p>In this case JavaScript changes the src (source) attribute of an image.</p>

<button onclick="document.getElementById('myImage').src='Content/Image/Chrysanthemum.jpg'">Image 1</button>

<img id="myImage" src="Content/Image/Chrysanthemum.jpg" style="width:100px">

<button onclick="document.getElementById('myImage').src='Content/Image/Desert.jpg'">Image 2</button>

    <hr />
    <h1>What Can JavaScript Do?</h1>

<p id="demo1">JavaScript can change the style of an HTML element.</p>

<button type="button" onclick="document.getElementById('demo1').style.fontSize='35px'">Big text!</button>
    <button type="button" onclick="document.getElementById('demo1').style.fontSize='25px'">Normal text!</button>

    <hr />
    <h1>What Can JavaScript Do?</h1>

<p id="demo3">JavaScript can hide HTML elements.</p>

<button type="button" onclick="document.getElementById('demo3').style.display='none'">Hide text</button>
    <button type="button" onclick="document.getElementById('demo3').style.display='block'">Show text</button>
    <br />
    <hr />
    <form runat="server">
  
        <input type="button" value="Success" class="btn btn-success" onclick="ShowMessage('<%= ASP_Begin.Message.Text.SUCCESS_CLIENT %>    ','<%= ASP_Begin.Message.Type.success %>    ');" /> 
        </form>
</body>

</html>