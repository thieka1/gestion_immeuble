package sn.groupeisi.gestion_immeuble.Dao;

import jakarta.persistence.EntityManager;
import sn.groupeisi.gestion_immeuble.Entities.DemandeLocation;
import sn.groupeisi.gestion_immeuble.Entities.StatutDemande;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class DemandeLocationImplDao implements IRepository<DemandeLocation> {

    private EntityManager entityManager;

    public DemandeLocationImplDao() {
        this.entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    }

    @Override
    public int add(DemandeLocation demande) {
        entityManager.getTransaction().begin();
        entityManager.persist(demande);
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(DemandeLocation demande) {
        entityManager.getTransaction().begin();
        DemandeLocation demandeDB = entityManager.find(DemandeLocation.class, demande.getId());
        if (demandeDB != null) {
            demandeDB.setLocataire(demande.getLocataire());
            demandeDB.setUnite(demande.getUnite());
            demandeDB.setDateDemande(demande.getDateDemande());
            demandeDB.setStatut(demande.getStatut());
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int delete(int id) {
        entityManager.getTransaction().begin();
        DemandeLocation demande = entityManager.find(DemandeLocation.class, id);
        if (demande != null) {
            entityManager.remove(demande);
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public List<DemandeLocation> getAll() {
        List<DemandeLocation> demandes = new ArrayList<>();
        entityManager.getTransaction().begin();
        demandes = entityManager
                .createQuery("FROM DemandeLocation", DemandeLocation.class)
                .getResultList();
        entityManager.getTransaction().commit();
        return demandes;
    }

    @Override
    public DemandeLocation get(int id) {
        return entityManager.find(DemandeLocation.class, id);
    }

    // 🔎 Méthodes personnalisées
    public List<DemandeLocation> getByLocataire(int locataireId) {
        return entityManager.createQuery(
                        "SELECT d FROM DemandeLocation d WHERE d.locataire.id = :locataireId",
                        DemandeLocation.class
                )
                .setParameter("locataireId", locataireId)
                .getResultList();
    }

    public List<DemandeLocation> getByUnite(int uniteId) {
        return entityManager.createQuery(
                        "SELECT d FROM DemandeLocation d WHERE d.unite.id = :uniteId",
                        DemandeLocation.class
                )
                .setParameter("uniteId", uniteId)
                .getResultList();
    }

    public List<DemandeLocation> getByStatut(String statut) {
        return entityManager.createQuery(
                        "SELECT d FROM DemandeLocation d WHERE d.statut = :statut",
                        DemandeLocation.class
                )
                .setParameter("statut", statut)
                .getResultList();
    }


    public int updateStatutDemande(int id, String nouveauStatut) {
        entityManager.getTransaction().begin();
        DemandeLocation demandeDB = entityManager.find(DemandeLocation.class, id);

        if (demandeDB != null) {
            // Si le champ statut est un Enum StatutDemande
            demandeDB.setStatut(Enum.valueOf(StatutDemande.class, nouveauStatut));
            entityManager.getTransaction().commit();
            return 1; // succès
        }

        entityManager.getTransaction().rollback();
        return 0; // échec : demande non trouvée
    }

    public long countByLocataire(int locataireId) {
        return entityManager.createQuery(
                        "SELECT COUNT(d) FROM DemandeLocation d WHERE d.locataire.id = :lid", Long.class)
                .setParameter("lid", locataireId)
                .getSingleResult();
    }

}