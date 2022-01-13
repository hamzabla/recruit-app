package com.app.dao;

import com.app.models.Candidate;
import com.app.models.Recruiter;

public interface CandidateDAO {
    public int verifyLogin(String email, String password);
    public Candidate getCandidateByEmail(String email);
    public int addCandidate(Candidate candidate);
    public int emailExist(String email);
}
