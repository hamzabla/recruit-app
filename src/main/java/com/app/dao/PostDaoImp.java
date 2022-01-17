package com.app.dao;


import com.app.models.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostDaoImp implements PostDAO {

    private Connection con;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    private DAOFactory daoFactory;

    public PostDaoImp(DAOFactory daoFactory, Connection con) {
        this.daoFactory= daoFactory;
        this.con= con;
    }

    public int addPost(Post post){
        try {
            query="INSERT INTO candidature_post Values (null, ?, ?, ?, ?)";
            ps=con.prepareStatement(query);
            ps.setString(1,post.getPost());
            ps.setString(2,post.getVideo());
            ps.setInt(3,post.getIdCategory());
            ps.setInt(4,post.getIdCandidat());
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

    public List<Post> getAllPosts() {
        query = "select cp.*,\n" +
                "       c.firstname,\n" +
                "       c.lastname,\n" +
                "       cg.category\n" +
                "from candidature_post as cp \n" +
                "join candidate as c \n" +
                "on c.candidate_id=cp.candidate_id\n" +
                "join categories as cg\n" +
                "on cg.idCategory=cp.idCategory;";
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<Post> postList = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                postList.add(post);
            }
            return postList;
        } catch (Exception e) {
            System.out.println("Connection Error" + e);
        }
        return null;
    }


    public List<Post> getAllPostsByCategory(int idCategory){
        query = "select cp.*,\n" +
                "       c.firstname,\n" +
                "       c.lastname,\n" +
                "       cg.category\n" +
                "from candidature_post as cp \n" +
                "join candidate as c \n" +
                "on c.candidate_id=cp.candidate_id\n" +
                "join categories as cg\n" +
                "on cg.idCategory=cp.idCategory " +
                "where cp.idCategory=?";
        try {
            ps= con.prepareStatement(query);
            ps.setInt(1,idCategory);
            rs =ps.executeQuery();
            List<Post> postListByCategory = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                postListByCategory.add(post);
            }
            return postListByCategory;
        } catch (Exception e) {
            System.out.println("Connection Error" + e);
        }
        return null;
    }

    public int updatePost(Post post){
        query="UPDATE candidature_post SET post=?, video=?, idCategory=? WHERE post_id=?";
        try {
            ps= con.prepareStatement(query);
            ps.setString(1,post.getPost());
            ps.setString(2,post.getVideo());
            ps.setInt(3,post.getIdCategory());
            ps.setInt(4,post.getIdPost());
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

    public int deletePost(int idPost){
        query="DELETE FROM candidature_post WHERE post_id=?";
        try {
            ps= con.prepareStatement(query);
            ps.setInt(1,idPost);
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