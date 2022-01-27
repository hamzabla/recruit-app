package com.app.controllers;

import com.app.dao.AdminDAO;
import com.app.dao.CandidateDAO;
import com.app.dao.RecruiterDAO;
import com.app.extra.Strings;
import com.app.models.Admin;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginAdmin", value = "/LoginAdmin")
public class LoginAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        AdminDAO adminDao = null;
        try {
            adminDao = DaoInstance.daoFactory.getAdminDao();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (adminDao.verifyLogin(username, password) == 1) {
            Admin admin = new Admin();
            admin = adminDao.getAdminByUsername(username);
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("../PostsAdmin");
        }
        else if (adminDao.verifyLogin(username, password) == 0)
        {
            String error = Strings.ERROR_LOGIN;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("Admin/LoginAdmin.jsp");
            req.forward(request, response);
        }else {
            String error = Strings.ERROR_DB_PROBLEM;
            request.setAttribute("error", error);
            req = request.getRequestDispatcher("Admin/LoginAdmin.jsp");
            req.forward(request, response);
        }



    }
}
