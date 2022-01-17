package com.app.models;

import java.sql.Date;

public class Candidate {
    private int idCan;
    private String firstNameCan;
    private String lastNameCan;
    private String emailCan;
    private String passwordCan;
    private String sexeCan;
    private String telephoneCan;
    private String formationCan;
    private String image;
    private String description;
    private String school;
    private String location;

    public String getFormationCan() {
        return formationCan;
    }

    public void setFormationCan(String formationCan) {
        this.formationCan = formationCan;
    }

    public Candidate() {
    }

    public Candidate(int idCan, String firstNameCan, String lastNameCan, String emailCan, String passwordCan, String sexeCan, String telephoneCan, String formationCan, String image, String description, String school, String location) {
        this.idCan = idCan;
        this.firstNameCan = firstNameCan;
        this.lastNameCan = lastNameCan;
        this.emailCan = emailCan;
        this.passwordCan = passwordCan;
        this.sexeCan = sexeCan;
        this.telephoneCan = telephoneCan;
        this.formationCan = formationCan;
        this.image = image;
        this.description = description;
        this.school = school;
        this.location = location;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getIdCan() {
        return idCan;
    }

    public void setIdCan(int idCan) {
        this.idCan = idCan;
    }

    public String getFirstNameCan() {
        return firstNameCan;
    }

    public void setFirstNameCan(String firstNameCan) {
        this.firstNameCan = firstNameCan;
    }

    public String getLastNameCan() {
        return lastNameCan;
    }

    public void setLastNameCan(String lastNameCan) {
        this.lastNameCan = lastNameCan;
    }

    public String getEmailCan() {
        return emailCan;
    }

    public void setEmailCan(String emailCan) {
        this.emailCan = emailCan;
    }

    public String getPasswordCan() {
        return passwordCan;
    }

    public void setPasswordCan(String passwordCan) {
        this.passwordCan = passwordCan;
    }

    public String getSexeCan() {
        return sexeCan;
    }

    public void setSexeCan(String sexeCan) {
        this.sexeCan = sexeCan;
    }

    public String getTelephoneCan() {
        return telephoneCan;
    }

    public void setTelephoneCan(String telephoneCan) {
        this.telephoneCan = telephoneCan;
    }
}
