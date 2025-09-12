package sn.groupeisi.gestion_immeuble.Dao;


import sn.groupeisi.gestion_immeuble.Entities.Paiement;
import sn.groupeisi.gestion_immeuble.Entities.StatutPaiement;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

public class PaiementImpleDao implements IRepository<Paiement> {

    private EntityManager entityManager;

    public PaiementImpleDao() {
        this.entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    }

    @Override
    public int add(Paiement paiement) {
        entityManager.getTransaction().begin();
        entityManager.persist(paiement);
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(Paiement paiement) {
        entityManager.getTransaction().begin();
        Paiement paiementDB = entityManager.find(Paiement.class, paiement.getId());
        if (paiementDB != null) {
            paiementDB.setDatePaiement(paiement.getDatePaiement());
            paiementDB.setMontant(paiement.getMontant());
            paiementDB.setStatut(paiement.getStatut());
            paiementDB.setContratLocation(paiement.getContratLocation());
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int delete(int id) {
        entityManager.getTransaction().begin();
        Paiement paiement = entityManager.find(Paiement.class, id);
        if (paiement != null) {
            entityManager.remove(paiement);
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public List<Paiement> getAll() {
        List<Paiement> paiements = new ArrayList<>();
        entityManager.getTransaction().begin();
        paiements = entityManager
                .createQuery("FROM Paiement", Paiement.class)
                .getResultList();
        entityManager.getTransaction().commit();
        return paiements;
    }

    @Override
    public Paiement get(int id) {
        return entityManager.find(Paiement.class, id);
    }

    // 🔎 Méthodes personnalisées
    public List<Paiement> getByContrat(int contratId) {
        return entityManager.createQuery(
                        "SELECT p FROM Paiement p WHERE p.contratLocation.id = :contratId",
                        Paiement.class
                )
                .setParameter("contratId", contratId)
                .getResultList();
    }

    public List<Paiement> getByStatut(String statut) {
        return entityManager.createQuery(
                        "SELECT p FROM Paiement p WHERE p.statut = :statut",
                        Paiement.class
                )
                .setParameter("statut", statut)
                .getResultList();
    }

    //Update statut paiement
    public int updateStatutPaiement(int id, StatutPaiement nouveauStatut) {
        entityManager.getTransaction().begin();
        Paiement paiementDB = entityManager.find(Paiement.class, id);
        if (paiementDB != null) {
            paiementDB.setStatut(nouveauStatut);
            entityManager.getTransaction().commit();
            return 1; // succès
        }
        entityManager.getTransaction().rollback();
        return 0;
    }
    public long countEnAttente() {
        return entityManager.createQuery(
                        "SELECT COUNT(p) FROM Paiement p WHERE p.statut = :statut", Long.class)
                .setParameter("statut", StatutPaiement.EN_ATTENTE)
                .getSingleResult();
    }

    public double sumRevenusByProprietaire(int proprietaireId) {
        Double total = entityManager.createQuery(
                        "SELECT SUM(p.montant) FROM Paiement p WHERE p.contratLocation.unite.immeuble.proprietaire.id = :pid", Double.class)
                .setParameter("pid", proprietaireId)
                .getSingleResult();
        return total != null ? total : 0.0;
    }


    public long countByLocataire(int locataireId) {
        return entityManager.createQuery(
                        "SELECT COUNT(p) FROM Paiement p WHERE p.contratLocation.locataire.id = :lid", Long.class)
                .setParameter("lid", locataireId)
                .getSingleResult();
    }


    public List<Paiement> findByProprietaireId(Integer proprietaireId) {
        return entityManager.createQuery(
                        "SELECT p FROM Paiement p " +
                                "WHERE p.contratLocation.unite.immeuble.proprietaire.id = :id", Paiement.class)
                .setParameter("id", proprietaireId)
                .getResultList();
    }

    public List<Paiement> findByLocataireId(Integer locataireId) {
        return entityManager.createQuery(
                        "SELECT p FROM Paiement p WHERE p.contratLocation.locataire.id = :locataireId",
                        Paiement.class)
                .setParameter("locataireId", locataireId)
                .getResultList();
    }




}