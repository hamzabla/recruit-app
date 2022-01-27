package com.app.controllers;

import com.app.dao.CandidateDAO;
import com.app.dao.CategoryDAO;
import com.app.dao.DAOFactory;
import com.app.dao.RecruiterDAO;
import com.app.models.Admin;
import com.app.models.Candidate;
import com.app.models.Category;
import com.app.models.Recruiter;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetCategories", value = "/GetCategories")
public class GetCategories extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CategoryDAO categoryDAO =null;

        try{
            categoryDAO=DaoInstance.daoFactory.getCategoryDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        List<Category> categoryList= categoryDAO.getCategories();
        HttpSession session= request.getSession();
        session.setAttribute("categoryList",categoryList);
        Recruiter recruiter = (Recruiter) session.getAttribute("recruiter");
        Candidate candidate = (Candidate) session.getAttribute("candidate");
        Admin admin = (Admin) session.getAttribute("admin");
        if(recruiter !=null){
            response.sendRedirect("categories.jsp");
        }
        else if(candidate !=null){
            response.sendRedirect("Home.jsp");
        }
        else if(admin !=null){
            response.sendRedirect("Admin/CategoryAdmin.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}