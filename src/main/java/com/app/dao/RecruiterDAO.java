package com.app.dao;

import com.app.models.Recruiter;

public interface RecruiterDAO {
    public int verifyLogin(String email, String password);
    public Recruiter getRecruiterByEmail(String email);
    public int addRecruiter(Recruiter recruiter);
    public int emailExist(String email);
}
