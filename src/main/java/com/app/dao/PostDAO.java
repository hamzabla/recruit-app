package com.app.dao;

import com.app.models.Post;

import java.util.List;

public interface PostDAO {
    public int addPost(Post post);
    public List<Post> getAllPosts();
    public List<Post> getAllPostsByCategory(int idCategory);
    public int updatePost(Post post);
    public int deletePost(int idPost);
    public int incrementPostLike(int id);
    public int decrementPostLike(int id);
}