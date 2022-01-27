package com.app.dao;

import com.app.models.Candidate;
import com.app.models.Category;

import java.util.List;

public interface CategoryDAO {
    public List<Category> getCategories();
    public int updateCategory(Category category);
    public int addCategory(Category category);
}