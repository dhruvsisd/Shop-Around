<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.*" %>
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
                window.location.replace("update_cart_item_no.jsp?ci_id="+a+"&quantity="+b+"&p_id=1");
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
           String last_cart_id1=(String)session.getAttribute("last_cart_id").toString();
           int last_cart_id=Integer.parseInt(last_cart_id1);
           Connection con=null;
           Statement st=null;
           ResultSet rs=null;
           Statement st1=null;
           ResultSet rs1=null;
           Statement st2=null;
           ResultSet rs2=null;
           Statement st3=null;
           ResultSet rs3=null;
           int price=0;
           int new_price=0;
           try{
              con=new ConnectionProvider().setConnection();
               st=con.createStatement();
               st1=con.createStatement();
               st2=con.createStatement();
               st3=con.createStatement();
               rs=st.executeQuery("select i_id,quantity,ci_id from cart_item1 where cart_id='"+last_cart_id+"'");                 
               
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
                <th height="40" width="300" style="color: #666666; font-size: 14px">Item Description</th>
                <th width="210" style="color: #666666; font-size: 14px">Price</th>
                <th width="100" style="color: #666666; font-size: 14px">Qty</th>
                <th width="160" style="color: #666666; font-size: 14px">SubTotal</th>
                <th  width="50"></th>
            </tr>
        </table>
        </div>
         <br>
        <table width="840" border="0">
            <%
            PreparedStatement ps=null;
            PreparedStatement ps1=null;
           int i;
            while(rs.next()){
             i=Integer.parseInt(rs.getString(2));
             int j=rs.getInt(3);
             rs1=st1.executeQuery("select AVAILIBILITY,selling_price from item where i_id='"+rs.getString(1)+"'");   
             rs1.next();
             
             int ex=0;
             if(rs1.getInt(1)==0)
                 {
                 ps1=con.prepareStatement("delete from cart_item1 where ci_id='"+j+"'");
                 ps1.executeUpdate();
                 ex=1;
                }
             else if(rs.getInt(2)>rs1.getInt(1))
                {
                 ps=con.prepareStatement("update cart_item1 set quantity='1',price='"+rs1.getInt(2) +"' where ci_id='"+j+"'");
                 ps.executeUpdate();
                }
            
            if(ex==0){             
             rs2=st2.executeQuery("select i_name,AVAILIBILITY,selling_price,discount from item where i_id='"+rs.getString(1)+"'");   
             rs2.next();
             rs3=st3.executeQuery("select price from cart_item1 where ci_id='"+j+"'");                 
             rs3.next();
            %>
            
            <tr>
                <th height="45" width="300" style=" font-size: 13px; color: #333333"><%=rs2.getString(1)%></th>
              
                <% if(rs2.getInt(4)==0) { %>
                <th width="210" style=" font-size: 13px; color: #333333"><%=(rs2.getInt(3))%></th>
                <% }else {
                      new_price=rs2.getInt(3)-(rs2.getInt(3)*rs2.getInt(4)/100);
                  %>
                  <th width="210" style=" font-size: 13px; color: #333333"><strike><%=rs2.getString(3)%></strike> <%=new_price%></th>
                <% }%>
                
                <th width="100" style=" font-size: 13px; color: #333333">
                    <% if(rs2.getInt(2)!=0)
                 { %>
                    <select name="d<%=j%>" onchange="change(this)">
                      <%
            for(int cnt=1;cnt<=rs2.getInt(2);cnt++){
                      %>
                      <option value="<%=cnt%>"><%=cnt%></option>
                      <%
                      } %>
                    </select>
                    <script>;document.frm1.d<%=j%>.value="<%=i%>";</script>
                    <% }else { %>
                 <h2>Out of Stock</h2>
                    <% }%>
                </th>
                
                <th width="160" style=" font-size: 13px; color: #333333">
                    
                    <%=rs3.getInt(1)%>
                    
                 </th>
               <th width="50"><a href="delete_cart_item.jsp?ci_id=<%=j%>&p_id=1"><img src="images/close.png" width="27" height="27"/></a></th>
            </tr>
            
            <%
            price=price+rs3.getInt(1);
            }}
            }catch(Exception e){}   
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
                <% if(price==0){%>    
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
                <td  width="200" align="left" style="color: black; font-size: 15px"><%=price%></td>
                                </tr>
                </table>
                </div>
                <br>
                <table width="840" border="0">
                <tr>
                    <td height="40"></td>
                    <td width="167" align="right">
                        <input name="btn1" type="button" style="width: 115px; height: 33px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" value="Place Order" onclick="nxt()"/>
                    </td>
                </tr>
                </table>
                <% } %>
              </center>
        </form>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
