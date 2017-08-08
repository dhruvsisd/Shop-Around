<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
                function dlt(f_id)
                {
                    var r=confirm("Are you sure!");
                    if (r==true)
                      {
                        window.location.replace("delete_feedback.jsp?f_id="+f_id);
                      }
                }
           </script>  
    </head>
    <body onload="ld()">
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
           
           String s_value=request.getParameter("s_value");
           try{
        	   con=new ConnectionProvider().setConnection();               st=con.createStatement();
               st1=con.createStatement();
               
               if(s_value==null || s_value=="")
                rs=st.executeQuery("select * from feedback order by f_id asc");
               else if(s_value.equalsIgnoreCase("solved"))
                  {
                  String status="solved";
                  rs=st.executeQuery("select * from feedback where status='"+status+"' order by f_id asc");
                  }
               else if(s_value.equalsIgnoreCase("unsolved"))
                  {
                   String status="unsolved";
                   rs=st.executeQuery("select * from feedback where status='"+status+"' order by f_id asc");
                  }
               
               
        %>
        <script>
        function chng()
    {
        var s_value= document.frm.srch.value;
        
        window.location.replace("feedback.jsp?s_value="+s_value+"");
    }
    
    function ld()
    {
    document.frm.srch.value="<%=s_value%>";
    }
        </script>
        
        <div  align="center">
            <table width="900" height="40" border="0">
                <tr>
                <th><p style="color: red; font-size: 15px"><u><b>CUSTOMER FEEDBACK</b></u></p></th>
                </tr>
            </table>
            <form name="frm">
            <table border="0" align="right">
              <tr>
                  <td style=" height: 45px">
                      <div style=" width: 130px; height: 27px; border: solid 1px #999999;">
                          <select name="srch" STYLE="width: 120px; padding-top: 3px; padding-left: 10px; border: 0" onchange="chng()">
                              <option value="">All</option>  
                              <option value="solved">Solved</option>
                              <option value="unsolved">Unsolved</option>
                            </select>
                      </div>
                  </td>
              </tr>
          </table>
            </form>
            <br>
        <table width="960" border="0">
  <tr>
    <th width="30" height="40" scope="col" style="border:solid 2px #dedede; color: #000000">Sl No.</th>
    <th width="50" scope="col" style="border:solid 2px #dedede; color: #000000">Email Id</th>
    <th width="100" scope="col" style="border:solid 2px #dedede; color: #000000">Feedback</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Date</th>
    <th width="45" scope="col" style="border:solid 2px #dedede; color: #000000">Status</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Send Mail</th>
    <th width="35" scope="col" style="border:solid 2px #dedede; color: #000000">Delete</th>
  </tr>
  
  <% while(rs.next())
                {
      
  %>
   <tr>
            <td height="37" align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(3)%></td>
            <td align="center"><%=rs.getString(4)%></td>
            <td align="center"><%=rs.getString(5).substring(0, 10) %></td>
            <td align="center"><%=rs.getString(6)%></td>
            <td align="center"><a href="mail.jsp?f_id=<%=rs.getString(1)%>">mail</a></td>
            <td align="center"><a href="#" onclick="dlt(<%=rs.getString(1)%>)">delete</a></td>
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
                   %><script language="javascript">alert("Cant Delete");</script><%
                   session.removeAttribute("cant_del");
        }
              %>
        
    </body>
</html>
