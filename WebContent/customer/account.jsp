<%@page import="mypack.sendsms"%>
<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
            function isInteger(s)
    {
      var i;
	s = s.toString();
      for (i = 0; i < s.length; i++)
      {
         var c = s.charAt(i);
         if (isNaN(c)) 
	   {
		alert("Given value is not a Number");
		return false;
	   }
      }
      return true;
    }
            function account()
            {
                var fname=document.frm.fname.value;
                var lname=document.frm.lname.value;
                var ph_no=document.frm.ph_no.value;
                
                if(fname=="")
                    alert("Enter First Name");
                else if(lname=="")
                    alert("Enter Last Name");
                else if(ph_no=="")
                    alert("Enter Phone Number");
                else if(isNaN(ph_no)|| ph_no.indexOf(" ")!=-1)
	        {
              	 alert("Enter Number in Phone");
		 return false;
                }
                else if (ph_no.length!=10)
	        {
                 alert("Enter 10 digits in Phone"); 
		 return false;
          	}
                else
                	document.frm.submit();   
            		
                }
        </script>
    </head>
    <body onload="ld()">
        <div class="shell">
        <%@include file="header.jsp"%>
        <br><br><br>
        
        <%
           
        Connection con = null;
        Statement st;
        ResultSet rs;
        String fname="";
        String lname="";
        String ph_no="";
        String name="";
        try {
        	con=new ConnectionProvider().setConnection();
            st=con.createStatement();
            
            rs=st.executeQuery("select * from customer where cus_id='"+cus_id+"'");
            rs.next();
            name= rs.getString(4);
            fname= name.substring(0, name.lastIndexOf(" "));
            lname=name.substring(name.lastIndexOf(" ")+1);
            ph_no= rs.getString(5);
            }catch (Exception e) {}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }   
        %>
        <script>
        function ld()
      {
         document.frm.fname.value="<%=fname.trim() %>"; 
         document.frm.lname.value="<%=lname.trim() %>";
         document.frm.ph_no.value="<%=ph_no.trim() %>";
      }
        </script>  
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
                        <td height="45" style=""><u><p style=" font-size: 18px"><b>Personal Information</b></p></u></td>
                    </tr>
            </table>
            <table width="400"  border="0">
                <form name="frm" action="../account" method="post">
                    <tr>
                        <td height="45" width="150"><h2>First Name</h2></td>
                        <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="40" name="fname" tabindex="1"></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>Last Name</h2></td>
                        <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="40" name="lname" tabindex="2"></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>Phone Number</h2></td>
                        <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="40" name="ph_no" id="ph_no" tabindex="3" onKeyup="isInteger(this.value)"></td>
                    </tr>
					
                    <tr>
                        <td height="45"><h2>Gender</h2></td>
                        <td>
                            <div style=" width: 90px; height: 30px; border: solid 1px #999999;">
                            <select name="gender" STYLE="width: 80px; padding-top: 5px; padding-left: 10px; border: 0">
                              <option value="">Male</option>
                              <option value="">Female</option>
                            </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="45"></td>
                        <td><input type="button" name="btn1" value="Save" onclick="account()" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
                    </tr>
               </form>
                </table>
        </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br>
    
    <%@include file="footer.jsp"%>
    </div>
    
    <% 
		if(session.getAttribute("p_info_chng")=="p_info_chng")
    		{
    %>
        <script language="javascript">alert("Information Updated Successfully");</script>
        <%
                   session.removeAttribute("p_info_chng");
        }
   		%>
    
    </body>
</html>
