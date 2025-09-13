package sn.groupeisi.gestion_immeuble;

<<<<<<< HEAD
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

=======

import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

>>>>>>> 0249102 (design de l'application)
public class main {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = JPAUtil.getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
    }
}
