<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% 
        String email_id=request.getParameter("email"); 
        %>
    </head>
    <body>
        <div class="shell">
            <div style="min-height: 600px">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br>
        
         <div  align="center">
            <table width="900" height="40" border="0">
                <tr>
                <th>
                <p style="color: red; font-size: 15px"><u><b>RESULT FOR "<%=email_id%>"</b></u></p>
             </th>
            </tr>
            </table>
       
            <table width="900" height="40" border="0">
                <tr>
                <td align="right">
                    <a href="user_registered.jsp">view all</a>    
                </td>
                </tr>
            </table>
        
            <table width="900" border="0">
  <tr>
    <th width="35" height="40" scope="col" style="border:solid 2px #dedede; color: #000000">User Id</th>
    <th width="100" scope="col" style="border:solid 2px #dedede; color: #000000">Email Id</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Mail</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Details</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Delete</th>
  </tr>      
             
  <%
        
        Connection con=null;
           Statement st=null;
           ResultSet rs=null;
           
     int res=0;
           try{
        	   con=new ConnectionProvider().setConnection();  st=con.createStatement();
             
               rs=st.executeQuery("select * from customer where EMAIL_ID like '%"+email_id+"%'");
               if(rs.next()==false)
                {
                   res=1;
           } else{
             
              do{              
        %>
        
   <tr>
            <td height="37" align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(2)%></td>
            <td align="center"><a href="">mail</a></td>
            <td align="center"><a href="user_registered_details.jsp?email=<%=rs.getString(2)%>">details</a></td>
            <td align="center"><a href="user_delete.jsp?email=<%=rs.getString(2)%>&id=2&email_id=<%=email_id%>">delete</a></td>
   </tr>
  <% }while(rs.next()); } } catch(Exception e){}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }  %>
        </table>
        <% if(res==1){ %>
        <table width="900" height="60" border="0">
            <tr>
                <td style=" font-size: 15px; color: black" align="center">0 result found</td>
            </tr>
        </table>
        <% } %>
        </div>
        
            </div>
        <%@include file="footer.jsp"%>
        </div>
        <%
if(session.getAttribute("cant_del")=="cant_del")
        {
                   %><script language="javascript">alert("Cant delete the user");</script><%
                   session.removeAttribute("cant_del");
        }
      %>
    </body>
</html>
