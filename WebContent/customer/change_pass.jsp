<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
            function chng_pass()
            {
                var old_pass=document.frm.old_pass.value;
                var new_pass=document.frm.new_pass.value;
                var re_new_pass=document.frm.re_new_pass.value;
                if(old_pass=="")
                    alert("Enter Old Password");
                else if(new_pass=="")
                    alert("Enter New Password");
                else if(re_new_pass=="")
                    alert("Enter Repeat New Password");
                else if(new_pass!=re_new_pass)
                    alert("New Password Mismatch");
                else
                    document.frm.submit();   
            }
        </script>
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <br><br><br>
        <div style=" float: left; position: fixed; margin-top: 20px">
        <div class="boxac categoriesac">
        <h2><b>My Account</b></h2>
        <div class="box-contentac">
            <ul>
                <br>
                <li><a href="my_orders.jsp"><b>My Order</b></a></li>
                <br><br>
                <li><a href="account.jsp"><b>Personal Information</b></a></li>
                <br><br>
                <li><a href="change_pass.jsp"><b>Change Password</b></a></li>
                <br><br>
                <li><a href="address.jsp"><b>Address</b></a></li>
                <br><br>
                <li><a href="update_email.jsp"><b>Update Email</b></a></li>
            </ul>
        </div>   
        </div>
        </div>
        <div style=" margin-left: 300px">
            <table width="400"  border="0">
                    <tr>
                        <td height="45" style=""><u><p style=" font-size: 18px"><b>Change Password</b></p></u></td>
                    </tr>
            </table>
            <table width="400"  border="0">
                    <tr>
                        <td height="45" width="150"><h2>Email Address</h2></td>
                        <td><p style="font-size: 14px"><%=email%></p></td>
                    </tr>
                    <form name="frm" action="../change_pass" method="post">
                    <tr>
                        <td height="45"><h2>Old Password</h2></td>
                        <td><input type="password" style=" height: 30px; border:solid 1px #999999" size="40" name="old_pass" tabindex="1"></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>New Password</h2></td>
                        <td><input type="password" style=" height: 30px; border:solid 1px #999999" size="40" name="new_pass" tabindex="2"></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>Repeat New Password</h2></td>
                        <td><input type="password" style=" height: 30px; border:solid 1px #999999" size="40" name="re_new_pass" tabindex="3"></td>
                    </tr>
                    <tr>
                        <td height="45"></td>
                        <td><input type="button" name="btn1" value="Save" onclick="chng_pass()" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
                    </tr>
                    </form>
                </table>
        </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    <%@include file="footer.jsp"%>
    </div>
    
    <%
if(session.getAttribute("pass_chng_success")=="pass_chng_success")
        {
                   %><script language="javascript">alert("Password Changed Successfully");</script><%
                   session.removeAttribute("pass_chng_success");
        }
else if(session.getAttribute("old_pass_mismatch")=="old_pass_mismatch")
        {
                   %><script language="javascript">alert("Incorrect Old Password");</script><%
                   session.removeAttribute("old_pass_mismatch");
        }
%>
    
    
    </body>
</html>
