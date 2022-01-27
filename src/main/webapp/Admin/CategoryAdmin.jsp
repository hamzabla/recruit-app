<%@ page import="com.app.models.Admin" %>
<%@ page import="com.app.models.Candidate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="com.app.models.Category" %><%--
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
    <link rel="stylesheet" href="../style/css/categoryPanel.css" >
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

<div class="container" style="margin-top: 20px">
    <div class="row">
        <%
            List<Category> categoryList = (List<Category>) session.getAttribute("categoryList");
            if (categoryList!=null){
                for(int i=0;i<categoryList.size();i++){
        %>
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20"><%=categoryList.get(i).getCategory()%></h6>
                    <p class="m-b-0"><%=categoryList.get(i).getCategoryDesciption()%></p>
                    <a href="#" class="mr-1" data-toggle="modal" data-target="#Modaldelete<%=i%>"><i class="fa fa-trash remove-note"></i></a>
                    <a href="#" class="mr-1" data-toggle="modal" data-target="#Modalupdate<%=i%>"><i class="far fa-edit"></i></a>
                </div>
            </div>
        </div>
        <!--start modal delete-->
        <div class="modal fade" id="Modaldelete<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="Modaldelete">Delete Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Etes vous sûre de vouloire supprimer la categorie : <%=categoryList.get(i).getCategory()%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <form method="post" action="#">
                        <button type="delete" class="btn btn-outline-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--start modal update-->
        <div class="modal fade" id="Modalupdate<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="Modalupdate">Update Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="../UpdateCategory" method="post">
                    <div class="modal-body">
                            <input name="idCategory" value="<%=categoryList.get(i).getIdCategory()%>" hidden/>
                            <input type="text" name="category" value="<%=categoryList.get(i).getCategory()%>" class="form-control" style="margin-bottom: 10px" required/>
                           <input type="text" name="categoryDescription" value="<%=categoryList.get(i).getCategoryDesciption()%>" class="form-control form-control-lg" required/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-info">Save changes</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
<!--end-->

        <!--start add new category-->
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h2>Add a new Category</h2>
                    <h6 class="m-b-20 text-right"><a href="#" data-toggle="modal" data-target="#Modaladd"><i class="fas fa-plus"></i></a></h6>
                </div>
            </div>
        </div>

        <div class="modal fade" id="Modaladd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="Modaladded">Update Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="../AddCategoryAdmin" method="post">
                        <div class="modal-body">
                            <input type="text" name="category"  class="form-control" style="margin-bottom: 10px" required/>
                            <input type="text" name="categoryDescription" class="form-control form-control-lg" required/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
       <!-- end new add-->
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-yellow order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Orders Received</h6>
                    <h2 class="text-right"><i class="fa fa-refresh f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Orders Received</h6>
                    <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
    </div>
</div>
<%}%>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>