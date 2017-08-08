<%@page import="DBConnection.ConnectionProvider"%>
<%@page session="true" %>
<%@page contentType="text/html"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script language="javascript">
            var st1="2";
            function check2(obj)
            {
             if(obj.checked==true)
                 {
                     document.frm1.t2.disabled=false;
                     document.frm1.drop2.disabled=true;
                     st1="1";
                 }
             else
                 {
                     document.frm1.t2.disabled=true;
                     document.frm1.drop2.disabled=false;
                     st1="2";
                 }
                 
            }
            
            function isInteger(s)
    {
      var i;
	s = s.toString();
      for (i = 0; i < s.length; i++)
      {
         var c = s.charAt(i);
         if (isNaN(c)) 
	   {
		alert("Given value is not a number");
		return false;
	   }
      }
      return true;
    }
            
            function check1()
            {
                var i_name=document.frm1.i_name.value;
                var brand="";
                if(document.frm1.t2.disabled==true)
                    brand=document.frm1.drop2.value;
                else if(document.frm1.drop2.disabled==true)
                    brand=document.frm1.t2.value;
                var av=document.frm1.av.value;
                var pp=document.frm1.pp.value;
                var sp=document.frm1.sp.value;
                var discount=document.frm1.discount.value;
                
                var i;
	var av1 = av.toString();
        var pp1 = pp.toString();
        var sp1 = sp.toString();
        var discount1 = discount.toString();
        var ch1=0;
        var ch2=0;
        var ch3=0;
        var ch4=0;
        for (i = 0; i < av1.length; i++)
        {
         var c = av1.charAt(i);
         if (isNaN(c)) 
	   {
		ch1=1;
                break;
	   }
        }
        for (i = 0; i < pp1.length; i++)
        {
         var c = pp1.charAt(i);
         if (isNaN(c)) 
	   {
		ch2=1;
                break;
	   }
        }
        for (i = 0; i < sp1.length; i++)
        {
         var c = sp1.charAt(i);
         if (isNaN(c)) 
	   {
		ch3=1;
                break;
	   }
        }
        for (i = 0; i < discount1.length; i++)
        {
         var c = discount1.charAt(i);
         if (isNaN(c)) 
	   {
		ch4=1;
                break;
	   }
        }
                if(i_name=="")
                    {
                     alert("enter item name");
                     document.frm1.i_name.focus();
                    }
                else if(brand=="" && document.frm1.t2.disabled==true)
                    alert("select brand");
                else if(brand=="" && document.frm1.drop2.disabled==true)
                    {
                    alert("enter brand");
                    document.frm1.t2.focus();
                    }
                else if(av=="")
                    {
                    alert("enter availibility");
                    document.frm1.av.focus();
                    }
                else if(ch1==1)
                    {
                    alert("enter a valid number in availibility");
                    document.frm1.av.focus();
                    }
                else if(pp=="")
                    {
                    alert("enter purchased price");
                    document.frm1.pp.focus();
                    }
                else if(ch2==1)
                    {
                    alert("enter a valid number in purchased price");
                    document.frm1.pp.focus();
                    }
                else if(sp=="")
                    {
                    alert("enter selling price");
                    document.frm1.sp.focus();
                    }
                else if(ch3==1)
                    {
                    alert("enter a valid number in selling price");
                    document.frm1.sp.focus();
                    }
                else if(discount=="")
                    {
                    alert("enter discount");
                    document.frm1.discount.focus();
                    }
                else if(discount>100)
                    {
                    alert("discount cant be greater than 100");
                    document.frm1.discount.focus();
                    }
                else if(ch4==1)
                    {
                    alert("enter a valid number in discount");
                    document.frm1.discount.focus();
                    }
                else 
                    document.frm1.submit();
            }
            
        </script>
    </head>
    
    <body onload="ld()">    
        
       <%
        String cat=request.getParameter("cat");
        String i_id=request.getParameter("i_id");
        Connection con=null;
        
        try{
        	con=new ConnectionProvider().setConnection();   Statement st= con.createStatement();
            Statement st1= con.createStatement();
            ResultSet rs= st.executeQuery("select * from category");  
            ResultSet rs1= st1.executeQuery("select distinct brand_name from item");  
            Statement st2= con.createStatement();
            ResultSet rs2= st2.executeQuery("select * from item,category where category.c_id=item.c_id and i_id='"+i_id+"'");  
            rs2.next();
            String c_id=rs2.getString(4);
            session.setAttribute("c_id", c_id);
            session.setAttribute("i_id", i_id);
       %>
       <script language="javascript">
           function ld()
           {
           document.frm1.i_name.value="<%=rs2.getString(3)%>";
           
           document.frm1.drop2.value="<%=rs2.getString(5)%>";
           document.frm1.av.value="<%=rs2.getString(6)%>";
           document.frm1.pp.value="<%=rs2.getString(9)%>";
           document.frm1.sp.value="<%=rs2.getString(10)%>";
           document.frm1.discount.value="<%=rs2.getString(14)%>";
           }
       </script>
        <div class="shell">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br><br>
        <table border="0" style=" margin-left: 236px">
            <tr>
                <td><p style="color: red; font-size: 15px"><u><b>EDIT ITEM INFORMATION- PAGE 1</b></u></p></td>
            </tr>
        </table>
        <br><br><br>
     <div  align="center">
     <form id="frm1" name="frm1" ACTION="../edit_item1" METHOD="post">
        <table border="0">
            <tr>
                <td width="114" height="60" style=" color: #000000; font-size: 14px">Item name</td>
                <td><input type="text" style=" height: 27px; border:solid 1px #999999" size="40" tabindex="1" name="i_name"></td>
            </tr>
            <tr>
                <td width="114" height="60" style=" color: #000000; font-size: 14px">Category name</td>
                <td>
                    <p style=" color: #000000; font-size: 13px"><%=cat%></p>
                </td>
            </tr>
            
            <tr>
                <td width="114" height="60" style=" color: #000000; font-size: 14px">Brand name</td>
                <td>
                    <div style=" width: 160px; height: 30px; border: solid 1px #999999;">
                        <select name="drop2" STYLE="width: 150px; padding-top: 5px; padding-left: 10px; border: 0" tabindex="2">
                    <option value="">--- Select Brand ---</option>
                    <%       
       while(rs1.next())
         {
            %>    
                    <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
            <%  
         }
         }catch(SQLException se){}
          finally
          {
           try
            {
             con.close();
            }catch(Exception e){}
          }

            %>
                    </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td><h2></h2></td>
                <td style=" color: #000000; font-size: 13px"><p>if not exits, create new <input type="checkbox" onclick="javascript:check2(this)" tabindex="3">&nbsp;<input type="text" name="t2" style=" height: 27px; border:solid 1px #999999" size="40" tabindex="4" disabled="true"></p></td>
            </tr>
            
            <tr>
                <td width="114" height="60" style=" color: #000000; font-size: 14px">Availability</td>
                <td style=" color: #000000; font-size: 13px"><input type="text" style=" height: 27px; border:solid 1px #999999" size="40" tabindex="5" name="av" onKeyup="isInteger(this.value)">&nbsp;pieces</td>
            </tr>
            
            <tr>
                <td width="114" height="60" style=" color: #000000; font-size: 14px">Purchased Price</td>
                <td><input type="text" style=" height: 27px; border:solid 1px #999999" size="40" tabindex="6" name="pp" onKeyup="isInteger(this.value)"></td>
            </tr>
            <tr>
                <td width="114" height="60" style=" color: #000000; font-size: 14px">Selling Price</td>
                <td><input type="text" style=" height: 27px; border:solid 1px #999999" size="40" tabindex="7"  name="sp" onKeyup="isInteger(this.value)"></td>
            </tr>
            <tr>
                <td width="114" height="60" style=" color: #000000; font-size: 14px">Discount</td>
                <td style=" color: #000000; font-size: 17px"><input type="text" style=" height: 27px; border:solid 1px #999999" size="40" tabindex="8" name="discount" onKeyup="isInteger(this.value)"> %</td>
            </tr>
            <tr>
                <td width="114" height="60"></td>
                <td><input name="btn1" type="button" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" tabindex="9" value="Next" onclick="check1()"/></td>
            </tr>
        </table>
     </form>  
    </div>
    <br><br><br><br>
    <%@include file="footer.jsp"%>
    </div>
    
    <%
if(session.getAttribute("success")=="success")
        {
                   %><script language="javascript">alert("Successfully Added");</script><%
                   session.removeAttribute("success");
        }
%>
    
    </body>
</html>
