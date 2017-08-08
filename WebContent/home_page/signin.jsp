<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
            function lgin()
            {
                var email=document.frm1.email.value;
                var password=document.frm1.password.value;
                var atpos=email.indexOf("@");
                var dotpos=email.lastIndexOf(".");
                
                if(email=="")
                    alert("Enter Email Address");
                else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) 
                    alert("Not a valid Email");
                else if(password=="")
                    alert("Enter Password");
                else
                    document.frm1.submit();
            }
            
            function chk1()
            {
                var email=document.frm2.email.value;
                
                var atpos=email.indexOf("@");
                var dotpos=email.lastIndexOf(".");
                
                if(email=="")
                    alert("Enter Email Address");
                else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) 
                    alert("Not a valid Email");
                
                else
                    document.frm2.submit();
            }
        </script>
    </head>
    <body>
        <div id="overlay" >            
            <div id="popup" style=" padding-left: 40px">
            
               <a onclick="window.history.go(-1); return false;"><img class="close_button" src="images/close.png"/></a>
                <form class="login" name="frm1" action="../signin" method="get">
                    <div align="center">
                    <table border="0" width="350">
                        <tr>
                            <td height="50" align="left" width="80" style=" color: #ffffff; font-size: 15px">Email</td>
                            <td align="left"><input type="text" name="email" style=" height: 28px; border:solid 1px #000000" size="40" tabindex="1"></td>
                        </tr>
                        <tr>
                            <td height="50" align="left" style=" color: #ffffff; font-size: 15px">Password</td>
                            <td align="left"><input type="password" name="password" style=" height: 28px; border:solid 1px #000000" size="40" tabindex="2"></td>
                        </tr>
                        <tr>
                            <td height="50"></td>
                            <td align="left">
                                <input type="button" value="Login" onclick="lgin()" tabindex="4" style="width: 80px; height: 28px; border:solid 1px #333333; background-color: #333333; color: white; font-size: 14px">
                            &nbsp;<a href="#overlay1" style=" text-decoration: none; color: #ffffff">Forgot your password ?</a>
                            </td>
                        </tr>
                    </table>
                    </div>
                </form>
            </div>
        </div>
        
        <div id="overlay1" >            
            <div id="popup" style=" padding-left: 40px">
                <a href=""><img class="close_button" src="images/close.png"/></a>
                <form name="frm2" class="login" action="../forgot_password" method="post">
                    <div align="center">
                    <table border="0" width="350">
                        <tr>
                            <td height="30" style=" color: #ffffff; font-size: 15px">Forgot your Password?</td>
                        </tr>
                        <tr>
                            <td style=" color: #ffffff">Enter your Email Address here to receive the password.</td>
                        </tr>
                    </table>
                    <table border="0" width="350">
                        <tr>
                            <td height="50" align="left" width="80" style=" color: #ffffff; font-size: 15px">Email</td>
                            <td align="left"><input type="text" name="email" style=" height: 28px; border:solid 1px #000000" size="40" tabindex="1"></td>
                        </tr>
                        <tr>
                            <td height="50"></td>
                            <td align="left">
                                <input type="button" value="Send Email" onclick="chk1()" tabindex="4" style="width: 80px; height: 28px; border:solid 1px #333333; background-color: #333333; color: white; font-size: 14px">
                            &nbsp;<a href="#overlay" style=" text-decoration: none; color: #ffffff">Back to SignIn..</a>
                            </td>
                        </tr>
                    </table>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
