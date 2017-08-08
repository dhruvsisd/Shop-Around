<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <script>
    function nxt()
    {
        var email=document.frm.email.value;
        var subject=document.frm.subject.value;
        var body=document.frm.body.value;
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        if(email=="")
            alert("Enter Email");
        else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) 
            alert("Not a valid Email");
        else if(subject=="")
            alert("Enter Subject");
        else if(body=="")
            alert("Enter Body");
        else
            document.frm.submit();
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
           
          String cus_id=request.getParameter("cus_id");
          String email_id="";
           try{
        	   con=new ConnectionProvider().setConnection();
               st=con.createStatement();
          
               rs=st.executeQuery("select * from customer where cus_id='"+cus_id+"'");
               rs.next();
               email_id=rs.getString(2);
               } catch(Exception e){}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }
               
        %>
        
        
  <div align="center">
          <table width="850" border="0" >
            <tr>
                <td height="60" scope="col" style=" color: #000000; font-size: 17px">
                    <b>Send Mail</b>
                </td>    
            </tr>
          </table>
  
          
      <br>
      <div style="border:solid 1px #999999; width: 650px; height: 310px; margin-right: 190px">
          <form name="frm" action="../send_mail" method="post">
              <input type="hidden" name="mail_id" value="2">
              <input type="hidden" name="e_id" value="<%=cus_id%>">
      <table width="650" border="0" >
          <tr>
              <td height="20"></td>
              <td></td>
          </tr>
              <tr>
                  <td height="40" style=" color: #000000; font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;To *</td>
                  <td><input type="text" style=" height: 28px; border:solid 1px #999999" size="65" name="email" value="<%=email_id.trim()%>"  tabindex="1"></td>
              </tr>
              <tr>
                  <td height="40" style=" color: #000000; font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;Subject *</td>
                  <td><input type="text" style=" height: 28px; border:solid 1px #999999" size="65" name="subject" tabindex="1"></td>
              </tr>
              <tr>
                  <td height="40" style=" color: #000000; font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;Body *</td>
                  <td><textarea style=" width: 335px; height: 140px; border:solid 1px #999999" name="body" tabindex="3"></textarea></td>
              </tr>
              <tr>
                  <td height="50"></td>
                  <td><input type="button" name="btn1" onclick="nxt()" value="Send" style="width: 80px; height: 32px; background-color: #990000; color: white"></td>
              </tr>
      </table>
          </form>
      </div>
      </div>
</div>
        <%@include file="footer.jsp"%>
        <%
if(session.getAttribute("msg_sent")=="msg_sent")
        {
                   %><script language="javascript">alert("Message Successfully Sent");</script><%
                   session.removeAttribute("msg_sent");
        }
else if(session.getAttribute("msg_sent_fail")=="msg_sent_fail")
        {
                   %><script language="javascript">alert("Internet access failed....");</script><%
                   session.removeAttribute("msg_sent_fail");
        }
        %>
    </body>
</html>
