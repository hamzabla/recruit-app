package com.app.controllers;

import com.app.dao.CandidateDAO;
import com.app.dao.CandidateDaoImp;
import com.app.dao.DAOFactory;
import com.app.dao.RecruiterDaoImp;
import com.app.extra.Strings;
import com.app.models.Candidate;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignUpCan", value = "/SignUpCan")
public class SignUpCan extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        req= request.getRequestDispatcher("SignupCan.jsp");
        req.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        String firstNameCan = (String) request.getParameter("firstname");
        String lastNameCan = (String) request.getParameter("lastname");
        String emailCan = (String) request.getParameter("email");
        String passwordCan = (String) request.getParameter("password1");
        String passwordCan2 = (String) request.getParameter("password2");
        String sexeCan = (String) request.getParameter("gender");
        String telephoneCan = (String) request.getParameter("telephone");
        String formationCan = (String) request.getParameter("formation");
        CandidateDAO candidateDao= null;
        try {
            candidateDao = DaoInstance.daoFactory.getCandidateDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Candidate candidate= new Candidate();
        if(passwordCan.equals(passwordCan2)==false){
            String error = Strings.ERROR_PASSWORD_INVALID;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("SignupCan.jsp");
            req.forward(request, response);
        }else if(candidateDao.emailExist(emailCan)==0){
            candidate.setFirstNameCan(firstNameCan);
            candidate.setLastNameCan(lastNameCan);
            candidate.setEmailCan(emailCan);
            candidate.setPasswordCan(passwordCan);
            candidate.setSexeCan(sexeCan);
            candidate.setTelephoneCan(telephoneCan);
            candidate.setFormationCan(formationCan);
            candidateDao.addCandidate(candidate);
            req = request.getRequestDispatcher("Login.jsp");
            req.forward(request,response);

        }else if(candidateDao.emailExist(emailCan)==1) {
            String error = Strings.ERROR_EMAIL_EXIST;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("SignupCan.jsp");
            req.forward(request, response);

        }
        else {
            request.setAttribute("error", "Connexion Error");
            req = request.getRequestDispatcher("SignupCan.jsp");
            req.forward(request, response);
        }
    }
}