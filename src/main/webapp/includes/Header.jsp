<%@ page import="com.app.models.Recruiter" %>
<%@ page import="com.app.models.Candidate" %><%--
  Created by IntelliJ IDEA.
  User: najiy
  Date: 1/2/2022
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<header class='mx-auto sticky top-0 z-50 grid grid-cols-2 bg-none bg-white shadow-lg py-4 px-10'>
    <a href="/">
        <img
                src="img/employ_logo.png"
                class="relative h-14 items-center cursor-pointer my-auto ml-60"
        />
    </a>
    <%  Recruiter recruiter = (Recruiter) session.getAttribute("recruiter");
        Candidate candidate = (Candidate) session.getAttribute("candidate");
        if (recruiter == null && candidate == null) {
    %>

    <div class='flex space-x-4 items-center justify-end text-gray-600 mr-60'>
        <a href="Login.jsp" class=' ring-1 ring-green-500 cursor-pointer font-semibold bg-white py-2 px-4 hover:ring-green-600 font-body text-gray-500 rounded-full '>
            Log In
        </a>
        <a href="prf.jsp" class='cursor-pointer font-semibold bg-green-500 text-white py-2 px-4 hover:bg-green-600 font-body rounded-full '>
            Sign Up
        </a>
    </div>

    <%
    }
    else{
    %>
    <div class='flex space-x-4 items-center justify-end text-gray-600 mr-60'>
        <a href="Logout" class=' ring-1 ring-green-500 cursor-pointer font-semibold bg-white py-2 px-4 hover:ring-green-600 font-body text-gray-500 rounded-full '>
            Log Out
        </a>
    </div>

    <%
        }
    %>

</header>