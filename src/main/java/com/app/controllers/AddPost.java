package com.app.controllers;

import com.app.dao.DAOFactory;
import com.app.dao.PostDAO;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddPost", value = "/AddPost")
@MultipartConfig
public class AddPost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postDescription = (String) request.getParameter("post");
        int idCategory = Integer.parseInt(request.getParameter("category"));
        Part VideoPart = request.getPart("video");
        int idCandidate = Integer.parseInt(request.getParameter("idCandidate"));
        String videoFileName= extractFileName(VideoPart);
        String savePath= "C:\\Users\\user\\IdeaProjects\\recruit-app\\src\\main\\webapp\\videos"+ File.separator + videoFileName;
        File fileSaveDir= new File(savePath);
        VideoPart.write(savePath+File.separator);
        PostDAO postDAO =null;
        try{
            postDAO=DaoInstance.daoFactory.getPostDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        Post post =new Post();
        post.setPost(postDescription);
        post.setVideo(savePath);
        post.setIdCategory(idCategory);
        post.setIdCandidat(idCandidate);
        postDAO.addPost(post);
        response.sendRedirect("GetAllPost");
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}