<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JS_Fn test.aspx.cs" Inherits="ASP_Begin.JS_Fn_test" %>

<!DOCTYPE html>
<html>
<head>
<script>
    function myFunction() {
        var a, b;
        a = document.getElementById("demo").innerHTML;
        b = document.getElementById("demo2").innerHTML;
        document.getElementById("demo").innerHTML = b;
        document.getElementById("demo2").innerHTML = a;
    }
    </script>
    <script>
    function Alert()
    {
        
        window.alert(document.getElementById("TextBox1").value);
    }
</script>
    <script>
       
        function CheckNumWithDecimal(eventRef) {
            //take charecter code
            var carCode = eventRef.keyCode ? eventRef.keyCode : ((eventRef.charCode) ? eventRef.charCode : eventRef.which);

            //if carcode not for back space,tab,#,$,%,',.,and not between  0-9 then cancel event
            //(carCode != 35)&&(carCode != 36)(carCode != 37)&&&&(carCode != 39)&&(carCode != 9)
            if ((carCode != 8) && (carCode != 46) && (carCode < 48) || (carCode > 57)) {
                eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
            }

            //take target text box to oTextbox
            var oTextbox = document.getElementById((eventRef.target || eventRef.srcElement).id);

            //taking index of . in text
            var indexval = oTextbox.value.indexOf(".");

            //take charecter kyepressed position to leni

            var leni = GetCursorLocation(oTextbox);
            //handle the case of .
            if (carCode == 46) {
                //if . already exists then cancel the second keypress of .
                if (indexval != -1) {
                    eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                }
                else {
                    if (oTextbox.value == "") {
                        oTextbox.value = "0";
                        ventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                    }
                }
            }

            //if key press cherecter in between 0 and 9 then 
            if ((carCode > 47) && (carCode < 58)) {
                //if text in text box does not contain . then limit cheking using maximum length
                if (indexval == -1) {
                    if (oTextbox.value.length >= 9) {

                        eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                    }
                }
                else {

                    //if text box contain . and current keypress position lessthan or equal to position of . then compare for if lenth of text before . ia alredy >=15 then cancel current action
                    if (leni <= (indexval + 1)) {
                        if ((indexval) >= 15) {
                            eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                        }
                    }
                        //else if digit numbers after . alredy 2 or more cancel current action
                    else if ((oTextbox.value.length - indexval - 1) >= 3) {
                        eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                    }
                }
            }
        }
    
    </script>
    <script>
        function GetCursorLocation(CurrentTextBox) {
            var CurrentSelection, FullRange, SelectedRange, LocationIndex = -1;
            if (typeof CurrentTextBox.selectionStart == "number") {
                LocationIndex = CurrentTextBox.selectionStart;
            }
            else if (document.selection && CurrentTextBox.createTextRange) {
                CurrentSelection = document.selection;
                if (CurrentSelection) {
                    SelectedRange = CurrentSelection.createRange();
                    FullRange = CurrentTextBox.createTextRange();
                    FullRange.setEndPoint("EndToStart", SelectedRange);
                    LocationIndex = FullRange.text.length;
                }
            }
            return LocationIndex;
        }
    </script>
</head>

<body>
    <form runat="server">
<h1>A Web Page</h1>
<p id="demo">Paragraph A</p>
    <p id="demo2">Paragraph B</p>

    <asp:TextBox ID="TextBox1" runat="server" onkeyup="Alert()"></asp:TextBox>

        
        Enter a Number <asp:TextBox ID="TextBox2" runat="server" onKeyPress="CheckNumWithDecimal(event);" 
            onfocus="javascript: if(this.value == '0.00' || this.value == '0'){ this.value = ''; }" onblur="javascript: if(this.value==''){this.value='0.00';}"></asp:TextBox>
<button type="button" onclick="myFunction()" >Try it</button>
    <button type="button" onclick="Alert()">Try it</button>
    </form>
</body>
</html>
