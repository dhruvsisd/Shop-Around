<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        <br><br><br><br><br>
        <table border="0" style=" margin-left: 315px">
            <tr>
                <td><p style="color: red; font-size: 15px"><u><b>ADD ITEM DETAILS</b></u></p></td>
            </tr>
        </table>
        <br><br>
        <%
        String no=request.getParameter("c_id");
        String i_id=request.getParameter("i_id");
        session.setAttribute("i_id", i_id);
        String str=""; 
        Connection con = null;
        Statement st = null;
        Statement st1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        
        int rowCount=0;
        ResultSetMetaData metaData=null;

        try {
        	con=new ConnectionProvider().setConnection();
            st = con.createStatement();
            st1 = con.createStatement();
            String sql1 = "select c_name from category where c_id="+no+"";
            rs1 = st1.executeQuery(sql1);
            rs1.next();
            str= rs1.getString(1);
            String sql = "select * from "+str+"";
            rs = st.executeQuery(sql);
            metaData = rs.getMetaData();
            rowCount = metaData.getColumnCount();
            

        %>
        
        
     <div  align="center">
         <form name="frm1" ENCTYPE="multipart/form-data" action="../add_item_detail" method="post">
             <input type="hidden" name="category" value="<%=str%>">
        <table border="0">
            <tr>
                
                <td width="114" height="40" style=" color: #000000; font-size: 14px">category</td>
                <td width="114" height="40" style=" color: #000000; font-size: 13px"><%=str%></td>
            </tr>
            
                <%
                for (int i = 1; i < rowCount; i++) 
                {
                    String nt=metaData.getColumnName(i+1).toLowerCase();
                    int len=nt.length();
                    String st2="";
                    for(int j=0;j<len;j++)
                    {
                     char cm=nt.charAt(j);   
                     if(cm=='_')
                         {
                          st2=st2+" ";
                         }
                     else
                         {
                          st2=st2+cm;
                         }
                     }       
                %>
                <tr>
                <td width="114" height="40" style=" color: #000000; font-size: 14px"><%=st2.toLowerCase()%></td>
                <td width="114" height="40"><input type="text" name="<%=metaData.getColumnName(i + 1)%>" style=" height: 27px; border:solid 1px #999999" size="40"></td>
                </tr>
                <%
                }
            } catch (Exception e) {}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }     
                %>
                
            <tr>
                
                <td width="114" height="60"></td>
                <td width="114"><input type="submit" name="btn1" value="Submit" style="width: 80px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px"></td>
            </tr>
        </table>
                </form>
     </div>
    <br><br><br><br><br><br><br><br><br><br>
    
    <%@include file="footer.jsp"%>
    </div>
    
    
    
    
     </body>
</html>
