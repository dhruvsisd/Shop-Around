<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="shell">
            <div style="min-height: 600px">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br>
        
        <%
        Connection con=null;
           Statement st=null;
           ResultSet rs=null;
           Statement st1=null;
           ResultSet rs1=null;
           Statement st2=null;
           ResultSet rs2=null;
           Statement st3=null;
           ResultSet rs3=null;
           
           Statement st4=null;
           ResultSet rs4=null;
           Statement st5=null;
           ResultSet rs5=null;
           Statement st6=null;
           ResultSet rs6=null;
           
           try{
        	   con=new ConnectionProvider().setConnection(); st=con.createStatement();
               st1=con.createStatement();
               st2=con.createStatement();
               st3=con.createStatement();
               st4=con.createStatement();
               st5=con.createStatement();
               st6=con.createStatement();
               
               String pending="pending"; 
               rs=st.executeQuery("select * from order_item where status='"+pending+"' order by o_id asc");
               rs3=st3.executeQuery("select * from order_item where status='"+pending+"' order by o_id asc");
               int cnt=0;
               while(rs3.next())
                   cnt++;
        %>
        
        
        
        <center><p style="color: red; font-size: 15px"><u><b>PENDING ORDERS= <%=cnt%></b></u></p></center>
        <br>
        
        <div class="products">
          <div class="box1">
              <table width="960" border="0">
                  <tr>
    <th width="35" height="65" scope="col" style="border:solid 2px #dedede; color: #000000">Order No</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Date</th>
    <th width="40" scope="col" style="border:solid 2px #dedede; color: #000000">Shipping Pincode</th>
    <th width="100" scope="col" style="border:solid 2px #dedede; color: #000000">Item Name</th>
    <th width="60" scope="col" style="border:solid 2px #dedede; color: #000000">Category</th>
    <th width="62" scope="col" style="border:solid 2px #dedede; color: #000000">Brand</th>
    <th width="15" scope="col" style="border:solid 2px #dedede; color: #000000">Quantity</th>
    <th width="60" scope="col" style="border:solid 2px #dedede; color: #000000">Sub Total</th>
    <th width="60" scope="col" style="border:solid 2px #dedede; color: #000000">Grand Total</th>
    <th width="20" scope="col" style="border:solid 2px #dedede; color: #000000">Dispatch</th>
    
  </tr>
  
  <%
               while(rs.next())
               {     
                 int rc=0;
                 rs1=st1.executeQuery("select SHIPPING_PINCODE,total_price from cart1 where cart_id='"+rs.getString(2)+"'");
                 rs1.next();
                 rs2=st2.executeQuery("select i_name,c_id,brand_name,quantity,price from item,cart_item1 where item.i_id=cart_item1.i_id and cart_item1.cart_id='"+rs.getString(2)+"'");     
                 while(rs2.next()){
                     rs4=st4.executeQuery("select c_name from category where c_id='"+rs2.getString(2)+"'");
                     rs4.next();
                     String category=rs4.getString(1);
                 if(rc==0){
               %>   
          <tr>
            <td height="30" align="center">ORD0<%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(3).substring(0, 10) %></td>
            <td align="center"><%=rs1.getString(1)%></td>
            <td align="center"><%=rs2.getString(1)%></td>
            <td align="center"><%=category%></td>
            <td align="center"><%=rs2.getString(3)%></td>
            <td align="center"><%=rs2.getString(4)%></td>
            <td align="center"><%=rs2.getString(5)%></td>
            <td align="center"><%=rs1.getString(2) %></td>
            <td align="center"><a href="place_order.jsp?o_id=<%=rs.getString(1)%>">Dispatch</a></td>
          </tr>
              <% } 
                   else if(rc>0)
                   {
                    %>     
             <tr>
            <td height="30" align="center"></td>
            <td align="center"></td>
            <td align="center"></td>
            <td align="center"><%=rs2.getString(1)%></td>
            <td align="center"><%=category%></td>
            <td align="center"><%=rs2.getString(3)%></td>
            <td align="center"><%=rs2.getString(4)%></td>
            <td align="center"><%=rs2.getString(5)%></td>
            <td align="center"></td>
            <td align="center"></td>
          </tr>
                <% }
                       rc++; }
              } 
               } catch(Exception e){}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }   
                %>
          
  </table>
                  </div>          
              </div>
        
        </div>
                <%@include file="footer.jsp"%>
        </div>
                
    </body>
</html>
