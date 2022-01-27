package com.app.dao;

import com.app.models.Like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class LikesDaoImp implements LikesDAO{
    private Connection con;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    private DAOFactory daoFactory;

    public LikesDaoImp(DAOFactory daoFactory, Connection con) {
        this.daoFactory= daoFactory;
        this.con= con;
    }

    @Override
    public int addCandidateLike(Like like) {
        try {
            query="INSERT INTO likes Values (null, ?, ?, null, ?)";
            ps=con.prepareStatement(query);
            ps.setInt(1,like.getPostId());
            ps.setString(2, like.getLiker());
            ps.setInt(3,like.getCandidateId());
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
    public int addRecruiterLike(Like like) {
        try {
            query="INSERT INTO likes Values (null, ?, ?, ?, null)";
            ps=con.prepareStatement(query);
            ps.setInt(1,like.getPostId());
            ps.setString(2, like.getLiker());
            ps.setInt(3,like.getRecruiterId());
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
    public Like getCandidateLikeByPostId(int candId, int postId) {
        query = "select * from likes where post_id=? and candidate_id=?;";

        try {
            ps= con.prepareStatement(query);
            ps.setInt(1,postId);
            ps.setInt(2,candId);
            rs =ps.executeQuery();
            Like like = null;
            if (rs.next()) {
                like = new Like();
                like.setLikeId(rs.getInt(1));
                like.setPostId(rs.getInt(2));
                like.setLiker(rs.getString(3));
                like.setCandidateId(rs.getInt(5));
            }
            return like;
        } catch (Exception e) {
            System.out.println("Connection Error" + e);
        }
        return null;
    }

    @Override
    public Like getRecruiterLikeByPostId(int recId,int postId) {
        query = "select * from likes where post_id=? and recruiter_id=?;";

        try {
            ps= con.prepareStatement(query);
            ps.setInt(1,postId);
            ps.setInt(2,recId);
            rs =ps.executeQuery();
            Like like = null;
            if (rs.next()) {
                like = new Like();
                like.setLikeId(rs.getInt(1));
                like.setPostId(rs.getInt(2));
                like.setLiker(rs.getString(3));
                like.setRecruiterId(rs.getInt(4));
            }
            return like;
        } catch (Exception e) {
            System.out.println("Connection Error" + e);
        }
        return null;
    }

    @Override
    public int deleteLike(int likeId) {
        query="DELETE FROM likes WHERE like_id=?";
        try {
            ps= con.prepareStatement(query);
            ps.setInt(1,likeId);
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
