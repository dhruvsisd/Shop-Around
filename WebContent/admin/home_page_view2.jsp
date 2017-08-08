<%@page import="DBConnection.ConnectionProvider"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script>
            var v="";
            function slct()
            {
                v=document.frm1.s1.value;
                window.location.replace("home_page_view2.jsp?name="+v);
            }
            function add()
            {
                v=document.frm1.s1.value;
                if(v=="")
                    alert("select category");
                else
                    {
                v1=document.frm1.s2.value;
                if(v1=="")
                    alert("select item");
                else
                    {
                window.location.replace("home_page_view2_1.jsp?c_id="+v+"&i_id="+v1+"&fun=add");
                    }
                    }
            }
            function remove()
            {
                v=document.frm1.s1.value;
                if(v=="")
                    alert("select category");
                else
                    {
                v1=document.frm1.s3.value;
                if(v1=="")
                    alert("select item");
                else
                    {
                window.location.replace("home_page_view2_1.jsp?c_id="+v+"&i_id="+v1+"&fun=remove");
                    }
                    }
            }
            
            function prv()
            {
              window.location.replace("home_page_view1.jsp");
            }
            
        </script>
    </head>
    <body onload="ld()">
        
        <%
    Connection con=null;
        ResultSet rs1=null;
        Statement st1=null;
        ResultSet rs2=null;
        Statement st2=null;
        ResultSet rs3=null;
        Statement st3=null;
        
    try{
    	con=new ConnectionProvider().setConnection();   st1=con.createStatement();
        st2= con.createStatement(); 
        st3= con.createStatement();       
        try{
        rs1=st1.executeQuery("select * from category where hpv='1'");
        }catch(Exception e){}
        String s=request.getParameter("name");
        int s1=0;
        if(s!="")
          {
           try{
              s1=Integer.parseInt(s);
              rs2= st2.executeQuery("select * from item where c_id='"+s1+"' and hpvi='0'"); 
              }catch(Exception e){}
           try{
              s1=Integer.parseInt(s);
              rs3= st3.executeQuery("select * from item where c_id='"+s1+"' and hpvi='1'"); 
              }catch(Exception e){}              
           }
    %>
    <script>
        function ld()
            {
                document.frm1.s1.value="<%=s%>";
            }
    </script>
        
        <div class="shell">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br>
        <center><p style="color: red; font-size: 15px"><u><b>HOME PAGE VIEW</b></u></p></center>
        <br>
        
        <div align="center">
            <form name="frm1">
          <table width="800" border="0" >
            <tr>
                <td width="300" align="right"><p style=" font-size: 13px; color: #000000;">Select Category</p> </td>
                <th width="300" height="64" scope="col" >
                    
                        <div style=" width: 140px; height: 30px; border: solid 1px #999999;">
                        <select name="s1" STYLE="width: 130px; padding-top: 5px; padding-left: 5px; border: 0">
                        <option value="" onclick="slct()">Select Category</option>
              <%       
       while(rs1.next())
         {
            %>    
                    <option value="<%=rs1.getString(1)%>" onclick="slct()"><%=rs1.getString(2)%></option>
            <%  
         }
            %>
                    </select>  
                        </div>
                    
                </th>    
            </tr>
          </table>
                   
            <table width="800" height="350" border="0">
                <tr>
                    
                    <th height="40" style=" font-size: 13px;">Unselected Items</th>
                    <th></th>
                    <th style=" font-size: 13px;">Selected Items</th>
                </tr>
            <tr>
                <th width="198" scope="col" style="border: 1px solid #666666;">      
                    <select name="s2" size="15" style="width: 200px;" >
                    <%    
          try{                          
           while(rs2.next())
            {               
            %>    
                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(3)%></option>
            <%  
            }}catch(Exception e){}
            %>
                    </select>    
                </th>
                <th width="100" scope="col" style="border: 1px solid #666666;">      
                    <input type="button" onclick="add();" name="btn1" id="btn1" value="Add" style="width: 70px; height: 30px; border:solid 1px #cccccc; background-color: #cccccc; color: black; font-size: 14px"/>
                    <br />
                    <p style="font-size: 13px; color: #000000;">----&gt;</p><br />
                    <br />
                    <input type="button" onclick="remove();" name="btn2" id="btn2" value="Remove" style="width: 70px; height: 30px; border:solid 1px #cccccc; background-color: #cccccc; color: black; font-size: 14px"/>
                    <br />
                    <p style="font-size: 13px; color: #000000;">&lt;----</p><br />
                    <br />
                </th>
                <th width="198" scope="col" style="border: 1px solid #666666;">
                    
                    <select name="s3" size="15" style="width: 200px;" >
                    <%    
          try{                          
           while(rs3.next())
            {               
            %>    
                    <option value="<%=rs3.getString(1)%>"><%=rs3.getString(3)%></option>
            <%  
            }}catch(Exception e){}
            %>
                  </select>   
            <%
               }catch(Exception e){}
        finally
        {
            try
            {
             con.close();
            }catch(Exception e){}
        }
            %> 
                     
                </th>
           </tr>
          </table>
          
         <table width=400" height="60" border="0" >
                        <tr>
                            <th><input type="button" name="btn1" value="Previous" onclick="prv()" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></th>
                        </tr>
         </table>                
                    
         </form>   
        </div>
        
        <br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
        <%
if(session.getAttribute("over")=="over")
        {
                   %><script language="javascript">alert("cant add more than 3 items/category");</script><%
                   session.removeAttribute("over");
        }
%>
    </body>
</html>
