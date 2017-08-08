<%@page import="java.util.*"%>
<%@page import="DBConnection.*"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
            function change(obj)
            {
                var a=obj.name;
                a=a.substring(1);
                var b=obj.value;
                window.location.replace("update_cart_item_no.jsp?i_id="+a+"&quantity="+b+"&p_id=1");
            }
            function nxt()
            {   
                window.location.replace("place_order1.jsp");
            }
        </script>
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <%
            ArrayList al1=(ArrayList) session.getAttribute("cart");
          int ch=0;
          Connection con=null;
           Statement st=null;
           ResultSet rs=null;
           Statement st1=null;
           ResultSet rs1=null;
           int total_price=0;
           int new_price=0;
          try{
              con=new ConnectionProvider().setConnection();
               st=con.createStatement();
               st1=con.createStatement();
        %>
        
        <br><br><br>
        <form name="frm1">
            <center>
                <table width="840"  border="0">
                    <tr>
                        <th height="40" style="color: black; font-size: 16px"><u>SHOPPING CART</u></th>
                        <th  width="50"></th>
                    </tr>
                </table>
            </center>
            <br>
            <center>
                
        <div style="border:solid 1px #666666; color: #0066cc; width: 840px;">
        <table width="840" border="0">
            <tr>
                <th height="40"  width="300" style="color: #666666; font-size: 14px">Item Description</th>
                <th  width="210" style="color: #666666; font-size: 14px">Price</th>
                <th  width="100" style="color: #666666; font-size: 14px">Qty</th>
                <th width="160" style="color: #666666; font-size: 14px">SubTotal</th>
                <th  width="50"></th>
            </tr>
        </table>
        </div>
                <br>
        <table width="840" border="0">
            <%
            for(int i=0;i<al1.size();i++)
            {
               String i_id=al1.get(i).toString();
               rs=st.executeQuery("select * from item where i_id='"+i_id+"'");   
               rs.next(); 
               i=i+1;
               String qty=al1.get(i).toString();
               int qty1=Integer.parseInt(qty);
               
               if(rs.getInt(6)==0)
                 {
                   response.sendRedirect("delete_cart_item.jsp?i_id="+i_id+"&p_id=1");
                 }
               else if(qty1>rs.getInt(6))
                {
                 response.sendRedirect("update_cart_item_no.jsp?i_id="+i_id+"&quantity=1&p_id=1");
                }
              %>
            <tr>
                <th height="45" width="300" style=" font-size: 13px; color: #333333"><%=rs.getString(3)%></th>
                
                <% if(rs.getInt(14)==0) { %>
                <th width="210" style=" font-size: 13px; color: #333333"><%=rs.getString(10)%></th>
                <% }else {
                      new_price=rs.getInt(10)-(rs.getInt(10)*rs.getInt(14)/100);
                  %>
                  <th width="210" style=" font-size: 13px; color: #333333"><strike><%=rs.getString(10)%></strike> <%=new_price%></th>
                <% }%>
                
                <th width="100" style=" font-size: 13px; color: #333333">
                    <% if(rs.getInt(6)!=0)
                 { %>
                 <select name="d<%=i_id%>" onchange="change(this)">
                      <%
            for(int cnt=1;cnt<=rs.getInt(6);cnt++){
                      %>
                      <option value="<%=cnt%>"><%=cnt%></option>
                      <%
                      } %>
                    </select>
                    <script>;document.frm1.d<%=i_id%>.value="<%=qty%>";</script>
                    <% }else { %>
                 <h2>Out of Stock</h2>
                    <% }%>
                </th>
                <%
                int price=0;
                if(rs.getInt(14)==0) 
                {
                price=rs.getInt(10);
                price=price*qty1;
                }
                else
                {
                 price=new_price*qty1;   
                }
                total_price=total_price+price;
                %>  
                <th width="160" style=" font-size: 13px; color: #333333">
                  <%=price%>
                </th>
               <th width="50"><a href="delete_cart_item.jsp?i_id=<%=i_id%>&p_id=1"><img src="images/close.png" width="27" height="27"/></a></th>
            </tr>
            <% }}catch(Exception e){}
           finally
          {
           try
            {
             
             con.close();
            }catch(Exception e){}
          }            
            %>
        </table>
        
            </center>
             <br>
             <center>
                
                <% if(al1.size()==0) {%>
                <table width="840" border="0">
                <tr>
                    <th height="40" style="color: red; font-size: 15px">There are no items in this cart.</th>
                    <th  width="50"></th>
                </tr>
                </table>
                <% }else{ %>
                <div style="border:solid 1px #666666; color: #0066cc; width: 840px;">
                <table width="840" border="0">
                <tr>
                <td width="220" height="40" align="right" style="color: black; font-size: 15px">Amount Payable: Rs. </td>
                <td  width="200" align="left" style="color: black; font-size: 15px"><%=total_price%></td>
                <%session.setAttribute("total_price",total_price);%>
                </tr>
                </table>
                </div>
                <br>
                <table width="840" border="0">
                <tr>
                    <td height="40"></td>
                    <td width="167" align="right">
                    <% if(session.getAttribute("cus_id")!=null)%>    
                        <input name="btn1" type="button" style="width: 115px; height: 33px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" value="Place Order" onclick="nxt()"/>
                    
                    </td>
                </tr>
                </table>
                <% } %>
              </center>
        </form>
        
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
          <%@include file="signup.jsp"%>
    <%@include file="signin.jsp"%>
    <%@include file="footer.jsp"%>
        </div>
        
    </body>
</html>
