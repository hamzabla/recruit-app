package com.app.controllers;

import com.app.dao.LikesDAO;
import com.app.dao.PostDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "removeLike", value = "/removeLike")
public class removeLike extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int postId= Integer.parseInt(request.getParameter("postId"));
        int likeId= Integer.parseInt(request.getParameter("likeId"));
        LikesDAO likesDAO =null;
        PostDAO postDAO =null;
        try{
            likesDAO=DaoInstance.daoFactory.getLikesDao();
            postDAO=DaoInstance.daoFactory.getPostDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        postDAO.decrementPostLike(postId);
        likesDAO.deleteLike(likeId);

    }
}
