<%@page contentType="text/html" import="java.sql.*,DBConnection.*" pageEncoding="UTF-8"%>
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
        
        function nxt()
        {
            var name=document.frm.name.value;
            var pincode=document.frm.pincode.value;
            var address=document.frm.address.value;
            var city=document.frm.city.value;
            var state=document.frm.state.value;
            var phone=document.frm.phone.value;
            
            if(name=="")
                {
                 alert("Enter Name");
                 document.frm.name.focus();
                }
            else if(pincode=="")
                {
                 alert("Enter Pincode");
                 document.frm.pincode.focus();
                }
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
                {
                 alert("Enter Address");
                 document.frm.address.focus();
                }
            else if(city=="")
                {
                 alert("Enter City");
                 document.frm.city.focus();
                }
            else if(state=="")
                {
                 alert("Enter State");
                 document.frm.state.focus();
                }
            else if(phone=="")
                {
                 alert("Enter Phone No");
                 document.frm.phone.focus();
                }
            else if(isNaN(phone)|| phone.indexOf(" ")!=-1)
	        {
              	 alert("Enter Number in Phone");
		 return false;
                }
            else if (phone.length!=10)
	        {
                 alert("Enter 10 digits in Phone"); 
		 return false;
          	}
            else
                document.frm.submit();
        }
        
        function plc_ord()
        {
            window.location.replace("place_order2_1.jsp");
        }
        </script>
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <br><br>
        <%
        Connection con = null;
        Statement st;
        ResultSet rs=null;
        int pres=0;
        try {
            con=new ConnectionProvider().setConnection();
            st=con.createStatement();
            rs=st.executeQuery("select * from customer where cus_id='"+cus_id+"'");
            rs.next();
            
            if(rs.getString(2)!=null && rs.getString(3)!=null && rs.getString(4)!=null && rs.getString(5)!=null && rs.getString(6)!=null && rs.getString(7)!=null && rs.getString(8)!=null && rs.getString(9)!=null)     
                pres=1;
            
        
        %>
        
        <center>
            <table border="0" style=" margin-right: 70px">
                    <tr>
                        <th height="40" style="color: black; font-size: 16px"><u>Shipping Address</u></th>
                    </tr>
                </table>
        </center>
        <br>
        <center>
            <% if(pres==1){ %>
            
            
            <div style="border:solid 1px #999999; width: 250px; height: 230px; float: left; margin-left: 70px; margin-top: 10px ">
            <table width="250"  border="0" >
                    <tr>
                        <td height="30" align="left" style=" font-size: 13px; color: #333333;"><%=rs.getString(4) %></td>
                    </tr>
                    <tr>
                        <td height="30" align="left" style=" font-size: 13px; color: #333333;"><%=rs.getString(6) %></td>
                    </tr>
                    <tr>
                        <td height="30" align="left" style=" font-size: 13px; color: #333333;"><%=rs.getString(7) %></td>
                    </tr>
                    <tr>
                        <td height="30" align="left" style=" font-size: 13px; color: #333333;"><%=rs.getString(8) %></td>
                    </tr>
                    <tr>
                        <td height="30" align="left" style=" font-size: 13px; color: #333333;">Ph No-<%=rs.getString(5) %></td>
                    </tr>
                    <tr>
                        <td height="30" align="left" style=" font-size: 13px; color: #333333;">Pin-<%=rs.getString(9) %></td>
                    </tr>
                    <tr>
                        <td height="30" align="left"><input type="button" name="btn1" value="Select" onclick="plc_ord()" style="width: 246px; height: 32px; background-color: #990000; color: white; border:solid 1px #cccccc; font-size: 14px"></td>
                    </tr>
                </table>
               </div>
                    <table width="50" height="450"  border="0" style=" float: left; margin-left: 60px;">
                        <% for(int i=0; i<8; i++ ){ %>
                        <tr>
                            <td align="center" style="color: #333333; font-size: 14px">|</td>
                        </tr>
                        <% } %>
                        
                        <tr>
                            <td align="center" style=" color: black; font-size: 15px">OR</td>
                        </tr>
                        
                        <% for(int i=0; i<8; i++ ){ %>
                        <tr>
                            <td align="center" style="color: #333333; font-size: 14px">|</td>
                        </tr>
                        <% } %>
                    </table>
            <% 
            }
            %>
            <form name="frm" action="../place_order2" method="post" >
                <table width="400"  border="0">
                    <tr>
                        <td height="45" width="150" style="color: #333333; font-size: 14px">Name</td>
                        <td><input type="text" style=" height: 33px; border:solid 1px #999999" size="40" name="name" tabindex="1"></td>
                    </tr>
                    <tr>
                        <td height="45" style="color: #333333; font-size: 14px">Pin Code</td>
                        <td><input type="text" style=" height: 33px; border:solid 1px #999999" size="40" name="pincode" tabindex="2" onKeyup="isInteger(this.value)"></td>
                    </tr>
                    <tr>
                        <td height="45" style="color: #333333; font-size: 14px">Address</td>
                        <td><textarea style=" width: 210px; height: 120px; border:solid 1px #999999" name="address" tabindex="3"></textarea></td>
                    </tr>
                    <tr>
                        <td height="45" style="color: #333333; font-size: 14px">City</td>
                        <td><input type="text" style=" height: 33px; border:solid 1px #999999" size="40" name="city" tabindex="4"></td>
                    </tr>
                    <tr>
                        <td height="45" style="color: #333333; font-size: 14px">State</td>
                        <td><input type="text" style=" height: 33px; border:solid 1px #999999" size="40" name="state" tabindex="5"></td>
                    </tr>
                    <tr>
                        <td height="45" style="color: #333333; font-size: 14px">Country</td>
                        <td style="color: #333333; font-size: 14px">India</td>
                    </tr>
                    <tr>
                        <td height="45" style="color: #333333; font-size: 14px">Phone</td>
                        <td><input type="text" style=" height: 33px; border:solid 1px #999999" size="40" name="phone" tabindex="6" onKeyup="isInteger(this.value)"></td>
                    </tr>
                    <tr>
                        
                        <td height="60"></td>
                        <td><input type="button" name="btn1" onclick="nxt()" value="Continue" style="width: 90px; height: 32px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
                    </tr>
                </table>
               </form>
        </center>
        <%
        }catch (Exception e) {}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              } 
        %>
        
        <br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
