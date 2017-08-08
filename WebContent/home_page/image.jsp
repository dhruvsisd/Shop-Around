<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="java.lang.*" %>
<%@page  import="java.sql.*,DBConnection.*" %>
<%@page import="java.awt.image.BufferedImage" %> 
<%@page import="javax.imageio.*" %>
<html>
    <head>
        <title>upload</title>
    </head>
	
<body>           
<%
Connection con=null;
try{
con=new ConnectionProvider().setConnection();
Statement st=con.createStatement();
String fname=request.getParameter("i_id");
String sql="select * from item_image where i_id='"+fname+"'";

ResultSet rs=st.executeQuery(sql);
 
while(rs.next())
  {
    InputStream is=rs.getBinaryStream("IMAGE_ICON");
    FileOutputStream fos=new FileOutputStream(fname);
    int i=is.read();
    while (i!=-1)
    {
     fos.write(i);
     i=is.read();
    }
  }

BufferedInputStream buf=null;
ServletOutputStream myOut=null;
try{
    myOut = response.getOutputStream();
    File myfile = new File(fname);
    response.setContentType("image/jpg"); 
    FileInputStream input = new FileInputStream(myfile);
    buf = new BufferedInputStream(input);
    int readBytes = 0;
    //read from the file; write to the ServletOutputStream
    while((readBytes = buf.read()) != -1)
    myOut.write(readBytes);
    } catch (IOException ioe)
      {
        throw new ServletException(ioe.getMessage( ));  
      } finally 
               {   
                 if (myOut != null)
                     myOut.close( );
                 if (buf != null)
                     buf.close( );
               } 
    }catch(Exception e){}
    finally
       {
        try{
            con.close();
           }catch(Exception e){}
       }
out.clear(); // where out is a JspWriter
out = pageContext.pushBody();
%>               
</body>  
</html>