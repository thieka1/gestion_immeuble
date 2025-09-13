package sn.groupeisi.gestion_immeuble.Dao;

<<<<<<< HEAD
import jakarta.persistence.EntityManager;
=======

>>>>>>> 0249102 (design de l'application)
import org.mindrot.jbcrypt.BCrypt;
import sn.groupeisi.gestion_immeuble.Entities.Locataire;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

<<<<<<< HEAD
=======
import javax.persistence.EntityManager;
>>>>>>> 0249102 (design de l'application)
import javax.swing.text.html.parser.Entity;
import java.util.List;

public class LocataireImplDao implements IRepository<Locataire> {
    private final EntityManager entityManager;

    public LocataireImplDao() {
        this.entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    }

    @Override
    public int add(Locataire locataire) {
        entityManager.getTransaction().begin();
        entityManager.persist(locataire); // Persiste uniquement Locataire et son lien avec Utilisateur
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(Locataire locataire) {
        entityManager.getTransaction().begin();
        Locataire locataireDB = entityManager.find(Locataire.class, locataire.getId());
        if (locataireDB != null) {
            locataireDB.setProfession(locataire.getProfession());
            locataireDB.setAdresse(locataire.getAdresse());
            locataireDB.setUtilisateur(locataire.getUtilisateur()); // si nécessaire, met à jour la relation
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int delete(int id) {
        entityManager.getTransaction().begin();
        Locataire locataire = entityManager.find(Locataire.class, id);
        if (locataire != null) {
            entityManager.remove(locataire); // supprime uniquement le locataire, pas l’utilisateur lié
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public List<Locataire> getAll() {
        return entityManager.createQuery("FROM Locataire", Locataire.class).getResultList();
    }

    @Override
    public Locataire get(int id) {
        return entityManager.find(Locataire.class, id);
    }
    public long count() {
        return entityManager.createQuery("SELECT COUNT(l) FROM Locataire l", Long.class)
                .getSingleResult();
    }
<<<<<<< HEAD
=======

>>>>>>> 0249102 (design de l'application)
    public Locataire findByUtilisateur(int utilisateurId) {
        try {
            return entityManager.createQuery(
                            "SELECT l FROM Locataire l WHERE l.utilisateur.id = :userId", Locataire.class)
                    .setParameter("userId", utilisateurId)
                    .getSingleResult();
        } catch (Exception e) {
            // Si aucun résultat, retourne null
            return null;
        }
    }


<<<<<<< HEAD


=======
>>>>>>> 0249102 (design de l'application)
}
