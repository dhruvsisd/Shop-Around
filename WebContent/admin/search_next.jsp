<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
                function dlt(i_id,c_id)
                {
                    var v=1;
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
        <br><br><br><br>
        <div align="right"><a href="search.jsp">back to search</a>&nbsp;</div>
        <br>
        
        <div class="products">
          <div class="box1">
              
              <table width="960" height="82" border="0">
  <tr>
    <th width="35" height="70" scope="col" style="border:solid 2px #dedede; color: #000000">Item Id</th>
    <th width="99" scope="col" style="border:solid 2px #dedede; color: #000000">Name</th>
    <th width="71" scope="col" style="border:solid 2px #dedede; color: #000000">Category</th>
    <th width="71" scope="col" style="border:solid 2px #dedede; color: #000000">Brand</th>
    <th width="43" scope="col" style="border:solid 2px #dedede; color: #000000">Availability</th>
    <th width="43" scope="col" style="border:solid 2px #dedede; color: #000000">no of item sold</th>
    
    <th width="72" scope="col" style="border:solid 2px #dedede; color: #000000">Image Icon</th>
    <th width="73" scope="col" style="border:solid 2px #dedede; color: #000000">Purchased Price</th>
    <th width="60" scope="col" style="border:solid 2px #dedede; color: #000000">Selling Price</th>
    <th width="62" scope="col" style="border:solid 2px #dedede; color: #000000">Date</th>
    <th width="32" scope="col" style="border:solid 2px #dedede; color: #000000">More Details</th>
    <th width="32" scope="col" style="border:solid 2px #dedede; color: #000000">edit</th>
    <th width="45" scope="col" style="border:solid 2px #dedede; color: #000000">Delete</th>
  </tr>
  
  <%
                      Connection con=null;
                    try{
                    	con=new ConnectionProvider().setConnection();    Statement st= con.createStatement();
                        Statement st1= con.createStatement();
                        ResultSet rs=null;
                        ResultSet rs1=null;
                        String str3="";
                        String str1=request.getParameter("drop1");
                        String str2=request.getParameter("drop2");
                        rs= st.executeQuery("select * from item where "+str1+"='"+str2+"'");  
                        
                        while(rs.next())
                        {
  
  %>
  
          <tr>
            <td height="67" align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(3)%></td>
            
            <%rs1= st1.executeQuery("select * from category");  
            while(rs1.next())
                {
               if(rs.getString(4).equals(rs1.getString(1)))
                                     {
                   str3= rs1.getString(2);
                   break;
               }}%>
            <td align="center"><%=str3%></td>
  
            
            <td align="center"><%=rs.getString(5)%></td>
            <td align="center"><%=rs.getString(6)%></td>
            <td align="center"><%=rs.getString(7)%></td>
            
            <td align="center"><%=rs.getString(8)%></td>
            <td align="center"><%=rs.getString(9)%></td>
            <td align="center"><%=rs.getString(10)%></td>
            <td align="center"><%=rs.getString(11).substring(0, 10) %></td>
            <td align="center"><a href="item_details.jsp?i_id=<%=rs.getString(1)%>&cat=<%=str3%>">details</a></td>
            <td align="center"><a href="edit_item1.jsp?i_id=<%=rs.getString(1)%>&cat=<%=str3%>">edit</a></td>
            <td align="center"><a href="#" onclick="dlt(<%=rs.getString(1)%>,<%=rs.getString(4)%>)"><img src="images/close.png" width="27" height="27"/></a></td>
          </tr>
          <%}}catch(Exception e){}
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
