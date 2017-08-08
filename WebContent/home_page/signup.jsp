<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

/* Base CSS */
.alignleft {
    float: left;
    margin-right: 15px;
}
.alignright {
    float: right;
    margin-left: 15px;
}
.aligncenter {
    display: block;
    margin: 0 auto 15px;
}
a:focus { outline: 0 solid }
img {
    max-width: 100%;
    height: auto;
}
.fix { overflow: hidden }
h1,
h2,
h3,
h4,
h5,
h6 {
    margin: 0 0 15px;
    font-weight: 700;
}
html,
body { height: 100% }

a {
    -moz-transition: 0.3s;
    -o-transition: 0.3s;
    -webkit-transition: 0.3s;
    transition: 0.3s;
    color: #333;
}
a:hover { text-decoration: none }



.search-box{margin:80px auto;position:absolute;}
.caption{margin-bottom:50px;}
.loginForm input[type=text], .loginForm input[type=password]{
	margin-bottom:10px;
}
.loginForm input[type=submit]{
	background:#fb044a;
	color:#fff;
	font-weight:700;
	
}


#pswd_info {
	background: #dfdfdf none repeat scroll 0 0;
	color: #fff;

	position: absolute;
	top: 185px;
	right:150px;
}
#pswd_info h4{
    background: black none repeat scroll 0 0;
    display: block;
    font-size: 14px;
    letter-spacing: 0;
    padding: 17px 0;
    text-align: center;
    text-transform: uppercase;
}
#pswd_info ul {
    list-style: outside none none;
}
#pswd_info ul li {
   padding: 10px 45px;
}



.valid {
	background: rgba(0, 0, 0, 0) url("https://s19.postimg.org/vq43s2wib/valid.png") no-repeat scroll 2px 6px;
	color: green;
	line-height: 21px;
	padding-left: 22px;
}

.invalid {
	background: rgba(0, 0, 0, 0) url("https://s19.postimg.org/olmaj1p8z/invalid.png") no-repeat scroll 2px 6px;
	color: red;
	line-height: 21px;
	padding-left: 22px;
}


#pswd_info::before {
    background: #dfdfdf none repeat scroll 0 0;
    content: "";
    height: 25px;
    left: -13px;
    margin-top: -12.5px;
    position: absolute;
    top: 50%;
    transform: rotate(45deg);
    width: 25px;
}
#pswd_info {
    display:none;
}

</style>
       
        <script>
            function chk()
            {
                var email=document.login.email.value;
                var atpos=email.indexOf("@");
                var dotpos=email.lastIndexOf(".");
                if(email=="")
                    alert("Enter Email");
                else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) 
                    alert("Not a valid Email");
                else if(document.login.pass.value=="")
                    alert("Enter Password");
                else if(document.login.repass.value=="")
                    alert("Enter Repeat Password");
                else if(document.login.pass.value!=document.login.repass.value)
                    alert("password & repeat password mismatch");
                else
                    document.login.submit();
            }
        </script>
        <script type="text/javascript">

$(document).ready(function(){
	
	$('input[type=password]').keyup(function() {
		var pswd = $(this).val();
		
		//validate the length
		if ( pswd.length < 8 ) {
			$('#length').removeClass('valid').addClass('invalid');
		} else {
			$('#length').removeClass('invalid').addClass('valid');
		}
		
		//validate letter
		if ( pswd.match(/[A-z]/) ) {
			$('#letter').removeClass('invalid').addClass('valid');
		} else {
			$('#letter').removeClass('valid').addClass('invalid');
		}

		//validate capital letter
		if ( pswd.match(/[A-Z]/) ) {
			$('#capital').removeClass('invalid').addClass('valid');
		} else {
			$('#capital').removeClass('valid').addClass('invalid');
		}

		//validate number
		if ( pswd.match(/\d/) ) {
			$('#number').removeClass('invalid').addClass('valid');
		} else {
			$('#number').removeClass('valid').addClass('invalid');
		}
		
		//validate space
		if ( pswd.match(/[^a-zA-Z0-9\-\/]/) ) {
			$('#space').removeClass('invalid').addClass('valid');
		} else {
			$('#space').removeClass('valid').addClass('invalid');
		}
		
	}).focus(function() {
		$('#pswd_info').show();
	}).blur(function() {
		$('#pswd_info').hide();
	});
	


});
</script>
        
    </head>
    <body>
        
        <div id="overlay_signup">
            <div id="popup" style="height:290px;" >
                 <a onclick="window.history.go(-1); return false;"><img class="close_button" src="images/close.png"/></a>
                <form class="login" name="login" action="../signup" method="post">
                    <div align="center" class="loginform">
                        <table border="0" width="450">
                        <tr>
                            <td height="50" align="left" width="110" style=" color: #ffffff; font-size: 15px">Email Address</td>
                            <td><input type="text" name="email" style=" height: 28px; border:solid 1px #000000" size="40" tabindex="1" required></td>
                        </tr>
                        <tr>
                            <td height="50" align="left" style=" color: #ffffff; font-size: 15px">Password</td>
                            <td><input type="password" name="pass" class="form-control"  style=" height: 28px; border:solid 1px #000000" size="40" tabindex="2" required></td>
                        </tr>
                        <tr>
                            <td height="50" align="left" style=" color: #ffffff; font-size: 15px">Repeat Password</td>
                            <td><input type="password" name="repass" class="form-control"  style=" height: 28px; border:solid 1px #000000" size="40" tabindex="3" required></td>
                        </tr> 
                        <tr>
                            <td></td>
                            <td align="left" height="50">
                              <div>  <input type="button" value="Sign Up" id ="div5" class="form-control"  onclick="chk()" style="width: 80px; height: 28px; border:solid 1px #333333; background-color:#333333; color: white; font-size: 14px" tabindex="4"></div>
                            </td>
                        </tr>
                     </table> 
                    </div>
                </form>
            </div>
       <div class="col-md-4">
			<div class="aro-pswd_info">
				<div id="pswd_info">
					<h4>Password must be requirements</h4>
					<ul>
						<li id="letter" class="invalid">At least <strong>one letter</strong></li>
						<li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
						<li id="number" class="invalid">At least <strong>one number</strong></li>
						<li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
						<li id="space" class="invalid">be<strong> use [~,!,@,#,$,%,^,&,*,-,=,.,;,']</strong></li>
					</ul>
				</div>
			</div>
		</div>
        
        </div>
    </body>
</html>
