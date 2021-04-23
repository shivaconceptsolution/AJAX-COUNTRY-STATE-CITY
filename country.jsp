<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function showstate(cid)
{
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		document.getElementById("st").innerHTML = xmlhttp.responseText;
	}
	xmlhttp.open("POST","state.jsp?q="+cid,true);
	xmlhttp.send();
}
function showcity(sid)
{
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		document.getElementById("ct").innerHTML = xmlhttp.responseText;
	}
	xmlhttp.open("POST","city.jsp?q="+sid,true);
	xmlhttp.send();
}

</script>
</head>
<body>
<select onchange="showstate(this.value)">
<option value="">Select Country</option>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectcrm","root","");
Statement st = con.createStatement();
ResultSet x = st.executeQuery("select * from country");
while(x.next())
{%>
<option value="<%= x.getString(1) %>"><%= x.getString(2) %></option>
<%
}
%>	
</select>
<br>
<div id="st">
<select>
<option value="">Select State</option>
</select>
</div>

<div id="ct">
<select>
<option value="">Select City</option>
</select>
</div>
</body>
</html>