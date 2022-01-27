package com.app.dao;

import com.app.models.Candidate;
import com.app.models.Category;
import com.app.models.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImp implements CategoryDAO {

    private Connection con;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    private DAOFactory daoFactory;

    public CategoryDaoImp(DAOFactory daoFactory, Connection con) {
        this.daoFactory= daoFactory;
        this.con= con;
    }

    public List<Category> getCategories() {
        query = "SELECT * from categories";
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<Category> categoryList = new ArrayList<>();
            while (rs.next()) {
                Category category = new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                categoryList.add(category);
            }
            return categoryList;
        } catch (Exception e) {
            System.out.println("Connection Error" + e);
        }
        return null;
    }

    public int updateCategory(Category category){
        query="UPDATE categories SET category=?, categoryDesciption=? WHERE idCategory=?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1,category.getCategory());
            ps.setString(2,category.getCategoryDesciption());
            ps.setInt(3,category.getIdCategory());
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

    public int addCategory(Category category){
        try {
            query="INSERT INTO categories Values (null ,?, ?)";
            ps=con.prepareStatement(query);
            ps.setString(1,category.getCategory());
            ps.setString(2,category.getCategoryDesciption());
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
}