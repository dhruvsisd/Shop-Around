<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div align="center"><p style="color: red; font-size: 15px"><u><b>CATEGORY DETAILS</b></u></p></div>
        <br><br><br>
        
        <%
        String category=request.getParameter("name");
        String c_id=request.getParameter("c_id");
        String no=request.getParameter("no");
        
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
        
        <div  align="right">
            
            <table border="0" style="padding-right:70px ">
                <tr>
                    <td width="300" height="40" style="color: #000000; font-size: 14px;">Category Id</td>
                <td width="300" height="40" style=" font-size: 14px; color: #000000"><%=c_id%></td>
                </tr>
                <tr>
                <td width="300" height="40" style="color: #000000; font-size: 14px;">Category Name</td>
                <td width="300" height="40" style=" font-size: 14px; color: #000000"><%=category%></td>
                </tr>
                <tr>
                <td width="300" height="40" style="color: #000000; font-size: 14px;">No Of Items</td>
                <td width="300" height="40" style=" font-size: 14px; color: #000000"><%=no%></td>
                </tr>
                <%
               try{
                for (int i = 2; i <=rowCount; i++) 
                { 
                    String nt=metaData.getColumnName(i).toLowerCase();
                    int len=nt.length();
                    String st1="";
                    for(int j=0;j<len;j++)
                    {
                     char cm=nt.charAt(j);   
                     if(cm=='_')
                         {
                          st1=st1+" ";
                         }
                     else
                         {
                          st1=st1+cm;
                         }
                     }     
                %>
                <tr>
                <td width="300" height="40" style="color: #000000; font-size: 14px;">Description<%=(i-1)%></td>
                <td width="300" height="40" style=" font-size: 14px; color: #000000"><%=st1%></td>
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
        </table>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
