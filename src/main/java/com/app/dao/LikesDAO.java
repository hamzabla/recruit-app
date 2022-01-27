package com.app.dao;

import com.app.models.Like;

public interface LikesDAO {
    public int addCandidateLike(Like like);
    public Like getCandidateLikeByPostId(int canId, int postId);
    public int addRecruiterLike(Like like);
    public Like getRecruiterLikeByPostId(int recId,int postId);
    public int deleteLike(int likeId);
}
