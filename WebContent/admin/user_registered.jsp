<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
         function snd()
         {
             var email=document.form1.srch.value;
             if(email=="")
                 alert("Enter Email Id");
             else
                  window.location.replace("search_user_registered.jsp?email="+email);
         }
        </script>
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
           int user_no=0;
     
           try{
        	   con=new ConnectionProvider().setConnection();
               st=con.createStatement();
               st1=con.createStatement();
               
               
               rs=st.executeQuery("select * from customer order by cus_id asc");
               rs1=st1.executeQuery("select * from customer");
               
               while(rs1.next())
                   user_no++;
               
        %>
        
        
        <div  align="center">
            <table width="900" height="40" border="0">
                <tr>
                <th><p style="color: red; font-size: 15px"><u><b>TOTAL NO OF REGISTERED USERS= <%=user_no%></b></u></p></th>
                </tr>
            </table>
            <form name="form1">
            <table width="900" height="40" border="0">
                <tr>
                    <td align="right">
                    <input type="text" placeholder="Enter Email ID" style="height: 25px; border:solid 1px #999999;"  size="35" name="srch">
                    <input type="button" value="Search" onclick="snd()" style="width: 60px; height: 28px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 12px">
                </td>
                </tr>
            </table>
            </form>    
        <table width="900" border="0">
  <tr>
    <th width="35" height="40" scope="col" style="border:solid 2px #dedede; color: #000000">User Id</th>
    <th width="100" scope="col" style="border:solid 2px #dedede; color: #000000">Email Id</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Send Mail</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Details</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Delete</th>
  </tr>
  
  <% while(rs.next())
                {
  %>
   <tr>
            <td height="37" align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(2)%></td>
            <td align="center"><a href="mail_1.jsp?cus_id=<%=rs.getString(1)%>">mail</a></td>
            <td align="center"><a href="user_registered_details.jsp?email=<%=rs.getString(2)%>">details</a></td>
            <td align="center"><a href="user_delete.jsp?email=<%=rs.getString(2)%>&id=1">delete</a></td>
   </tr>
  <% } } catch(Exception e){}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }  %>
        </table>
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
