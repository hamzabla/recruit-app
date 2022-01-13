package com.app.dao;

import com.app.models.Recruiter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DAOFactory {


    private static final String PROPERTY_URL             = "url";
    private static final String PROPERTY_DRIVER          = "driver";
    private static final String PROPERTY_NOM_UTILISATEUR = "user";
    private static final String PROPERTY_MOT_DE_PASSE    = "password";

    private String   url;
    private String   username;
    private String   password;

    DAOFactory( String url, String username, String password ) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    /*
     * Méthode chargée de récupérer les informations de connexion à la base de
     * données, charger le driver JDBC et retourner une instance de la Factory
     */
    public static DAOFactory getInstance() throws com.app.dao.DAOConfigurationException {
        Properties properties = new Properties();
        String url = "jdbc:mysql://localhost:3306/project_s3";
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String password = "HAMZAcoc";

        try {
            System.out.println(url);
            System.out.println(driver);
            Class.forName( driver );
        } catch ( ClassNotFoundException e ) {
            throw new com.app.dao.DAOConfigurationException( "Le driver est introuvable dans le classpath.", e );
        }

        DAOFactory instance = new DAOFactory( url, user, password );
        return instance;
    }

    /* Méthode chargée de fournir une connexion à la base de données */
    /* package */ Connection getConnection() throws SQLException {
          return DriverManager.getConnection( url, username, password );
    }

    /*
     * Méthodes de récupération de l'implémentation des différents DAO (un seul
     * pour le moment)
     */
    public RecruiterDAO getRecruiterDAO() throws SQLException {
        return new RecruiterDaoImp(this, this.getConnection());
    }
    public CandidateDAO getCandidateDAO() throws SQLException {
        return new CandidateDaoImp(this,this.getConnection());
    }
}