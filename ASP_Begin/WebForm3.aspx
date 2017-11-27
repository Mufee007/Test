<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="ASP_Begin.WebForm3" %>

<html>
<head>
<title></title>
 <style type='text/css'> body { margin:0; padding:0;}.boldtable, .boldtable TH{font-family:Tahoma;font-size:10pt;color:white;background-color:#8DB4E2;}.boldtable TD{font-family:Tahoma;font-size:10pt;color:black;background-color:white;}</style></head>
    <body>
        <table border=1 bordercolor=#000 cellpadding=4 cellspacing=0 style="border-collapse:collapse; width:100%" class='boldtable'><tr height='50pt'>
            <th colspan=4 style ="border:none;"><b>Department : </b></th>  <th colspan=4 style="border:none;"><b>Section : </b></th>                 
            </tr>
            <tr>
            <th colspan=4 style ="border:none;"></th>  <th colspan=4 style="border:none;"><b>report Period : </b></th>   </tr>
             </table>
         <table border=1 bordercolor=#000 cellpadding=4 cellspacing=0 style="border-collapse:collapse; width:100%" class='boldtable'><tr height='50pt'>
             <tr>
            <th colspan=17 style ="border:none; text-align:left">Date :</th></tr>
            <tr height='20pt'>
            <th>Emp No</th><th>Emloyee Name</th><th>Shift Code</th>
            <th>Shift Start</th><th>Shift End</th><th>Punch In</th>
            <th>Punch Out</th><th>Total Hrs</th>
                <th>IN Status</th><th>Late IN</th>
                <th>OUT Status</th><th>Early OUT</th>
                <th>Early IN</th><th>Late OUT</th>
                <th>OUT Hrs</th><th>Missed Punch</th><th>Remarks</th>
            </tr>

             <tr>            
            <tr height='20pt'>
            <td>1</td><td>Akhil</td><td>01</td>
            <td>09:00</td><td>18:00</td><td>09:05</td>
            <td>18:10</td><td>09:05</td>
                <td>LateN</td><td>00:05</td>
                <td>Late</td><td>No</td>
                <td>No</td><td>Yes</td>
                <td>00:01</td><td>0</td><td>Nil</td>
            </tr>
            </table>
<b><FONT face="Tahoma" color=red size=1"><br>NOTE: <br>* This is Terminal statistic report.<br><br></b>
</body>
</html>