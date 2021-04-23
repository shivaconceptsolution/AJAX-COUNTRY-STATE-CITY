<%@page import="java.sql.*" %>   
<select>
<option value="">Select City</option>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectcrm","root","");
Statement st = con.createStatement();
ResultSet x = st.executeQuery("select * from city where stateid='"+request.getParameter("q")+"'");
while(x.next())
{%>
<option value="<%= x.getString(1) %>"><%= x.getString(2) %></option>
<%
}
%>	
</select>