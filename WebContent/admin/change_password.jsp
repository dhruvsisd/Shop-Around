<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <%@include file="drop_down_menu.jsp"%>
      
        <br><br><br><br><br>
        <div align="center"><p style="color: red; font-size: 15px"><u><b>CHANGE PASSWORD</b></u></p></div>
        <br><br><br>
        <div align="center">
        <table width="400"  border="0">
                    
                    <form name="frm" action="../change_password" method="post">
                    <tr>
                        <td height="45" width="150" style=" font-size: 14px; color: #000000;">Old Password</td>
                        <td><input type="password" style=" height: 30px; border:solid 1px #999999" size="40" name="old_pass" tabindex="1"></td>
                    </tr>
                    <tr>
                        <td height="45" style=" font-size: 14px; color: #000000;">New Password</td>
                        <td><input type="password" style=" height: 30px; border:solid 1px #999999" size="40" name="new_pass" tabindex="2"></td>
                    </tr>
                    <tr>
                        <td height="45" style=" font-size: 14px; color: #000000;">Repeat New Password</td>
                        <td><input type="password" style=" height: 30px; border:solid 1px #999999" size="40" name="re_new_pass" tabindex="3"></td>
                    </tr>
                    <tr>
                        <td height="45"></td>
                        <td><input type="button" name="btn1" value="Save" onclick="chng_pass()" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
                    </tr>
                    </form>
                </table>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br>
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
