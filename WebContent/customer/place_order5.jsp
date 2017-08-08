<%@page import="mypack.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<script type="text/javascript">
    function noBack(){window.history.forward()}
    noBack();
    window.onpageshow=function(evt){if(evt.persisted)noBack()}
    window.onunload=function(){void(0)}
</script>
<!DOCTYPE html>
<html>
    <head>
        <%
        
        		               
                String price=request.getParameter("price");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
            function cod()
            {
                window.location.replace("place_order4.jsp?price="+<%=price%>+"");
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
                        <th height="40" style="color: black; font-size: 16px"><u>CHOOSE YOUR MODE OF PAYMENT</u></th>
                        <th  width="50"></th>
                    </tr>
                </table>
            </center>
        <br>
        <div style="border:solid 1px #666666; color: #0066cc; width: 250px; height: 200px; float: left; margin-left: 80px; margin-top: 30px">
        <table border="0" style=" margin-left: 22px; margin-top: 20px">
            <tr>
                <td height="70"><button style="width: 200px; height: 50px; background-color: #990000; color: white;" onclick="cod()">Cash on Delivery</button></td>
            </tr>
            
            <tr>
                <td height="70"><button style="width: 200px; height: 50px; background-color: #666666; color: white" disabled="true">Debit Card</button></td>
            </tr>
        </table>
        </div>
        <form name="frm" action="../place_order4" method="post">
            <input type="hidden" name="pay_mode" value="debit_card">
        <table width="450" border="0" style=" margin-left: 400px; margin-top: 30px">
            <tr>
                <td height="60" style="color: #333333; font-size: 15px"><u>Pay using Debit Card</u></td>
            </tr>
            <tr>
                <td height="40" style="color: #333333; font-size: 15px"><u>Enter your card details-</u></td>
                <td></td>
            </tr>
            <tr>
                <td height="40" style="color: #333333; font-size: 14px">Select your Card *</td>
                <td>
                    <div style=" width: 150px; height: 30px; border: solid 1px #999999;">
                      
                          <select name="card_type" STYLE="width: 140px; padding-top: 3px; padding-left: 10px; border: 0">
                              <option value="">Select</option>  
                              <option value="">SBI debit card</option>
                              <option value="">UBI debit card</option>
                            </select>
                      </div>
                </td>
            </tr>
            <tr>
                <td height="40" style="color: #333333; font-size: 14px">Card Number *</td>
                <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="35" name="pincode" tabindex="1" required></td>
            </tr>
            <tr>
                <td height="40" style="color: #333333; font-size: 14px">Name on Card</td>
                <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="35" name="pincode" tabindex="2"></td>
            </tr>
            <tr>
                <td height="40" style="color: #333333; font-size: 15px">CVV Number</td>
                <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="35" name="pincode" tabindex="3"></td>
            </tr>
            
            <tr>
                <td height="70"></td>
                <td height="70" ><input type="submit" name="btn1" value="Place Order" style="width: 115px; height: 33px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
            </tr>
        </table>
        </form>
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
