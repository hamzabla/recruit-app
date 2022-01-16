package com.app.controllers;

import com.app.dao.CategoryDAO;
import com.app.dao.DAOFactory;
import com.app.dao.PostDAO;
import com.app.models.Category;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetCategories", value = "/Home.jsp")
public class GetCategories extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher req;
        DAOFactory daoFactory=DAOFactory.getInstance();
        CategoryDAO categoryDAO =null;
        try{
            categoryDAO=daoFactory.getCategoryDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        List<Category> categoryList= categoryDAO.getCategories();
        HttpSession session= request.getSession();
        session.setAttribute("categoryList",categoryList);
        req = request.getRequestDispatcher("Home.jsp");
        req.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
