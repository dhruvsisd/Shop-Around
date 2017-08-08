<%@page contentType="text/html" pageEncoding="UTF-8" import="DBConnection.*"%>
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
            
            function addrs()
            {
                var pincode=document.frm.pincode.value;
                var address=document.frm.address.value;
                var city=document.frm.city.value;
                var state=document.frm.state.value;
                if(pincode=="")
                    alert("Enter Pincode");
                else if(isNaN(pincode)|| pincode.indexOf(" ")!=-1)
	        {
              	 alert("Enter Number in Pincode");
		 return false;
                }
                else if (pincode.length!=6)
	        {
                 alert("Enter 6 digits in Pincode"); 
		 return false;
          	}
                else if(address=="")
                    alert("Enter Street Address");
                else if(city=="")
                    alert("Enter City");
                else if(state=="")
                    alert("Enter State");
                else
                    document.frm.submit();   
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
        String name="";
        String pincode="";
        String address="";
        String city="";
        String state="";
        try {
            con=new ConnectionProvider().setConnection();
            st=con.createStatement();
            
            rs=st.executeQuery("select * from customer where cus_id='"+cus_id+"'");
            rs.next();
            name= rs.getString(4);
            pincode= rs.getString(9);
            address= rs.getString(6);
            city= rs.getString(7);
            state= rs.getString(8);
            if(name==null)
                name="";
            if(pincode==null)
                pincode="";
            if(address==null)
                address="";
            if(city==null)
                city="";
            if(state==null)
                state="";
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
                        <td height="45" style=""><u><p style=" font-size: 18px"><b>Add Address</b></p></u></td>
                    </tr>
            </table>
            <table width="400"  border="0">
                    <tr>
                        <td height="45" width="150"><h2>Name</h2></td>
                        <td><p style=" font-size: 13px"><%=name%></p></td>
                    </tr>
             <form name="frm" action="../address" method="post">
                    <tr>
                        <td height="45"><h2>Pin Code</h2></td>
                        <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="40" name="pincode" value="<%=pincode.trim() %>" tabindex="1" onKeyup="isInteger(this.value)"></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>Street Address</h2></td>
                        <td><textarea style=" width: 210px; height: 120px; border:solid 1px #999999" name="address" tabindex="2"><%=address.trim()%></textarea></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>City</h2></td>
                        <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="40" name="city" value="<%=city.trim()%>" tabindex="3"></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>State</h2></td>
                        <td><input type="text" style=" height: 30px; border:solid 1px #999999" size="40" name="state" value="<%=state.trim()%>" tabindex="4"></td>
                    </tr>
                    <tr>
                        <td height="45"><h2>Country</h2></td>
                        <td><h2>India</h2></td>
                    </tr>
                    
                    <tr>
                        <td height="45"></td>
                        <td><input type="button" name="btn1" value="Save" onclick="addrs()" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
                    </tr>
              </form>
                </table>
        </div>
    <br><br><br><br><br><br><br><br>
    
    
    <%@include file="footer.jsp"%>
    </div>
    
    <%
if(session.getAttribute("addrs_chng")=="addrs_chng")
        {
                   %><script language="javascript">alert("Address Updated Successfully");</script><%
                   session.removeAttribute("addrs_chng");
        }
   %>
    
    </body>
</html>
