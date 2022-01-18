package com.app.controllers;

import com.app.dao.DAOFactory;
import com.app.dao.PostDAO;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetAllPost", value = "/GetAllPost")
public class GetAllPost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAO postDAO =null;
        String numPostQuery = request.getParameter("numPost");
        int numPost=0;
        try{
            postDAO=DaoInstance.daoFactory.getPostDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        List<Post> postList= postDAO.getAllPosts();
        HttpSession session= request.getSession();
        if(numPostQuery!=null){
            numPost=Integer.parseInt(numPostQuery);
            session.setAttribute("numPost",numPost);
            response.sendRedirect("Home.jsp?numPost="+numPost);
        }
        else{
            session.setAttribute("numPost",numPost);
            session.setAttribute("postList",postList);
            response.sendRedirect("GetCategories");
        }

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
