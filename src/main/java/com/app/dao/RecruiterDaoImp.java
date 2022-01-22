package com.app.dao;

import com.app.models.Candidate;
import com.app.models.Recruiter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RecruiterDaoImp implements RecruiterDAO{

    private Connection con;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    private DAOFactory daoFactory;

    public RecruiterDaoImp(DAOFactory daoFactory, Connection con) {
        this.daoFactory= daoFactory;
        this.con= con;
    }

    @Override
    public int verifyLogin(String email, String password) {
        try {
            ps=con.prepareStatement("SELECT * from recruiter where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs=ps.executeQuery();
            if(rs.next())
                return 1;
            else
                return 0;
        }catch(Exception e) {
            System.out.println("Connection error : verifyLogin");
        }
        return -1;
    }

    @Override
    public Recruiter getRecruiterByEmail(String email) {
        try {
            query ="SELECT * from recruiter where email=?";
            ps = con.prepareStatement(query);
            ps.setString(1,email);
            rs = ps.executeQuery();
            if(rs.next()) {
                Recruiter recruiter = new Recruiter();
                recruiter.setIdRec(rs.getInt(1));
                recruiter.setFirstNameRec(rs.getString(2));
                recruiter.setLastNameRec(rs.getString(3));
                recruiter.setEmailRec(rs.getString(4));
                recruiter.setPasswordRec(rs.getString(5));
                recruiter.setEntrepriseRec(rs.getString(6));
                recruiter.setSexeRec(rs.getString(7));
                recruiter.setExperienceRec(rs.getInt(8));

                return recruiter;
            }else {
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return null;
    }

    @Override
    public int addRecruiter(Recruiter recruiter) {
        try {
            query="INSERT INTO recruiter Values (null, ?, ?, ?, ?, ?, ?, ?)";
            ps=con.prepareStatement(query);
            ps.setString(1,recruiter.getFirstNameRec());
            ps.setString(2,recruiter.getLastNameRec());
            ps.setString(3,recruiter.getEmailRec());
            ps.setString(4,recruiter.getPasswordRec());
            ps.setString(5,recruiter.getSexeRec());
            ps.setString(6,recruiter.getEntrepriseRec());
            ps.setInt(7,recruiter.getExperienceRec());
            int i=ps.executeUpdate();
            if (i>0)
                return 1;
            else
                return 0;
        }catch(Exception e){
            System.out.println("Connection error " +e );
        }
        return -1;

    }

    @Override
    public int emailExist(String email) {
        try {
            ps=con.prepareStatement("SELECT * from recruiter where email=?");
            ps.setString(1, email);
            rs=ps.executeQuery();
            if(rs.next())
                return 1;
            else
                return 0;
        }catch(Exception e) {
            System.out.println("connexion error");
        }

        return -1;
    }

    public Recruiter getRecruiterById(int idRecuiter){
        try {
            query ="SELECT * from recruiter where recruiter_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1,idRecuiter);
            rs = ps.executeQuery();
            if(rs.next()) {
                Recruiter recruiter = new Recruiter();
                recruiter.setIdRec(rs.getInt(1));
                recruiter.setFirstNameRec(rs.getString(2));
                recruiter.setLastNameRec(rs.getString(3));
                recruiter.setEmailRec(rs.getString(4));
                recruiter.setPasswordRec(rs.getString(5));
                recruiter.setEntrepriseRec(rs.getString(6));
                recruiter.setSexeRec(rs.getString(7));
                recruiter.setExperienceRec(rs.getInt(8));
                recruiter.setDescriptionRec(rs.getString(9));
                recruiter.setImg(rs.getString(10));
                return recruiter;
            }else {
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return null;
    }

    public List<Recruiter> getAllRecruiters() {
        query = "SELECT * from recruiter";
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<Recruiter> recruiters = new ArrayList<Recruiter>();
            while (rs.next()) {
                Recruiter recruiter = new Recruiter(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14));
                recruiters.add(recruiter);
            }
            return recruiters;
        } catch (Exception e) {
            System.out.println("Connection Error" + e);
        }
        return null;
    }

    public int updateRecruiter(Recruiter recruiter){
        query="UPDATE recruiter SET password=?, entreprise=?, img=?, descriptionRec=?, nbr_experience=? WHERE recruiter_id=?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1,recruiter.getPasswordRec());
            ps.setString(2,recruiter.getEntrepriseRec());
            ps.setString(3,recruiter.getImg());
            ps.setString(4,recruiter.getDescriptionRec());
            ps.setInt(5,recruiter.getExperienceRec());
            ps.setInt(6,recruiter.getIdRec());
            int i =ps.executeUpdate();
            if(i>0){
                return 1;
            }
            else{
                return 0;
            }
        }
        catch (Exception e){
            System.out.println("Connection Error"+e);
        }
        return -1;
    }

}