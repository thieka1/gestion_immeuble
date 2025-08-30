package sn.groupeisi.gestion_immeuble.Dao;


import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.mindrot.jbcrypt.BCrypt;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class UtilisateurImplDao implements IRepository<Utilisateur> {

    EntityManager entityManager;

    public UtilisateurImplDao() {
        this.entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    }
    @Override
    public int add(Utilisateur utilisateur) {
        entityManager.getTransaction().begin();

        // Hachage du mot de passe avant persistance
        String hashedPassword = BCrypt.hashpw(utilisateur.getPassword(), BCrypt.gensalt());
        utilisateur.setPassword(hashedPassword);

        entityManager.persist(utilisateur);
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(Utilisateur utilisateur) {
        entityManager.getTransaction().begin();
        Utilisateur utilisateurDB = entityManager.find(Utilisateur.class, utilisateur.getId());
        if (utilisateurDB != null) {
            utilisateurDB.setNom(utilisateur.getNom());
            utilisateurDB.setPrenom(utilisateur.getPrenom());
            utilisateurDB.setEmail(utilisateur.getEmail());
            utilisateurDB.setTelephone(utilisateur.getTelephone());
            utilisateurDB.setRole(utilisateur.getRole());

            // Hacher le mot de passe seulement si il a changé
            if (utilisateur.getPassword() != null && !utilisateur.getPassword().isEmpty()) {
                String hashedPassword = BCrypt.hashpw(utilisateur.getPassword(), BCrypt.gensalt());
                utilisateurDB.setPassword(hashedPassword);
            }
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int delete(int id) {
        entityManager.getTransaction().begin();
        Utilisateur utilisateur = entityManager.find(Utilisateur.class, id);
        if (utilisateur != null) {
            entityManager.remove(utilisateur);
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public List<Utilisateur> getAll() {
        List<Utilisateur> listProduit = new ArrayList<>();
        entityManager.getTransaction().begin();
            List<Utilisateur> resultat = entityManager.createQuery("FROM Utilisateur ", Utilisateur.class).getResultList();
        entityManager.getTransaction().commit();
        listProduit.addAll(resultat);
        return listProduit;
    }

    @Override
    public Utilisateur get(int id) {
        return entityManager.find(Utilisateur.class, id);
    }
    public Utilisateur findByEmail(String email) {
        try {
            TypedQuery<Utilisateur> query = entityManager.createQuery(
                    "SELECT u FROM Utilisateur u WHERE u.email = :email", Utilisateur.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (Exception e) {
            // Aucun résultat trouvé
            return null;
        }
    }
}
