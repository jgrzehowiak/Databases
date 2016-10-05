<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%  Class.forName("oracle.jdbc.driver.OracleDriver");%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TotalInvestmentReport</h1>
        
        <%
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//129.7.242.225:1521/orcl", "grzehowiakj",
                            "GJ1326612");

            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("SELECT SUM(INV_PRICE * INV_QOH) FROM INVENTORY");
        %>

        <TABLE BORDER="1" BGCOLOR="CCFFFF" width='50%' cellspacing='1' cellpadding='0'   bordercolor="black" border='1'>
            <TR>
                <TH bgcolor='#DAA520'> <font size='2'/>TotalInvestment</TH>
            </TR>

            <% while (resultset.next()) {%>
            <TR>
                <TD> <font size='2'/><center><%= resultset.getDouble(1)%></center></TD>
            </TR>

            <% }%>

        </TABLE>
    </body>
</html>
