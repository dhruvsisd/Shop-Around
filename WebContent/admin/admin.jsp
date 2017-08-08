<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
                function dlt(i_id,c_id)
                {
                    var v=3;
                    var r=confirm("Are you sure!");
                    if (r==true)
                      {
                        window.location.replace("delete_item.jsp?i_id="+i_id+"&c_id="+c_id+"&p_id="+v+"");
                      }
                }
           </script>  
    </head>
    <body>
        <div class="shell">
            <div style="min-height: 600px">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br><br>
        
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
        	   con=new ConnectionProvider().setConnection();
               st=con.createStatement();
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
               rs4=st4.executeQuery("select * from item where AVAILIBILITY='0' order by i_id");
               rs5=st5.executeQuery("select * from item where AVAILIBILITY='0' order by i_id");
               int cnt1=0;
               while(rs5.next())
                   cnt1++;
        %>
        
         
        <div  align="center">
            <table width="500" height="35" border="0">
                <tr>
                <th><p style="color: red; font-size: 15px"><u><b>ITEMS OUT OF STOCK= <%=cnt1%></b></u></p></th>
            </tr>
            </table>
        
        <table width="960" border="0">
  <% if(cnt1!=0){ %>
  <tr>
    <th width="35" height="60" scope="col" style="border:solid 2px #dedede; color: #000000">Item Id</th>
    <th width="80" scope="col" style="border:solid 2px #dedede; color: #000000">Name</th>
    <th width="71" scope="col" style="border:solid 2px #dedede; color: #000000">Category</th>
    <th width="71" scope="col" style="border:solid 2px #dedede; color: #000000">Brand</th>
    <th width="73" scope="col" style="border:solid 2px #dedede; color: #000000">Purchased Price</th>
    <th width="60" scope="col" style="border:solid 2px #dedede; color: #000000">Selling Price</th>
    <th width="62" scope="col" style="border:solid 2px #dedede; color: #000000">Last Updated Date</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Details</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Update</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Delete</th>
  </tr>
  <% } while(rs4.next()){
     rs6=st6.executeQuery("select c_name from category where c_id='"+rs4.getString(4)+"'");
     rs6.next();
    %>
          <tr>
              <td height="67" align="center"><%=rs4.getString(1)%></td>
            <td align="center"><%=rs4.getString(3)%></td>
            <td align="center"><%=rs6.getString(1)%></td>
            <td align="center"><%=rs4.getString(5)%></td>
            <td align="center"><%=rs4.getString(9)%></td>
            <td align="center"><%=rs4.getString(10)%></td>
            <td align="center"><%=rs4.getString(11).substring(0, 10)%></td>
            <td align="center"><a href="item_details.jsp?i_id=<%=rs4.getString(1)%>&cat=<%=rs6.getString(1)%>">details</a></td>
            <td align="center"><a href="edit_item1.jsp?i_id=<%=rs4.getString(1)%>&cat=<%=rs6.getString(1)%>">update</a></td>
            <td align="center"><a href="#" onclick="dlt(<%=rs4.getString(1)%>,<%=rs4.getString(4)%>)"><img src="images/close.png" width="27" height="27"/></a></td>
          </tr>
     <% } %>
        </table>
       </div>
        
        <br>
        <div  align="center">
            <table width="500" height="35" border="0">
                <tr>
                <th><p style="color: red; font-size: 15px"><u><b>NO OF ORDERS (PENDING)= <%=cnt%></b></u></p></th>
            </tr>
            </table>
            
        <table width="600" border="0">
          <% if(cnt!=0){ %>
          <tr>
              <th width="80" height="40" scope="col" style="border:solid 2px #dedede; color: #000000;">Date</th>
            <th width="100" scope="col" style="border:solid 2px #dedede; color: #000000;">No of Orders</th>
          </tr>
          <% }
               rs1=st1.executeQuery("select count(*),o_date from order_item where status='"+pending+"' group by o_date");
               while(rs1.next())
               {     
               %>   
          <tr>
            <td height="37" align="center"><%=rs1.getString(2).substring(0, 10)%></td>
            <td align="center"><%=rs1.getString(1)%></td>
          </tr>
                <% 
              } 
                %>
        </table>
        </div>
        
        <%} catch(Exception e){}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }   
               %>     
  
</table>
        
    </div>
        <%@include file="footer.jsp"%>
        </div>
        
        <%
if(session.getAttribute("cant_del")=="cant_del")
        {
                   %><script language="javascript">alert("cant delete, item is in the order table");</script><%
                   session.removeAttribute("cant_del");
        }
        %>
        
    </body>
</html>
