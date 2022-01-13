package com.app.dao;

import com.app.extra.DatabaseConnection;
import com.app.models.Candidate;
import com.app.models.Recruiter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class CandidateDaoImp implements CandidateDAO {
    private Connection con;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;

    public CandidateDaoImp() {
        con = DatabaseConnection.getConnected();
    }

    @Override
    public int verifyLogin(String email, String password) {
        try {
            ps=con.prepareStatement("SELECT * from candidate where email=? and password=?");
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
    public Candidate getCandidateByEmail(String email) {
        try {
            query ="SELECT * from candidate where email=?";
            ps = con.prepareStatement(query);
            ps.setString(1,email);
            rs = ps.executeQuery();
            if(rs.next()) {
                Candidate candidate = new Candidate();
                candidate.setIdCan(rs.getInt(1));
                candidate.setFirstNameCan(rs.getString(2));
                candidate.setLastNameCan(rs.getString(3));
                candidate.setEmailCan(rs.getString(4));
                candidate.setPasswordCan(rs.getString(5));
                candidate.setSexeCan(rs.getString(6));
                candidate.setTelephoneCan(rs.getString(7));

                return candidate;
            }else {
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return null;
    }

    @Override
    public int addCandidate(Candidate candidate) {
        try {
            query="INSERT INTO candidate Values (null, ?, ?, ?, ?, ?, ?, ?)";
            ps=con.prepareStatement(query);
            ps.setString(1,candidate.getFirstNameCan());
            ps.setString(2,candidate.getLastNameCan());
            ps.setString(3,candidate.getEmailCan());
            ps.setString(4,candidate.getPasswordCan());
            ps.setString(5,candidate.getSexeCan());
            ps.setString(6,candidate.getTelephoneCan());
            ps.setString(7,candidate.getFormationCan());
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
            ps=con.prepareStatement("SELECT * from candidate where email=?");
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


