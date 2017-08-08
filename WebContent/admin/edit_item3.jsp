<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function chk()
            {
                if(document.frm1.F1.value=="")
                    alert("Enter Image File");
               else
                   document.frm1.submit();
            }
        </script>
    </head>
    <body>
        <div class="shell">
        <%
            String fname=session.getAttribute("i_id").toString();
            String no=session.getAttribute("c_id").toString();
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            
            try {
            	con=new ConnectionProvider().setConnection();
            st = con.createStatement();
            
            rs= st.executeQuery("select * from item,category where category.c_id=item.c_id and i_id='"+fname+"'");  
            rs.next();
            
            
        %>    
        
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br><br>
        <table border="0">
            <tr>
                <td width="140"><h2></h2></td>
                <td><p style="color: red; font-size: 15px"><u><b>EDIT ITEM INFORMATION- PAGE 3</b></u></p></td>
            </tr>
        </table>
        <br><br><br><br>
        
        <table width="960" height="200" border="0">
            <tr>
                <td width="140">&nbsp;</td>
                <td width="200" height="200" style="border: 1px solid #777;">
                        <img src="../home_page/image.jsp?i_id=<%=fname%>" style="padding-left:55px;"/>
                </td>
                
                <td style="padding-left:55px; padding-bottom: 20px; color: #000000;">
                    <p style="font-size: 15px"><u>Change Image Icon-</u></p><br><br>
                <p style=" font-size: 13px">
                    Item Name- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(3)%><br><br>
                    Category Name- &nbsp;<%=rs.getString("c_name")%><br><br>
                    Brand Name- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(5)%><br><br></p>
                <form name="frm1" ENCTYPE="multipart/form-data" action="../edit_item3" method="post">
                    <input type="hidden" name="i_id" value="<%=fname%>">    
                    <INPUT NAME="F1" TYPE="file" size="35"><p style="color: #000000; font-size: 12px;">*Dimension should be 125*100</p><br><br>
                    <input type="button" name="btn1" value="Save" onclick="chk()" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px">
                </form>            
                </td>
            </tr>
            
        </table>
        <%
        } catch (Exception e) {}
            finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }     
        %>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@include file="footer.jsp"%>
    </div>
    
    <%
if(session.getAttribute("suc")=="suc")
        {
                   %><script language="javascript">alert("Successfully Updated");</script><%
                   session.removeAttribute("suc");
        }
%>
    
    </body>
</html>
