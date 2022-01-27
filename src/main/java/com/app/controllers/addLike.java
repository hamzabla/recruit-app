package com.app.controllers;

import com.app.dao.LikesDAO;
import com.app.dao.PostDAO;
import com.app.models.Candidate;
import com.app.models.Like;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "addLike", value = "/addLike")
public class addLike extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Candidate candidate = (Candidate) session.getAttribute("candidate");
        Recruiter recruiter = (Recruiter) session.getAttribute("recruiter");
        int postId= Integer.parseInt(request.getParameter("postId"));
        LikesDAO likesDAO =null;
        PostDAO postDAO =null;
        try{
            likesDAO=DaoInstance.daoFactory.getLikesDao();
            postDAO=DaoInstance.daoFactory.getPostDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        postDAO.incrementPostLike(postId);

        if (candidate!=null){
            Like like =new Like();
            like.setLiker("candidate");
            like.setPostId(postId);
            like.setCandidateId(candidate.getIdCan());
            likesDAO.addCandidateLike(like);

        }
        else if (recruiter!=null){
            Like like =new Like();
            like.setLiker("recruiter");
            like.setPostId(postId);
            like.setRecruiterId(recruiter.getIdRec());
            likesDAO.addRecruiterLike(like);
        }

    }
}
