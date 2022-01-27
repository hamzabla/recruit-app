<%@ page import="com.app.models.Admin" %>
<%@ page import="com.app.models.Post" %>
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

<div class="container-fluid" style="margin-top: 20px">
    <div class="px-lg-5">

        <div class="row">
            <%
                List<Post> postListAll = (List<Post>) session.getAttribute("postList");
                for(int i=0;i<postListAll.size();i++){
            %>
            <!-- Gallery item -->
            <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                <div class="bg-white rounded shadow-sm">
                    <div>
                    <iframe width="320" height="240" src="../videos/<%=Paths.get(postListAll.get(i).getVideo()).getFileName().toString()%>" frameborder="0"
                            allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="p-4">
                        <h5> <%=postListAll.get(i).getFirstnameCand()%> <%=postListAll.get(i).getLastnameCand()%>
                            <p class="badge badge-primary px-3 rounded-pill font-weight-normal"><%=postListAll.get(i).getCategory()%></p></h5>
                        <p class="small text-muted mb-0"><%=postListAll.get(i).getPost()%></p>
                        <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
                            <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold">Likes number :<%=postListAll.get(i).getLikes()%></span></p>
                            <div><button type="button" class="btn btn-danger">Delete Post</button></div>
                        </div>
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