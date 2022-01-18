package com.app.controllers;

import com.app.dao.CandidateDAO;
import com.app.dao.PostDAO;
import com.app.models.Candidate;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetProfileCand", value = "/GetProfileCand")
public class GetProfileCand extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idCandidat = Integer.parseInt(request.getParameter("idCandidat"));
        CandidateDAO candidateDAO = null;
        try {
            candidateDAO = DaoInstance.daoFactory.getCandidateDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Candidate candidatePrf = candidateDAO.getCandidateById(idCandidat);
        HttpSession session = request.getSession();
        session.setAttribute("candidatePrf", candidatePrf);
        response.sendRedirect("ProfileCand.jsp?idCandidat=" + idCandidat);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}