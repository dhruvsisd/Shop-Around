<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="ld()">
        <div class="shell">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br><br>
        <table border="0" style=" margin-left: 278px">
            <tr>
                <td><p style="color: red; font-size: 15px"><u><b>EDIT ITEM INFORMATION- PAGE 2</b></u></p></td>
            </tr>
        </table>
        <br><br><br>
        <%
        String no=session.getAttribute("c_id").toString();
        String i_id=session.getAttribute("i_id").toString();
        //session.setAttribute("i_id",i_id);
        String str=""; 
        Connection con = null;
        Statement st = null;
        Statement st1 = null;
        Statement st2 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        int rowCount=0;
        ResultSetMetaData metaData=null;

        try {
        	con=new ConnectionProvider().setConnection();
            st = con.createStatement();
            st1 = con.createStatement();
            st2 = con.createStatement();
            String sql1 = "select c_name from category where c_id="+no+"";
            rs1 = st1.executeQuery(sql1);
            rs1.next();
            str= rs1.getString(1);
            
            String sql = "select * from "+str+" where i_id='"+i_id+"'";
            rs = st.executeQuery(sql);
            metaData = rs.getMetaData();
            rowCount = metaData.getColumnCount();
            rs.next();
            
            rs2= st2.executeQuery("select * from item where i_id='"+i_id+"'");  
            rs2.next();
           
        %>
        
        <script>
           function ld()
           {    
              <%try{
              for (int i = 1; i < rowCount; i++)  
                { 
                if(rs.getString(i+1)!=null){
              %>
               document.frm1.<%=metaData.getColumnName(i + 1)%>.value="<%=rs.getString(i+1)%>";
              <%  } } }catch(Exception e){}        
              %>
           }
        </script>
        
     <div  align="center">
         <form name="frm1" ENCTYPE="multipart/form-data" action="../edit_item2" method="post">
             <input type="hidden" name="category" value="<%=str%>">
        <table border="0">
            <tr>
                <td width="200" height="40" style=" color: #000000; font-size: 14px">item name</td>
                <td width="200" style=" color: #000000; font-size: 13px"><%=rs2.getString(3)%></td>
            </tr>
            <tr>
                <td height="40" style=" color: #000000; font-size: 14px">category</td>
                <td style=" color: #000000; font-size: 13px"><%=str%></td>
            </tr>
            <tr>
                <td height="40" style=" color: #000000; font-size: 14px">brand</td>
                <td style=" color: #000000; font-size: 13px"><%=rs2.getString(5)%></td>
            </tr>
            
                <%
                for (int i = 1; i < rowCount; i++) 
                {
                    String nt=metaData.getColumnName(i+1).toLowerCase();
                    int len=nt.length();
                    String st3="";
                    for(int j=0;j<len;j++)
                    {
                     char cm=nt.charAt(j);   
                     if(cm=='_')
                         {
                          st3=st3+" ";
                         }
                     else
                         {
                          st3=st3+cm;
                         }
                     }      
                %>
              
                <tr>
                <td height="40" style=" color: #000000; font-size: 14px"><%=st3%></td>
                <td><input type="text" name="<%=metaData.getColumnName(i + 1)%>" style=" height: 27px; border:solid 1px #999999" size="35"></td>
                </tr>
                <%
                }
             }catch (Exception e) {}
             finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }     

                %>
                
            <tr>
                
                <td height="60"></td>
                <td><input type="submit" name="btn1" value="Next" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
                
            </tr>
        </table>
                </form>
     </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@include file="footer.jsp"%>
    </div>
    
    
    
    
     </body>
</html>
