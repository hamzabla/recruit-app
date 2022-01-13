<%@ page import="com.app.models.Recruiter" %>
<%@ page import="com.app.models.Candidate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Recruiter recruiter = (Recruiter) session.getAttribute("recruiter");
    Candidate candidate = (Candidate) session.getAttribute("candidate");
%>
<html>
<head>
    <title>Recruiting Platform</title>
</head>
<body>
<% if(recruiter!=null){ %>
<center><h1>Hello <% out.println(recruiter.getFirstNameRec()); %> !Welcome to dashboard</h1></center>
<center><h2>You are a recruiter.</h2></center>
<% } %>
<% if(candidate!=null){%>
<center><h1>Hello <% out.println(candidate.getFirstNameCan()); %> !Welcome to dashboard</h1></center>
<center><h2>You are a candidate.</h2></center>
<% } %>
</body>
</html>
