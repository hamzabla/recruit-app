package com.app.controllers;

import com.app.dao.RecruiterDAO;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetRecruiters", value = "/GetRecruiters")
public class GetRecruiters extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RecruiterDAO recruiterDAO =null;

        try{
            recruiterDAO=DaoInstance.daoFactory.getRecruiterDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        List<Recruiter> recruiters= recruiterDAO.getAllRecruiters();
        HttpSession session= request.getSession();
        session.setAttribute("recruiters",recruiters);
        response.sendRedirect("Recruiters.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
