<%@ page import="com.app.models.Admin" %>
<%@ page import="com.app.models.Candidate" %>
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
                List<Candidate> candidateList = (List<Candidate>) session.getAttribute("candidateList");
                for(int i=0;i<candidateList.size();i++){
            %>
            <!-- Gallery item -->
            <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                <div class="bg-white rounded shadow-sm">
                    <%if(candidateList.get(i).getImage()!=null){%>
                    <img src="../img/<%=Paths.get(candidateList.get(i).getImage()).getFileName().toString()%>" alt="" class="img-fluid card-img-top">
                    <%}else{%>
                    <img src="https://bootstrapious.com/i/snippets/sn-gallery/img-2.jpg" alt="" class="img-fluid card-img-top">
                    <%}%>
                    <div class="p-4">
                        <h5><i class="fas fa-user-tag"></i> <%=candidateList.get(i).getFirstNameCan()%> <%=candidateList.get(i).getLastNameCan()%> </h5>
                        <h6><i class="fas fa-venus-mars"></i> <%=candidateList.get(i).getSexeCan()%></h6>
                        <h6><i class="fas fa-graduation-cap"></i> <%=candidateList.get(i).getSchool()%></h6>
                        <h6><i class="fas fa-map-marked-alt"></i> <%=candidateList.get(i).getLocation()%></h6>
                        <p class="small text-muted mb-0"><i class="fas fa-user-edit"></i>
                            <%=candidateList.get(i).getDescription()%></p>
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