package com.app.controllers;

import com.app.dao.CandidateDAO;
import com.app.models.Candidate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetCandidateAdmin", value = "/GetCandidateAdmin")
public class GetCandidateAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CandidateDAO candidateDAO = null;
        try {
            candidateDAO = DaoInstance.daoFactory.getCandidateDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Candidate> candidateList = candidateDAO.getAllCandidates();
        HttpSession session = request.getSession();
        session.setAttribute("candidateList", candidateList);
        response.sendRedirect("Admin/CandidateProf.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
