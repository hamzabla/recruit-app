package com.app.controllers;


import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig;

import java.util.Hashtable;
import java.util.Map;

@ServerEndpoint(value = "/Conversation/{pseudo}",configurator = Conversation.EndpointConfigurator.class)
public class Conversation {
    private static Conversation singleton = new Conversation();
    private Conversation() {
    }

    /**
     * Acquisition de notre unique instance Conversation
     */

    public static Conversation getInstance() {
        return Conversation.singleton;
    }

    /**
     * On maintient toutes les sessions utilisateurs dans une collection.
     */

    private Hashtable<String, Session> sessions = new Hashtable<>();

    /**
     * Cette méthode est déclenchée à chaque connexion d'un utilisateur.
     */

    @OnOpen
    public void open(Session session, @PathParam("pseudo") String pseudo ) {
        sendMessage( "Admin >>> Connection established for " + pseudo );
        session.getUserProperties().put( "pseudo", pseudo );
        System.out.println(session.getUserProperties());
        sessions.put( session.getId(), session );
    }
    /**
     * Cette méthode est déclenchée à chaque déconnexion d'un utilisateur.
     */
    @OnClose
    public void close(Session session) {
        String pseudo = (String) session.getUserProperties().get( "pseudo" );
        sessions.remove( session.getId() );
        sendMessage( "Admin >>> Connection closed for " + pseudo );
    }

    /**
     * Cette méthode est déclenchée en cas d'erreur de communication.
     */
    @OnError
    public void onError(Throwable error) {
        System.out.println( "Error: " + error.getMessage() );
    }

    /**
     * Cette méthode est déclenchée à chaque réception d'un message utilisateur.
     */
    @OnMessage
    public void handleMessage(String message, Session session) {
        String pseudo = (String) session.getUserProperties().get( "pseudo" );
        String msg=message.split("/")[0];
        String user=message.split("/")[1];
        String fullMessage=null;
        if(pseudo.equals(user)) {
            fullMessage = "<div class='flex w-full mt-2 space-x-3 max-w-xs ml-auto justify-end'>"+
                    "<div>"+
                    "<div class='bg-blue-600 text-white p-3 rounded-l-lg rounded-br-lg'> "+
                    "<p class='text-sm'>"+msg+"</p>"+
                    "</div>"+
                    "<span class='text-xs text-gray-500 leading-none'>2 min ago</span>"+
                    "</div>"+
                    "<div class='flex-shrink-0 h-10 w-10 rounded-full bg-gray-300'></div>"+
                    "</div>";
        }else{
            fullMessage = "<div class=\"flex w-full mt-2 space-x-3 max-w-xs\">\n" +
                    "<div class=\"flex-shrink-0 h-10 w-10 rounded-full bg-gray-300\"></div>\n" +
                    "<div>\n" + "<div class=\"bg-gray-300 p-3 rounded-r-lg rounded-bl-lg\">\n" +
                    "<p class=\"text-sm\">"+msg+" </p>\n" +
                    "</div>\n" +
                    "<span class=\"text-xs text-gray-500 leading-none\">2 min ago</span>\n" +
                    "</div>\n" +
                    "</div>";

        }
        sendMessage( fullMessage );
    }
    /**
     * Une méthode privée, spécifique à notre exemple.
     * Elle permet l'envoie d'un message aux participants de la discussion.
     */
    private void sendMessage( String fullMessage ) {
        // Affichage sur la console du server Web.
        System.out.println( fullMessage );

        // On envoie le message à tout le monde.
        for( Session session : sessions.values() ) {
            try {
                session.getBasicRemote().sendText( fullMessage );
            } catch( Exception exception ) {
                System.out.println( "ERROR: cannot send message to " + session.getId() );
            }
        }
    }

    /**
     * Permet de ne pas avoir une instance différente par client.
     * Conversation est donc gérer en "singleton" et le configurateur utilise ce singleton.
     */
    public static class EndpointConfigurator extends ServerEndpointConfig.Configurator {
        @Override
        @SuppressWarnings("unchecked")
        public <T> T getEndpointInstance(Class<T> endpointClass) {
            return (T) Conversation.getInstance();
        }
    }
}
