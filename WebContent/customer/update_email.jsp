<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
             
            function eml()
            {
            
                var email=document.from.email_new.value;
                var atpos=email.indexOf("@");
                var dotpos=email.lastIndexOf(".");
                if(email=="")
                    alert("Enter Email");
                else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) 
                    alert("Not a valid Email");
               
                else if(document.from.email.value==document.from.email_new.value)
                    alert("New and old email id's are same.");
                else
                    document.from.submit();
           
            }
        </script>
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <br><br><br>
        
        <%
           
        Connection con = null;
        Statement st;
        ResultSet rs;
       String email1="";
        
        try {
           con=new ConnectionProvider().setConnection();
            st=con.createStatement();
            
            rs=st.executeQuery("select * from customer where cus_id='"+cus_id+"'");
            rs.next();
            email1= rs.getString(2);
          
            if(email1==null)
                email1="";
                      }catch (Exception e) {}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }   
        %>
        
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
                        <td height="45" style=""><u><p style=" font-size: 18px"><b>Enter your new email</b></p></u></td>
                    </tr>
            </table>
            <table width="400"  border="0">
                    
             <form name="from" action="../update_email" method="post">
                    <tr>
                        <td height="45"><h2>Old Email Id</h2></td>
                        <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="40" name="email" value="<%=email1%>" tabindex="1" onKeyup="isInteger(this.value)" readonly></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>New Email Id</h2></td>
                        <td><input type="text" style=" height:30px;  border:solid 1px #999999" size="40" name="email_new" tabindex="2" value="<%=email1.trim()%>"/></td>
                    </tr>
                     
                    <tr>
                        <td height="45"></td>
                        <td><input type="button" name="btn1" value="Save" onclick="eml()" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
                    </tr>
              </form>
                </table>
        </div>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
   <br>
    
    
    <%@include file="footer.jsp"%>
    </div>
    
    <%
if(session.getAttribute("email_chng_success")=="email_chng_success")
        {
                   %><script language="javascript">alert("Email Updated Successfully");</script><%
                   session.removeAttribute("email_chng_success");
        }
   %>
    
    </body>
</html>
