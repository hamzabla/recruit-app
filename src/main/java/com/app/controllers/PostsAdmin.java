package com.app.controllers;

import com.app.dao.PostDAO;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PostsAdmin", value = "/PostsAdmin")
public class PostsAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAO postDAO =null;
        try{
            postDAO=DaoInstance.daoFactory.getPostDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        List<Post> postList= postDAO.getAllPosts();
        HttpSession session= request.getSession();
        session.setAttribute("postList",postList);
        response.sendRedirect("Admin/HomeAdmin.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
