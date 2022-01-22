package com.app.dao;

import com.app.models.Candidate;
import com.app.models.Recruiter;

import java.util.List;

public interface RecruiterDAO {
    public int verifyLogin(String email, String password);
    public Recruiter getRecruiterByEmail(String email);
    public int addRecruiter(Recruiter recruiter);
    public int emailExist(String email);
    public Recruiter getRecruiterById(int idRecuiter);
    public List<Recruiter> getAllRecruiters();
    public int updateRecruiter(Recruiter recruiter);
}
