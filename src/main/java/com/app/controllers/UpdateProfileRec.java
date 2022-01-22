package com.app.controllers;

import com.app.dao.CandidateDAO;
import com.app.dao.RecruiterDAO;
import com.app.models.Candidate;
import com.app.models.Recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;

@WebServlet(name = "UpdateProfileRec", value = "/UpdateProfileRec")
@MultipartConfig
public class UpdateProfileRec extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idRecruiter = Integer.parseInt(request.getParameter("idRecruiter"));
        String password = (String) request.getParameter("password");
        int experience = Integer.parseInt(request.getParameter("experience"));
        String entreprise = (String) request.getParameter("entreprise");
        String description = (String) request.getParameter("description");

        Part ImgPart = request.getPart("image");

        String imageFileName = extractFileName(ImgPart);
        String savePath = "C:\\Users\\user\\IdeaProjects\\recruit-app\\src\\main\\webapp\\img" + File.separator + "rec" + idRecruiter + imageFileName;
        String savePath2 = "C:\\Users\\user\\IdeaProjects\\recruit-app\\target\\recruit-app-1.0-SNAPSHOT\\img" + File.separator + "rec" + idRecruiter + imageFileName;
        File fileSaveDir = new File(savePath);
        if (fileSaveDir.exists() != true) {
            ImgPart.write(savePath + File.separator);
            File fileSaveDir2 = new File(savePath2);
            copyFile(fileSaveDir, fileSaveDir2);
        }


        RecruiterDAO recruiterDAO = null;
        try {
            recruiterDAO = DaoInstance.daoFactory.getRecruiterDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Recruiter recruiter = new Recruiter();
        recruiter.setIdRec(idRecruiter);
        recruiter.setPasswordRec(password);
        recruiter.setImg(savePath);
        recruiter.setExperienceRec(experience);
        recruiter.setEntrepriseRec(entreprise);
        recruiter.setDescriptionRec(description);
        recruiterDAO.updateRecruiter(recruiter);
        response.sendRedirect("GetProfileRec?idRecruiter=" + idRecruiter);
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
