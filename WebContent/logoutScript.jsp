<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 
 String error= request.getParameter("error");
String success= request.getParameter("success");

session.invalidate();

if(error != null)
{
	response.sendRedirect("index.jsp?error="+error);	
}
else if(success != null)
{
	response.sendRedirect("index.jsp?success="+success);	
}
else
{
	response.sendRedirect("index.jsp");	
}
   
%>