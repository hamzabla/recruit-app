package com.app.dao;

import com.app.models.Admin;
import com.app.models.Candidate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AdminDaoImp implements AdminDAO{

    private Connection con;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    private DAOFactory daoFactory;

    public AdminDaoImp(DAOFactory daoFactory, Connection con) {
        this.daoFactory= daoFactory;
        this.con= con;
    }


    public int verifyLogin(String username, String password){
        try {
            ps=con.prepareStatement("SELECT * from admin where username=? and password=?");
            ps.setString(1, username);
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

    public Admin getAdminByUsername(String username){
        try {
            query ="SELECT * from admin where username=?";
            ps = con.prepareStatement(query);
            ps.setString(1,username);
            rs = ps.executeQuery();
            if(rs.next()) {
                Admin admin = new Admin();
                admin.setUsername(rs.getString(1));
                admin.setPassword(rs.getString(2));
                return admin;
            }else {
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return null;
    }
}
