package sn.groupeisi.gestion_immeuble.utils;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {

    private static final String PERSISTENCE_UNIT_NAME = "PERSISTENCE";
    private static EntityManagerFactory factory;

    public static EntityManagerFactory getEntityManagerFactory() {
        if (factory == null) {
            factory = Persistence.createEntityManagerFactory("PERSISTENCE");
        }
        return factory;
    }

    public static void shutdown() {
        if (factory != null) {
            factory.close();
        }
    }
}
