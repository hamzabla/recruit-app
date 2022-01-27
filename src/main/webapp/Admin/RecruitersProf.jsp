<%@ page import="com.app.models.Admin" %>
<%@ page import="com.app.models.Recruiter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.Paths" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26/01/2022
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../style/css/adminPanel.css" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/2ccfec0d12.js" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <title>Employ | Work Marketplace.</title>

</head>

<body>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null ) {
%>
<div class="alert alert-danger" role="alert">
    Sorry you can't acces to this page !
</div>
<%
}else {
%>
<%@ include file="Navbar.jsp" %>

<div class="container-fluid">
    <div class="px-lg-5">

        <div class="row">

            <%
                List<Recruiter> recruiterList = (List<Recruiter>) session.getAttribute("recruiterList");
                for(int i=0;i<recruiterList.size();i++){
            %>
            <!-- Gallery item -->
            <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                <div class="bg-white rounded shadow-sm">
                    <%if(recruiterList.get(i).getImg()!=null){%>
                    <img src="../img/<%=Paths.get(recruiterList.get(i).getImg()).getFileName().toString()%>" alt="" class="img-fluid card-img-top">
                    <%}else{%>
                    <img src="https://bootstrapious.com/i/snippets/sn-gallery/img-2.jpg" alt="" class="img-fluid card-img-top">
                    <%}%>
                    <div class="p-4">
                        <h5><i class="fas fa-user-tag"></i> <%=recruiterList.get(i).getFirstNameRec()%> <%=recruiterList.get(i).getLastNameRec()%> </h5>
                        <h6><i class="fas fa-venus-mars"></i> <%=recruiterList.get(i).getSexeRec()%></h6>
                        <h6><i class="fas fa-briefcase"></i> years of experience : <%=recruiterList.get(i).getExperienceRec()%></h6>
                        <h6><i class="fas fa-building"></i> <%=recruiterList.get(i).getEntrepriseRec()%></h6>
                        <p class="small text-muted mb-0"><i class="fas fa-user-edit"></i>
                            <%=recruiterList.get(i).getDescriptionRec()%></p>
                        <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
                            <button type="button" class="btn btn-danger">Delete Profile</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End -->
            <%}%>

        </div>

    </div>
</div>
<%}%>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>