package com.app.models;

import java.sql.Date;

public class Recruiter {
    private int idRec;
    private String firstNameRec;
    private String lastNameRec;
    private String emailRec;
    private String passwordRec;
    private String sexeRec;
    private String entrepriseRec;
    private int experienceRec;
    private String descriptionRec;
    private String img;

    public Recruiter() {
    }

    public Recruiter(int idRec, String firstNameRec, String lastNameRec, String emailRec, String passwordRec,String entrepriseRec, String sexeRec,  int experienceRec,String descriptionRec,String img) {
        this.idRec = idRec;
        this.firstNameRec = firstNameRec;
        this.lastNameRec = lastNameRec;
        this.emailRec = emailRec;
        this.passwordRec = passwordRec;
        this.sexeRec = sexeRec;
        this.entrepriseRec = entrepriseRec;
        this.experienceRec = experienceRec;
        this.descriptionRec=descriptionRec;
        this.img=img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescriptionRec() {
        return descriptionRec;
    }

    public void setDescriptionRec(String descriptionRec) {
        this.descriptionRec = descriptionRec;
    }

    public int getIdRec() {
        return idRec;
    }

    public void setIdRec(int idRec) {
        this.idRec = idRec;
    }

    public String getFirstNameRec() {
        return firstNameRec;
    }

    public void setFirstNameRec(String firstNameRec) {
        this.firstNameRec = firstNameRec;
    }

    public String getLastNameRec() {
        return lastNameRec;
    }

    public void setLastNameRec(String lastNameRec) {
        this.lastNameRec = lastNameRec;
    }

    public String getEmailRec() {
        return emailRec;
    }

    public void setEmailRec(String emailRec) {
        this.emailRec = emailRec;
    }

    public String getPasswordRec() {
        return passwordRec;
    }

    public void setPasswordRec(String passwordRec) {
        this.passwordRec = passwordRec;
    }

    public String getSexeRec() {
        return sexeRec;
    }

    public void setSexeRec(String sexeRec) {
        this.sexeRec = sexeRec;
    }

    public String getEntrepriseRec() {
        return entrepriseRec;
    }

    public void setEntrepriseRec(String entrepriseRec) {
        this.entrepriseRec = entrepriseRec;
    }

    public int getExperienceRec() {
        return experienceRec;
    }

    public void setExperienceRec(int experienceRec) {
        this.experienceRec = experienceRec;
    }

}
