<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
                function dlt(no,c_id)
                {
                    var r=confirm("Are you sure!");
                    if (r==true)
                      {
                        window.location.replace("delete_field.jsp?no="+no+"&c_id="+c_id+"");
                      }
                }
           </script>   
    </head>
    <body onload="ld()">
        <div class="shell">
            <div style="min-height: 600px">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        
        
        <br><br><br><br><br>
        <div align="center"><p style="color: red; font-size: 15px"><u><b>EDIT CATEGORY INFORMATION</b></u></p></div>
        <br><br>
        
        <%
        String category=request.getParameter("name");
        String c_id=request.getParameter("c_id");
   
        
        String str="";
        String str1="";
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
      
        int rowCount=0;
        ResultSetMetaData metaData=null;
        try {
        	con=new ConnectionProvider().setConnection();
            st = con.createStatement();
            String sql = "select * from "+category+"";
            rs = st.executeQuery(sql);
            rs.next();
            
            metaData = rs.getMetaData();
            rowCount = metaData.getColumnCount();
              

        %>
        <script>
         function check()
         {
             var b="";
             var c="";
             var d=0;
        <%for (int i = 1; i < rowCount; i++){%>     
        if(document.frm1.<%=metaData.getColumnName(i + 1)%>.value=="")
            {
                b="Empty field cant be added";
            }
        <%for (int j =i+1 ; j < rowCount; j++){%> 
         if(document.frm1.<%=metaData.getColumnName(i + 1)%>.value.toLowerCase()==document.frm1.<%=metaData.getColumnName(j + 1)%>.value.toLowerCase())
            {
                c="Same description cant be added";
            }   
        
        <%}%>
            var stt=document.frm1.<%=metaData.getColumnName(i + 1)%>.value;
            var len=stt.length;
        var i=0;
        var st1="";
        var ch1=0;
        for(i=0;i<len;i++)
            {
             if(stt.charAt(i)==" ")
                 {
                     if(ch1==0)
                         {
                          st1=st1+"";
                          ch1=0;
                         }
                     else
                         {
                          st1=st1+"_";
                         }
                 }
             else
               {
                    st1=st1+stt.charAt(i);
                    ch1=1;
               }
            }
            document.frm1.<%=metaData.getColumnName(i + 1)%>.value=st1;
        <%}%>
        if(b.length!=0)
            {
                alert(b);
            }
        else if(c.length!=0)
            {
                alert(c);
            }
        else if(d==1)
            {
                alert("use '_' in between two words");
            }
        else
            {
             document.frm1.submit();   
            }
         }
  
           function ld()
           {    
              <%try{
              for (int i = 1; i < rowCount; i++)  
                { %>
                        document.frm1.<%=metaData.getColumnName(i + 1)%>.value="<%=metaData.getColumnName(i + 1)%>".toLowerCase();
              <%  } }catch(Exception e){}        
              %>
           }
        </script>
        <div  align="center">
            <form name="frm1" ENCTYPE="multipart/form-data" action="../edit_category" method="post">
                <input type="hidden" name="categ" value="<%=category%>">
            <table border="0">
                <tr>
                <td width="180" height="40" style=" font-size: 14px; color: #000000">Category Id</td>
                <td width="90" height="40" style=" font-size: 13px; color: #000000"><%=c_id%></td>
                </tr>
                <tr>
                <td height="40" style=" font-size: 14px; color: #000000">Category Name</td>
                <td height="40" style=" font-size: 13px; color: #000000"><%=category%></td>
                </tr>
                
                <%
               try{
                for (int i = 1; i < rowCount; i++) 
                { 
                %>
                <tr>
                <td height="40" style=" font-size: 14px; color: #000000">Description<%=(i)%></td>
                <td height="40"><input type="text" name="<%=metaData.getColumnName(i + 1)%>" style=" height: 27px; border:solid 1px #999999" size="35"></td>
                <td width="60" height="40" align="center"><a href="#" onclick="dlt(<%=(i+1)%>,<%=c_id%>)"><img src="images/close.png" width="27" height="27"/></a></td>
                </tr>
                <%
                }}catch(Exception e){}
            } catch (Exception e) {}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }   
                %>
                <tr>
                <td height="40"></td>
                <td><a href="edit_category_add_field.jsp?c_id=<%=c_id%>&name=<%=category%>">add more descriptions</a></td>
                </tr>
                <tr>
                <td height="60"></td>
                <td><input name="btn1" type="button" style="width: 80px; height: 28px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" value="Submit" onclick="check()"/></td>
                </tr>
        </table>
                <input type="hidden" name="chk">
        </form>
        </div>
            </div>
        <%@include file="footer.jsp"%>
        
        <%
if(session.getAttribute("suc_cat")=="suc_cat")
        {
                   %><script language="javascript">alert("Successfully updated");</script><%
                   session.removeAttribute("suc_cat");
        }
%>
        
        </div>
    </body>
</html>
