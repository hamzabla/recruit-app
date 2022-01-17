package com.app.controllers;

import com.app.dao.PostDAO;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetAllPostByCategory", value = "/GetAllPostByCategory")
public class GetAllPostByCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rq;
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        PostDAO postDAO =null;
        try{
            postDAO=DaoInstance.daoFactory.getPostDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        List<Post> postListByCategory= postDAO.getAllPostsByCategory(idCategory);
        HttpSession session= request.getSession();
        session.setAttribute("postListByCategory",postListByCategory);
        rq = request.getRequestDispatcher("Home.jsp?idCategory="+idCategory);
        rq.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
//        PostDAO postDAO =null;
//        try{
//            postDAO=DaoInstance.daoFactory.getPostDAO();
//        }
//        catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        List<Post> postListBycategory= postDAO.getAllPostsByCategory(idCategory);
//        HttpSession session= request.getSession();
//        session.setAttribute("postListBycategory",postListBycategory);
//        response.sendRedirect("Home.jsp?idCategory="+idCategory);
    }
}
