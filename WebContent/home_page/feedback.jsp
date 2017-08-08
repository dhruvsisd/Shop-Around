<%@page import="mypack.ElasticEmailClient"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop Around</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
<script>
    function nxt()
    {
        var email=document.frm.email.value;
        var message=document.frm.message.value;
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        if(email=="")
            alert("Enter Your Email");
        else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) 
            alert("Not a valid Email");
        else if(message=="")
            alert("Enter Your Message");
        else
            {
        
        	document.frm.submit();
    }
        }
</script>
</head>

<body>
    
<!-- Shell -->
<div class="shell">
    
  <!-- Header -->
  <%@include file="header.jsp"%>
  <!-- End Header -->
 
  <div align="center">
          <table width="850" border="0" >
            <tr>
                <td height="60" scope="col" style=" color: #000000; font-size: 17px">
                    <b>Feedback</b>
                </td>    
            </tr>
            <tr>
                <td height="40" scope="col" style="  font-size: 13px">
                    <b>Your feedback is highly welcome. Please send your feedback here.</b>
                </td>    
            </tr>
          </table>
  
          
      <br>
      
      <div style="border:solid 1px #999999; width: 650px; height: 280px; margin-right: 190px">
          <form name="frm" action="../feedback_unreg" method="post">
      <table width="650" border="0" >
          <tr>
              <td height="20"></td>
              <td></td>
          </tr>
               <tr>
                  <td height="40" style=" color: #000000; font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;Your Name *</td>
                  <td><input type="text" style=" height: 28px; border:solid 1px #999999" size="65" name="name" tabindex="1"></td>
              </tr>
              <tr>
                  <td height="40" style=" color: #000000; font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;Your Email *</td>
                  <td><input type="text" style=" height: 28px; border:solid 1px #999999" size="65" name="email" tabindex="2"></td>
              </tr>
              <tr>
                  <td height="40" style=" color: #000000; font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;Message *</td>
                  <td><textarea style=" width: 335px; height: 140px; border:solid 1px #999999" name="message" tabindex="3"></textarea></td>
              </tr>
              <tr>
                  <td height="50"></td>
                  <td><input type="button" name="btn1" onclick="nxt()" value="Send" style="width: 80px; height: 32px; background-color: #990000; color: white"></td>
              </tr>
      </table>
          </form>
      </div>
      </div>
  
  <br><br><br><br><br><br><br><br><br><br><br>
  <!-- Footer -->
    <%@include file="footer.jsp"%>
  <!-- End Footer -->
  
</div>
<!-- End Shell -->

  <!-- sign up -->
    <%@include file="signup.jsp"%>
  <!--end sign up -->
  
  <!-- sign in -->
    <%@include file="signin.jsp"%>
  <!--end sign in -->
  <%
  if(session.getAttribute("suc_sent")=="suc_sent")
        {
                   %><script language="javascript">alert("Your feedback successfully sent.");</script><%
                   session.removeAttribute("suc_sent");
        }
  %>
</body>
</html>
