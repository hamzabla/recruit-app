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

@WebServlet(name = "GetProfileRec", value = "/GetProfileRec")
public class GetProfileRec extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idRecruiter = Integer.parseInt(request.getParameter("idRecruiter"));
        RecruiterDAO recruiterDAO = null;
        try {
            recruiterDAO = DaoInstance.daoFactory.getRecruiterDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Recruiter recruiterPrf = recruiterDAO.getRecruiterById(idRecruiter);
        HttpSession session = request.getSession();
        session.setAttribute("recruiterPrf", recruiterPrf);
        response.sendRedirect("ProfileRec.jsp?idRecruiter=" + idRecruiter);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
