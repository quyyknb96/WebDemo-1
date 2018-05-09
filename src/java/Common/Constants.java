/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Common;

/**
 *
 * @author Quy
 */
public class Constants {

    public static String GOOGLE_CLIENT_ID = "253986303488-9d2474numbpmhfoflpmbr5on7tabortq.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "7bYNfIcgx4tcHPU6wDNOQJxE";
    public static String GOOGLE_REDIRECT_URI = "http://demoweb.com/demoWeb/login-google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    
    public static String FACEBOOK_APP_ID = "146224182894627";
    public static String FACEBOOK_APP_SECRET = "4069cc607c0dbe484db8dcaacb543d78";
    public static String FACEBOOK_REDIRECT_URL = "https://demoweb.com/demoWeb/login-facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
}
