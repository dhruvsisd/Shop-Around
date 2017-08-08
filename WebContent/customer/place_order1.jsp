<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
        function nxt()
            {
                window.location.replace("place_order2.jsp");
            }
        </script>
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <br><br><br>
        <center>
                <table width="840"  border="0">
                    <tr>
                        <th height="40" style="color: black; font-size: 16px"><u>Email Login</u></th>
                    </tr>
                </table>
        </center>
        <br>
        <center>
                <table border="0">
                    <tr>
                        <td height="40" style="color: #333333; font-size: 15px" width="120">Email Address:</td>
                        <td height="40" style="color: #333333; font-size: 15px"><%=email%></td>
                        
                    </tr>
                </table>
            
                <table border="0">
                    <tr>
                        <td height="40" style="color: #333333; font-size: 14px">Your Order Details will be sent to this email address.</td>
                    </tr>
                </table>
        </center>
                        <br>
        <center>
                <table width="840"  border="0">
                    <tr>
                        <th height="40"><input type="button" name="btn1" value="Continue" onclick="nxt()" style="width: 90px; height: 32px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></th>
                    </tr>
                </table>
        </center>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
