package com.app.models;

public class Category {
    private int idCategory;
    private String category;
    private String categoryDesciption;

    public Category() {
    }

    public Category(int idCategory, String category, String categoryDesciption) {
        this.idCategory = idCategory;
        this.category = category;
        this.categoryDesciption=categoryDesciption;
    }

    public String getCategoryDesciption() {
        return categoryDesciption;
    }

    public void setCategoryDesciption(String categoryDesciption) {
        this.categoryDesciption = categoryDesciption;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}