<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop Around</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
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
                <td height="60" scope="col" style=" color: red; font-size: 17px">
                    <b>Contact Us</b>
                </td>    
            </tr>
          </table>
  
          <table width="850" border="0" >
              <tr> 
                  <td height="30" style=" color: blue; font-size: 16px">Have a question? We have 24x7 customer service.</td>
              </tr>
              <tr>
                  <td height="30" style=" color: blue; font-size: 16px">Tell us about your issue and we will get back to you within a few hours! </td>
              </tr>
          </table>
      <br>
      
      </div>
  <br><br>
  <table width="57" border="0" style="float: left">
      <tr>
          <td></td>
      </tr>
  </table>
      <table width="380" border="0" style="float: left;">
          <tr>
              <td height="30" width="45"><img src="images/phone.png" width="37" height="37"/></td>
              <td height="30" style="color: red; font-size: 18px"><b>Call us:</b></td>
          </tr>
          <tr>
              <td height="30"></td>
              <td height="30" style="color: blue; font-size: 16px">Pick up the phone and call us @9910625434</td>
          </tr>
          <tr>
              <td height="30"></td>
              <td style="color: blue; font-size: 16px">We're available 24 hours a day, 7 days a week </td>
          </tr>
      </table>
    <table width="57" border="0" style="float: left">
      <tr>
          <td></td>
      </tr>
  </table>  
      
      <table width="280" border="0">
          <tr>
              <td height="25" width="45"><img src="images/email1.jpg" width="32" height="25"/></td>
              <td style="color: red; font-size: 16px"><b>Mail us: dhruvsisd@gmail.com</b></td>
          </tr>
          <tr>
              <td height="25"></td>
              <td style="color: blue; font-size: 16px">ShopAround Internet Private Limited,</td>
          </tr>
          <tr>
              <td height="25"></td>
              <td style="color: blue; font-size: 16px">Indirapuram</td>
          </tr>
          <tr>
              <td height="25"></td>
              <td style="color: blue; font-size: 16px">Ghaziabad</td>
          </tr>
          <tr>
              <td height="25"></td>
              <td style="color: blue; font-size: 16px">UP</td>
          </tr>
      </table>
      

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
                   %><script language="javascript">alert("Your message has been successfully sent");</script><%
                   session.removeAttribute("suc_sent");
        }
%>
</body>
</html>
