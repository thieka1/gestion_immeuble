package sn.groupeisi.gestion_immeuble;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

public class main {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = JPAUtil.getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
    }
}
