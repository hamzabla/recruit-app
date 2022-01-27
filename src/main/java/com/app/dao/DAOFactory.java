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
    public static DAOFactory getInstance() throws DAOConfigurationException {
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
            throw new DAOConfigurationException( "Le driver est introuvable dans le classpath.", e );
        }

        DAOFactory instance = new DAOFactory( url, user, password );
        return instance;
    }

    /* Méthode chargée de fournir une connexion à la base de données */
    /* package */ Connection getConnection() throws SQLException {
        return DriverManager.getConnection( url, username, password );
    }

    public static void releaseConnection(Connection con){
        try {
            con.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

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
    public PostDAO getPostDAO() throws SQLException{
        return new PostDaoImp(this,this.getConnection());
    }

    public CategoryDAO getCategoryDAO() throws SQLException{
        return new CategoryDaoImp(this,this.getConnection());
    }
    public LikesDAO getLikesDao() throws SQLException{
        return new LikesDaoImp(this,this.getConnection());
    }
    public AdminDAO getAdminDao() throws SQLException{
        return new AdminDaoImp(this,this.getConnection());
    }
}