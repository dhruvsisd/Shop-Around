<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
                function dlt(c_id)
                {
                    var v=2;
                    var r=confirm("Are you sure!");
                    if (r==true)
                      {
                        window.location.replace("delete_category.jsp?c_id="+c_id+"");
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
        <div align="center"><p style="color: red; font-size: 15px"><u><b>ALL CATEGORY</b></u></p></div>
        <br>
        
          <div class="products">
          <div class="box1">
              <center>
              <table width="800" height="82" border="0">
  <tr>
    <th width="30" height="60" scope="col" style="border:solid 2px #dedede; color: #000000">Category Id</th>
    <th width="99" scope="col" style="border:solid 2px #dedede; color: #000000">Category Name</th>
    <th width="71" scope="col" style="border:solid 2px #dedede; color: #000000">No of Items</th>
    <th width="32" scope="col" style="border:solid 2px #dedede; color: #000000">More Details</th>
    <th width="32" scope="col" style="border:solid 2px #dedede; color: #000000">edit</th>
    <th width="45" scope="col" style="border:solid 2px #dedede; color: #000000">Delete</th>
  </tr>
  <%
                      Connection con=null;
                    try{
                    	con=new ConnectionProvider().setConnection();
                        Statement st= con.createStatement();
                        Statement st1= con.createStatement();
                        ResultSet rs=null;
                        ResultSet rs1=null;
                        String str3="";
                        
                        rs= st.executeQuery("select * from category order by c_id");  
                        
                        while(rs.next())
                        {
  
  %>
  
          <tr>
            <td height="50" align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(2)%></td>
            
            <% 
            int rowCount=0;
            try{
            rs1= st1.executeQuery("select * from item where c_id='"+rs.getString(1)+"'"); 
            while(rs1.next())
             rowCount++;
            }catch(Exception e){}            
            %>
            <td align="center"><%=rowCount%></td>
            <td align="center"><a href="category_details.jsp?c_id=<%=rs.getString(1)%>&name=<%=rs.getString(2)%>&no=<%=rowCount%>">details</a></td>
            <td align="center"><a href="edit_category.jsp?c_id=<%=rs.getString(1)%>&name=<%=rs.getString(2)%>">edit</a></td>
            <td align="center"><a href="#" onclick="dlt(<%=rs.getString(1)%>)"><img src="images/close.png" width="27" height="27"/></a></td>
          </tr>
          <%}}catch(Exception e1){}finally{try{con.close();}catch(Exception e2){}}%>
          
      </table>
              </center>
                  </div>          
              </div>
            </div>
        <%@include file="footer.jsp"%>
        </div>
        
        <%
if(session.getAttribute("cant_del")=="cant_del")
        {
                   %><script language="javascript">alert("cant delete, category is in the order table");</script><%
                   session.removeAttribute("cant_del");
        }
        %>
        
    </body>
</html>
