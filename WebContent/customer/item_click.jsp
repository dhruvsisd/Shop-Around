<%@page contentType="text/html" import="java.sql.*,DBConnection.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
        <script>
            function buy()
            {
                window.location.replace("buy_item.jsp");
            }
            </script>
    </head>
    <body>
        <div class="shell">
            <%
            String i_id=request.getParameter("i_id");
            session.setAttribute("i_id", i_id);
            Connection con = null;
        Statement st[]=new Statement[3];
        ResultSet rs[]=new ResultSet[3];
        int rowCount=0;
        ResultSetMetaData metaData=null;
        
        try {
           con=new ConnectionProvider().setConnection();
            for(int i=0;i<3;i++)
              st[i]=con.createStatement();
            
            rs[0] = st[0].executeQuery("select * from item where i_id='"+i_id+"'");
            rs[0].next();
            
            rs[1] = st[1].executeQuery("select c_name from category where c_id='"+rs[0].getString(4) +"'");
            rs[1].next();
            
            rs[2] = st[2].executeQuery("select * from "+rs[1].getString(1)+" where i_id='"+i_id+"'");
            rs[2].next();
            metaData = rs[2].getMetaData();
            rowCount = metaData.getColumnCount();
              
            %>
            
                
            
        <%@include file="header.jsp"%>
        <br><br><br><br><br>
        <table width="960" border="0">
            <tr>
                <td width="150">&nbsp;</td>
                <td width="220" height="220" style="border: 2px solid #777;">
                        <img src="image.jsp?i_id=<%=i_id%>" style="padding-left:55px;"/>
                </td>
                
                <td style="padding-left:55px; padding-bottom: 20px">
                <h1><%=rs[0].getString(3).toUpperCase()%></h1>
                <br>
                <% if(rs[0].getInt(14)>0) { %>
                  <div style="text-decoration: blink; color: red;">Discount <%=rs[0].getInt(14)%> %</div>
                <% } %>
                <br>
                <% if(rs[0].getInt(14)==0) { %>
                <h2>Rs. <%=rs[0].getString(10)%></h2>
                <% }else {
                      int new_price=rs[0].getInt(10)-(rs[0].getInt(10)*rs[0].getInt(14)/100);
                  %>
                <h2>Rs. <strike><%=rs[0].getString(10)%></strike> <%=new_price%></h2>
                <% }%>
                <br><br>
                
                <%if(rs[0].getInt(6)!=0){%>
                <button name="bt1" style="width: 80px; height: 35px; background-color: #990000; color: white" onclick="buy()">Buy</button>
                <% }else { %>
                <h2 style=" color: #990000"><u>Out of Stock</u></h2>
                <% } %>
                </td>
            </tr>
            <tr>
                <td height="50">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td height="50">&nbsp;</td>
                <td colspan="2"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>GENERAL SPECIFICATIONS-</u></h2></td>
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
                <td height="40">&nbsp;</td>
                <td><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=st1%></h2></td>
                <td><h2><%=rs[2].getString(i)%></h2></td>
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
        
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        
    </body>
</html>
