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
            <div style="min-height: 600px">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        
        
        <br><br><br><br><br>
        <div align="center"><p style="color: red; font-size: 15px"><u><b>ITEM DETAILS</b></u></p></div>
        <br>
        
        <%
        String category=request.getParameter("cat");
        String i_id=request.getParameter("i_id");
        
        String str="";
        String str1="";
        Connection con = null;
        Statement st = null;
        Statement st1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        
        int rowCount=0;
        int rowCount1=0;
        ResultSetMetaData metaData=null;
        ResultSetMetaData metaData1=null;
        try {
        	con=new ConnectionProvider().setConnection();
            st = con.createStatement();
            st1 = con.createStatement();
            String sql = "select * from item where i_id="+i_id+"";
            rs = st.executeQuery(sql);
            rs.next();
            
            String sql1 = "select * from "+category+" where i_id="+i_id+"";
            rs1 = st1.executeQuery(sql1);
            rs1.next();
            
            metaData = rs.getMetaData();
            rowCount = metaData.getColumnCount();
            
            metaData1 = rs1.getMetaData();
            rowCount1 = metaData1.getColumnCount();
        %>
        
        <div  align="right">
            <table border="0" style="float: left; padding-left:40px ">
                <tr>
                    <td width="200" height="200" style="border: 1px solid #777;">
                        <img src="../home_page/image.jsp?i_id=<%=i_id%>" style="padding-left:55px;"/>
                    </td>
                </tr>
            </table>
            <table border="0" style="padding-right:70px ">
                <%
                for (int i = 1; i <=rowCount; i++) 
                {  
                    if(i==2)
                        i++;
                    str=metaData.getColumnName(i);
                    if(str.equalsIgnoreCase("i_id"))
                        str="item id";
                    else if(str.equalsIgnoreCase("i_name"))
                        str="item name";
                    else if(str.equalsIgnoreCase("c_id"))
                        str="category";
                    else
                       {
                        String nt=metaData.getColumnName(i).toLowerCase();
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
                    str=st3;
                       }
                    str1=rs.getString(i);
                    if(metaData.getColumnName(i).equalsIgnoreCase("c_id"))
                        str1=category;
                    if(metaData.getColumnName(i).equalsIgnoreCase("add_date"))
                        str1=rs.getString(i).substring(0, 10);
                %>
                <tr>
                <td width="300" height="40" style=" color: #000000; font-size: 14px"><%=str%></td>
                <td width="300" height="40" style=" color: #000000; font-size: 13px"><%=str1%></td>
                </tr>
                <%
                }
               try{
                for (int i = 2; i <=rowCount1; i++) 
                { 
                    String nt=metaData1.getColumnName(i).toLowerCase();
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
                    
                    String st4=rs1.getString(i);
                    if(rs1.getString(i)==null)
                        st4="";
                %>
                <tr>
                <td width="300" height="40" style=" color: #000000; font-size: 14px"><%=st3%></td>
                <td width="300" height="40" style=" color: #000000; font-size: 13px"><%=st4%></td>
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
        
            </div>
        <%@include file="footer.jsp"%>
        </div>
        
    </body>
</html>
