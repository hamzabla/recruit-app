package com.app.controllers;

import com.app.dao.DAOFactory;
import com.app.dao.PostDAO;
import com.app.dao.PostDaoImp;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UpdatePost", value = "/UpdatePost")
@MultipartConfig
public class UpdatePost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idPost = Integer.parseInt(request.getParameter("idPost"));
        String postDescription = (String) request.getParameter("postDescription");
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        Part VideoPart = request.getPart("video");

        System.out.println("part is :"+VideoPart);
        String videoFileName= extractFileName(VideoPart);
        System.out.println(videoFileName);
        String savePath= "C:\\Users\\user\\IdeaProjects\\recruit-app\\src\\main\\webapp\\videos"+ File.separator + videoFileName;
        System.out.println(savePath);
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
        post.setIdPost(idPost);
        post.setPost(postDescription);
        post.setVideo(savePath);
        post.setIdCategory(idCategory);
        postDAO.updatePost(post);
        response.sendRedirect("Home.jsp");

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