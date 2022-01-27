package com.app.controllers;

import com.app.dao.CategoryDAO;
import com.app.models.Category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdateCategory", value = "/UpdateCategory")
public class UpdateCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int idCategory= Integer.parseInt(request.getParameter("idCategory"));
       String category = (String) request.getParameter("category");
       String categoryDescription = (String) request.getParameter("categoryDescription");

        CategoryDAO categoryDAO=null;
        try{
            categoryDAO=DaoInstance.daoFactory.getCategoryDAO();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        Category categoryToadd =new Category();
        categoryToadd.setIdCategory(idCategory);
        categoryToadd.setCategory(category);
        categoryToadd.setCategoryDesciption(categoryDescription);
        categoryDAO.updateCategory(categoryToadd);
        response.sendRedirect("GetCategories");
    }
}
