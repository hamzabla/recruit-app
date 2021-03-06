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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
        int idCandidate=Integer.parseInt(request.getParameter("idCandidate"));
        int idPost = Integer.parseInt(request.getParameter("idPost"));
        String postDescription = (String) request.getParameter("post");
        int idCategory = Integer.parseInt(request.getParameter("category"));
        Part VideoPart = request.getPart("video");

        System.out.println("part is :"+VideoPart);
        String videoFileName= extractFileName(VideoPart);
        System.out.println(videoFileName);
        String savePath= "C:\\Users\\user\\IdeaProjects\\recruit-app\\src\\main\\webapp\\videos"+ File.separator+idCandidate + videoFileName;
        String savePath2= "C:\\Users\\user\\IdeaProjects\\recruit-app\\target\\recruit-app-1.0-SNAPSHOT\\videos"+ File.separator+idCandidate + videoFileName;
        System.out.println(savePath);
        File fileSaveDir= new File(savePath);
        if(fileSaveDir.exists()!=true) {
            VideoPart.write(savePath + File.separator);
            File fileSaveDir2= new File(savePath2);
            copyFile(fileSaveDir, fileSaveDir2);
        }

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
    private static void copyFile(File source, File dest) throws IOException {
        Files.copy(source.toPath(), dest.toPath());
    }
}