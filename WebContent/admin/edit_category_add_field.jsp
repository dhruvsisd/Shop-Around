<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            var cnt=0;
    function generateRow(){
        var d=document.getElementById("div");
        var st=document.frm1.box1.value;
        
        if(st.length==0)
            alert("empty field cant be added");
        else
            {
        var len=st.length;
        var i=0;
        var st1="";
        var ch1=0;
        for(i=0;i<len;i++)
            {
             if(st.charAt(i)==" ")
                 {
                     //var ch=st.charAt(i);
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
                    st1=st1+st.charAt(i);
                    ch1=1;
               }
            }
        
        d.innerHTML+="<input type='text' name="+st1+" value="+st1+" style=' height: 27px; border:solid 1px #999999' size='35'><br><br>";
        cnt++;
        document.frm1.box1.value=null;
            }
    }
    </script>
    </head>
    <body>
        <div class="shell">
            <div style="min-height: 600px">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        
        
        <br><br><br><br><br>
        <div align="center"><p style="color: red; font-size: 15px"><u><b>ADD CATEGORY DESCRIPTION</b></u></p></div>
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
        if(cnt==0)
            alert("no description added");
        else
            {
             document.frm1.submit();   
            }
    }
        </script>
        <div  align="center">
            <form name="frm1" ENCTYPE="multipart/form-data" action="../edit_category_add_field" method="post">
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
                    String nt=metaData.getColumnName(i+1).toLowerCase();
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
                <td height="40" style=" font-size: 14px; color: #000000">Description<%=(i)%></td>
                <td height="40" style=" font-size: 13px; color: #000000"><%=st1%></td>
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
                <td height="40"><div id="div" style="padding-top: 15px;"></div></td>
                </tr>
                
                <tr>
                <td height="40" style=" font-size: 14px; color: #000000">Description</td>
                <td height="40"><input type="text" style=" height: 27px; border:solid 1px #999999" size="35" name="box1"></td>
                <td height="40"><input name="btn" type="button" value="Add" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" onclick="generateRow()"/></td>
                </tr>
                <tr>
                <td height="40"></td>
                <td height="40"><a href="edit_category.jsp?c_id=<%=c_id%>&name=<%=category%>">edit descriptions</a></td>
                </tr>
                <tr>
                <td height="60"></td>
                <td><input name="btn1" type="button" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" value="Submit" onclick="check()"/></td>
                </tr>
        </table>
                <input type="hidden" name="chk">
        </form>
        </div>
            </div>
        <%@include file="footer.jsp"%>
        
        <%
if(session.getAttribute("msg")=="success")
        {
                   %><script language="javascript">alert("Successfully Added");</script><%
                   session.removeAttribute("msg");
        }
else if(session.getAttribute("msg")=="notcreated")
        {
                   %><script language="javascript">alert("same description/empty description/reserved word cant be used");</script><%
                   session.removeAttribute("msg");
        }
%>
        
        </div>
    </body>
</html>
