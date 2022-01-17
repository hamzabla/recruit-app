package com.app.controllers;

import com.app.dao.*;
import com.app.extra.Strings;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignUpRec", value = "/SignUpRec")
public class SignUpRec extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        req= request.getRequestDispatcher("SignupRec.jsp");
        req.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        String firstNameRec = (String) request.getParameter("firstname");
        String lastNameRec = (String) request.getParameter("lastname");
        String emailRec = (String) request.getParameter("email");
        String passwordRec = (String) request.getParameter("password1");
        String passwordRec2 = (String) request.getParameter("password2");
        String sexeRec = (String) request.getParameter("gender");
        String entrepriseRec = (String) request.getParameter("company");
        int experienceRec = (int) Integer.parseInt(request.getParameter("experience"));
        RecruiterDAO recruiterDao = null;
        try {
            recruiterDao = DaoInstance.daoFactory.getRecruiterDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Recruiter recruiter= new Recruiter();

        if(passwordRec.equals(passwordRec2)==false){
            String error = Strings.ERROR_PASSWORD_INVALID;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("SignupRec.jsp");
            req.forward(request, response);
        }else if(recruiterDao.emailExist(emailRec)==0){
            recruiter.setFirstNameRec(firstNameRec);
            recruiter.setLastNameRec(lastNameRec);
            recruiter.setEmailRec(emailRec);
            recruiter.setPasswordRec(passwordRec);
            recruiter.setSexeRec(sexeRec);
            recruiter.setEntrepriseRec(entrepriseRec);
            recruiter.setExperienceRec(experienceRec);
            recruiterDao.addRecruiter(recruiter);
            req = request.getRequestDispatcher("Login.jsp");
            req.forward(request,response);

        }else if(recruiterDao.emailExist(emailRec)==1) {
            String error = Strings.ERROR_EMAIL_EXIST;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("SignupRec.jsp");
            req.forward(request, response);

        }
        else {
            request.setAttribute("error", "Connexion Error");
            req = request.getRequestDispatcher("SignupRec.jsp");
            req.forward(request, response);
        }
    }
}