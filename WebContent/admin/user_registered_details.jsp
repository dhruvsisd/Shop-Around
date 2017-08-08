<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% String email_id=request.getParameter("email"); %>
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br>
        
        <%
        
        Connection con=null;
           Statement st=null;
           ResultSet rs=null;
           
     
           try{
        	   con=new ConnectionProvider().setConnection();
               st=con.createStatement();
             
               rs=st.executeQuery("select * from customer where EMAIL_ID='"+email_id+"'");
               rs.next();
               String name="";
               String ph_no="";
               String street_addr="";
               String city="";
               String state="";
               String pincode="";
               if(rs.getString(4)!=null)
                   name=rs.getString(4);
               if(rs.getString(5)!=null)
                   ph_no=rs.getString(5);
               if(rs.getString(6)!=null)
                   street_addr=rs.getString(6);
               if(rs.getString(7)!=null)
                   city=rs.getString(7);
               if(rs.getString(8)!=null)
                   state=rs.getString(8);
               if(rs.getString(9)!=null)
                   pincode=rs.getString(9);
               
          %>
        
        
        <div  align="center">
            <table width="900" height="40" border="0">
                <tr>
                <th>
                    <p style="color: red; font-size: 15px"><u><b>DETAILS OF "<%=email_id%>"</b></u></p>
                </th>
            </tr>
            </table>
            <form name="form1">
            <table width="900" height="40" border="0">
                <tr>
                <td align="right">
                <a href="user_registered.jsp">view all</a>        
                </td>
                </tr>
            </table>
            </form>    
                
                <table width="450" border="0" style="float: left; margin-left: 30px;">
  <tr>
      <th width="50" height="40" scope="col" align="right" style="color: #666666; font-size: 15px">User Id :</th>
      <th width="30"></th>
      <th width="40" scope="col" align="left" style="color: #666666; font-size: 13px"><%=rs.getString(1) %></th>
  </tr>
  <tr>
      <th height="40" scope="col" align="right" style="color: #666666; font-size: 15px">Email Id :</th>
      <th ></th>
      <th scope="col" align="left" style="color: #666666; font-size: 13px"><%=rs.getString(2) %></th>
  </tr>
  <tr>
      <th height="40" scope="col" align="right" style="color: #666666; font-size: 15px">Name :</th>
      <th ></th>
      <th scope="col" align="left" style="color: #666666; font-size: 13px"><%=name%></th>
  </tr>
  <tr>
      <th height="40" scope="col" align="right" style="color: #666666; font-size: 15px">Phone No :</th>
      <th ></th>
      <th scope="col" align="left" style="color: #666666; font-size: 13px"><%=ph_no%></th>
  </tr>
                </table>
                
  <table width="450" border="0" style="margin-right: 30px;">
  <tr>
      <th width="50" height="40" scope="col" align="right" style="color: #666666; font-size: 15px">Street Address :</th>
      <th width="20"></th>
      <th width="40" scope="col" align="left" style="color: #666666; font-size: 13px"><%=street_addr%></th>
  </tr>
  <tr>
      <th height="40" scope="col" align="right" style="color: #666666; font-size: 15px">City :</th>
      <th ></th>
      <th scope="col" align="left" style="color: #666666; font-size: 13px"><%=city%></th>
  </tr>
  <tr>
      <th height="40" scope="col" align="right" style="color: #666666; font-size: 15px">State :</th>
      <th ></th>
      <th scope="col" align="left" style="color: #666666; font-size: 13px"><%=state%></th>
  </tr>
  <tr>
      <th height="40" scope="col" align="right" style="color: #666666; font-size: 15px">Pin Code :</th>
      <th ></th>
      <th scope="col" align="left" style="color: #666666; font-size: 13px"><%=pincode%></th>
  </tr>
 
  </div>
  <% } catch(Exception e){}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }  %>
        </table>
        
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
        
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
