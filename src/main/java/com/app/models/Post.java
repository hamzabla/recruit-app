package com.app.models;

public class Post {
    private int idPost;
    private int idCandidat;
    private String post;
    private String video;
    private int idCategory;

    public Post() {

    }

    public Post(int idPost, int idCandidat, String post, String video, int idCategory) {
        this.idPost = idPost;
        this.idCandidat = idCandidat;
        this.post = post;
        this.video = video;
        this.idCategory = idCategory;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public int getIdCandidat() {
        return idCandidat;
    }

    public void setIdCandidat(int idCandidat) {
        this.idCandidat = idCandidat;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }
}
