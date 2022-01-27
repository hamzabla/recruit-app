package com.app.dao;


import com.app.models.Admin;

public interface AdminDAO {
    public int verifyLogin(String username, String password);
    public Admin getAdminByUsername(String username);
}
