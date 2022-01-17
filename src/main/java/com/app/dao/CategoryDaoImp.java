package com.app.dao;

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
}