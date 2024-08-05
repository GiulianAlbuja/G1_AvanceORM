package utils;

import org.mindrot.jbcrypt.BCrypt;

public class BCryptUtil {

    // Método para generar el hash de la contraseña
    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    // Método para verificar la contraseña
    public static boolean checkPassword(String password, String hashed) {
        return BCrypt.checkpw(password, hashed);
    }
}