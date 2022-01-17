package com.app.controllers;

import com.app.dao.*;
import com.app.extra.Strings;
import com.app.models.Candidate;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        req= request.getRequestDispatcher("Login.jsp");
        req.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        RecruiterDAO recruiterDao = null;
        CandidateDAO candidateDao= null;
        try {
            recruiterDao = DaoInstance.daoFactory.getRecruiterDAO();
            candidateDao = DaoInstance.daoFactory.getCandidateDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if(recruiterDao.verifyLogin(email, password) == 1) {
            Recruiter recruiter = new Recruiter();
            recruiter  = recruiterDao.getRecruiterByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("recruiter", recruiter);
            req = request.getRequestDispatcher("Home.jsp");
            req.forward(request, response);

        }else if(candidateDao.verifyLogin(email, password)==1){
            Candidate candidate = new Candidate();
            candidate  = candidateDao.getCandidateByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("candidate", candidate);
            req = request.getRequestDispatcher("Home.jsp");
            req.forward(request, response);
        }
        else if (recruiterDao.verifyLogin(email, password) == 0 || candidateDao.verifyLogin(email, password) == 0 )
        {
            String error = Strings.ERROR_LOGIN;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("Login.jsp");
            req.forward(request, response);
        }else {
            String error = Strings.ERROR_DB_PROBLEM;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("Login.jsp");
            req.forward(request, response);
        }

    }
}