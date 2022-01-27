package com.app.controllers;

import com.app.dao.CandidateDAO;
import com.app.dao.RecruiterDAO;
import com.app.models.Candidate;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetRecruitersAdmin", value = "/GetRecruitersAdmin")
public class GetRecruitersAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RecruiterDAO recruiterDAO = null;
        try {
            recruiterDAO = DaoInstance.daoFactory.getRecruiterDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Recruiter> recruiterList = recruiterDAO.getAllRecruiters();
        HttpSession session = request.getSession();
        session.setAttribute("recruiterList", recruiterList);
        response.sendRedirect("Admin/RecruitersProf.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
