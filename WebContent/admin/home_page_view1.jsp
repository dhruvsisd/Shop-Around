<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
        function nxt()
        {
            window.location.replace("home_page_view2.jsp");
        }
        </script>
    </head>
    <body>
        
        <%
    Connection con=null;
    ResultSet rs1=null;
    ResultSet rs2=null;
    Statement st1=null;
    Statement st2=null;
    try{
    	con=new ConnectionProvider().setConnection();
        st1= con.createStatement();
        rs1= st1.executeQuery("select * from category where hpv='0'");
        
        st2= con.createStatement();
        rs2= st2.executeQuery("select * from category where hpv='1'");
           
    %>
    
    <script>
            function add()
            {
                var v=document.frm1.s1.value;
                if(v=="")
                    alert("select category");
                else
                    {
                      window.location.replace("home_page_view1_1.jsp?c_id="+v+"&fun=add");
                    }
            }
            function remove()
            {
                var v1=document.frm1.s2.value;
                if(v1=="")
                    alert("select category");
                else
                    {
                     window.location.replace("home_page_view1_1.jsp?c_id="+v1+"&fun=remove");
                    }
            }
       </script>
    
    
    
        
        <div class="shell">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br>
        
        <div align="center">
            <form name="frm1">
          <table width="800" border="0" >
            <tr>
                <th width="520" height="64" scope="col" >
                    <p style="color: red; font-size: 15px"><u><b>HOME PAGE VIEW</b></u></p>
                </th>    
            </tr>
          </table>
            
            <table width="800" height="350" border="0">
                <tr>
                    <th height="40" style=" font-size: 13px;">Categories</th>
                    <th></th>
                    <th style=" font-size: 13px;">Selected Categories</th>
                </tr>
            <tr>
                <th width="198" scope="col" style="border: 1px solid #666666;">      
                    
                    <select name="s1" size="15" style="width: 200px;" >
                        <%       
       while(rs1.next())
         {
            %>    
                    <option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
            <%  
         }    
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
                    <select name="s2" size="15" style="width: 200px;" >
                      <%       
       while(rs2.next())
         {
            %>    
                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
            <%  
         }
               }catch(Exception e){}
        finally
        {
            try
            {
             con.close();
            }catch(Exception e){}
        }
            %>
                    </select>    
                </th>
           </tr>
          </table>
                  
                    <table width="800" height="60" border="0" >
                        <tr>
                            <th>
                            <input type="button" name="btn1" value="Next" onclick="nxt()" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px">
                            </th>
                        </tr>
                    </table>          
         </form>   
        </div>
        
        <br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
