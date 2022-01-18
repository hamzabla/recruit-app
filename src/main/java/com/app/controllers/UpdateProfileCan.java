package com.app.controllers;

import com.app.dao.CandidateDAO;
import com.app.dao.PostDAO;
import com.app.models.Candidate;
import com.app.models.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdateProfileCan", value = "/UpdateProfileCan")
@MultipartConfig
public class UpdateProfileCan extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd;
        int idCandidate= Integer.parseInt(request.getParameter("idCandidate"));
        String password = (String) request.getParameter("password");
        String location= (String) request.getParameter("location");
        String formation= (String) request.getParameter("formation");
        String school= (String) request.getParameter("school");
        String description= (String) request.getParameter("description");

        Part ImgPart = request.getPart("image");
        System.out.println("part is :"+ImgPart);
        String imageFileName= extractFileName(ImgPart);
        System.out.println(imageFileName);
        String savePath= "C:\\Users\\user\\IdeaProjects\\recruit-app\\src\\main\\webapp\\img"+ File.separator + imageFileName;
        System.out.println(savePath);
        File fileSaveDir= new File(savePath);
        ImgPart.write(savePath+File.separator);

        CandidateDAO candidateDAO =null;
        try{
            candidateDAO=DaoInstance.daoFactory.getCandidateDAO();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        Candidate candidate =new Candidate();
        candidate.setIdCan(idCandidate);
        candidate.setPasswordCan(password);
        candidate.setImage(savePath);
        candidate.setLocation(location);
        candidate.setFormationCan(formation);
        candidate.setSchool(school);
        candidate.setDescription(description);
        candidateDAO.updateCandidate(candidate);
        response.sendRedirect("GetProfileCand?idCandidat="+idCandidate);

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
