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

    public String getFormationCan() {
        return formationCan;
    }

    public void setFormationCan(String formationCan) {
        this.formationCan = formationCan;
    }

    public Candidate() {
    }

    public Candidate(int idCan, String firstNameCan, String lastNameCan, String emailCan, String passwordCan, String sexeCan, String telephoneCan) {
        this.idCan = idCan;
        this.firstNameCan = firstNameCan;
        this.lastNameCan = lastNameCan;
        this.emailCan = emailCan;
        this.passwordCan = passwordCan;
        this.sexeCan = sexeCan;
        this.telephoneCan = telephoneCan;
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
