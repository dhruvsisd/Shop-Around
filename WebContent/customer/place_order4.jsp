<%@page contentType="text/html" pageEncoding="UTF-8" import="DBConnection.*"%>
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
           int total_price=Integer.parseInt(price);
           String cart_id1=session.getAttribute("last_cart_id").toString();
           int cart_id=Integer.parseInt(cart_id1);
           Connection con=null;
        
        try{
           con=new ConnectionProvider().setConnection();
            PreparedStatement ps=con.prepareStatement("update cart1 set TOTAL_PRICE='"+total_price+"' where cart_id='"+cart_id+"'");
            ps.executeUpdate();
            }catch(Exception se){}
          finally
          {
           try
            {
             con.close();
            }catch(Exception e){}
          }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
            function dcard()
            {
                window.location.replace("place_order5.jsp?price="+<%=price%>+"");
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
                <td height="70"><button style="width: 200px; height: 50px; background-color: #666666; color: white;" disabled="true">Cash on Delivery</button></td>
            </tr>
            
            <tr>
                <td height="70"><button style="width: 200px; height: 50px; background-color: #990000; color: white" onclick="dcard()">Debit Card</button></td>
            </tr>
        </table>
        </div>
        
        <form name="frm" action="../place_order4" method="post">
            <input type="hidden" name="total_price" value="<%=total_price%>">
            <input type="hidden" name="pay_mode" value="cash_on_delivery">
        <table width="350" border="0" style=" margin-left: 430px; margin-top: 30px">
            <tr>
                <td height="60" style="color: #333333; font-size: 15px"><u>Pay using Cash-on-Delivery</u></td>
            </tr>
            <tr>
                <td height="60" style="color: #333333; font-size: 15px">Amount Payable on Delivery: Rs. <%=price%></td>
            </tr>
            <tr>
                <td height="70" align="center"><input type="submit" name="btn1" value="Place Order" style="width: 115px; height: 33px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
            </tr>
        </table>
        </form>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
            <%
if(session.getAttribute("mail_fail")=="mail_fail")
        {
                   %><script language="javascript">alert("Internet access failed....");</script><%
                   session.removeAttribute("mail_fail");
        }
        %>
    </body>
</html>
