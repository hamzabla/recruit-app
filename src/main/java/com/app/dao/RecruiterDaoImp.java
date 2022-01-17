package com.app.dao;

import com.app.models.Recruiter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
                recruiter.setSexeRec(rs.getString(6));
                recruiter.setEntrepriseRec(rs.getString(7));
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
}