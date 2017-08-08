<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript">   
            function getSelectedValue() 
            {   
                var index = document.getElementById('drop1').value;   
                window.location.replace("search.jsp?name="+index);
            }   
            function check()
            {
                var drop1=document.frm.drop1.value;
                var drop2=document.frm.drop2.value;
                var st="";
                if(drop1=="i_id")
                    st="Item Id";
                else if(drop1=="i_name")
                    st="Item Name";
                else if(drop1=="c_id")
                    st="Category";
                else if(drop1=="brand_name")
                    st="Brand";
                
                if(drop1=="")
                    alert("Select Search Item By");
                else if(drop2=="")
                    alert("Select "+st);
                else 
                    document.frm.submit();
            }
       </script>  
        
        
    </head>
    <body onload="ld()">
        <div class="shell">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br><br>
        <table border="0" style=" margin-left: 325px">
            <tr>
                <td><p style="color: red; font-size: 15px"><u><b>SEARCH ITEM</b></u></p></td>
            </tr>
        </table>
        <br><br>
        <div  align="center">
       <form action="search_next.jsp" name="frm">
        
            <%
            String name=request.getParameter("name");
            %>  
            <script>
                function ld()
                {
                    document.frm.drop1.value="<%=name%>";
                }
            </script>
           
        <table border="0">
            <tr>
                <td width="140" height="45" style=" color: #000000; font-size: 14px">Search Item By</td>
                <td>
                    <div style=" width: 160px; height: 30px; border: solid 1px #999999;">
                        <select name="drop1" id="drop1" tabindex="1" STYLE="width: 150px; padding-top: 5px; padding-left: 10px; border: 0" onchange="getSelectedValue();">
                    <option value=""> Select </option>
                    <option value="i_id">Item Id</option>
                    <option value="i_name">Item Name</option>
                    <option value="c_id">Category</option>
                    <option value="brand_name">Brand</option>
                    </select>
                    </div>
                </td>
            </tr>
            
            <%
            String name1="";
            if(name==null || name.equalsIgnoreCase("select"))
                name1="";
            else
                name1=name;
            
            String str="";
            if(name1.equalsIgnoreCase("i_id"))
                str="Item Id";
            else if(name1.equalsIgnoreCase("i_name"))
                str="Item Name";
            else if(name1.equalsIgnoreCase("c_id"))
                str="Category";
            else if(name1.equalsIgnoreCase("brand_name"))
                str="Brand";
            %>
            
            
            
            <tr>
                <td width="140" height="70" style=" color: #000000; font-size: 14px">Select <%=str%></td>
                <td>
                    <div style=" width: 160px; height: 30px; border: solid 1px #999999;">
                    <select name="drop2" id="drop2" tabindex="2" STYLE="width: 150px; padding-top: 5px; padding-left: 10px; border: 0">
                    <option value=""> Select </option>
                    <%
                      Connection con=null;
                    try{
                    	con=new ConnectionProvider().setConnection();
                        Statement st= con.createStatement();
                        Statement st1= con.createStatement();
                        ResultSet rs=null;
                        ResultSet rs1=null;
                        rs= st.executeQuery("select distinct "+name1+" from item");  
                        
                        while(rs.next())
                        {
        if(str.equalsIgnoreCase("Category"))
          {
           rs1= st1.executeQuery("select c_name from category where c_id='"+rs.getString(1)+"'"); 
           rs1.next();
           %> 
                  <option value="<%=rs.getString(1)%>"><%=rs1.getString(1)%></option>  
          <%} 
        else
          {%>
                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
          <%} }
                        }catch(Exception e){}
                         finally
                            {
                             try{
                                 con.close();
                                 }catch(Exception e){}
                            }     
            %>
                    </select>
                    </div>
                </td>
            </tr>
            
            <tr>
                <td width="140" height="50"></td>
                <td>
                    <input name="btn1" type="button" tabindex="3" onclick="check()" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" value="Submit"/>
                </td>
            </tr>
            
        </table>
        </form>
        </div>
                
        <br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
        
        <%
if(session.getAttribute("cant_del")=="cant_del")
        {
                   %><script language="javascript">alert("cant delete, item is in the order table");</script><%
                   session.removeAttribute("cant_del");
        }
else if(session.getAttribute("suc_del")=="suc_del")
        {
                   %><script language="javascript">alert("Item Successfully Deleted");</script><%
                   session.removeAttribute("suc_del");
        }
        %>
        
    </body>
</html>
