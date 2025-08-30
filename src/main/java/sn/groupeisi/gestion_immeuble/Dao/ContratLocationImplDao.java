package sn.groupeisi.gestion_immeuble.Dao;

import jakarta.persistence.EntityManager;
import sn.groupeisi.gestion_immeuble.Entities.ContratLocation;
import sn.groupeisi.gestion_immeuble.Entities.StatutContrat;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class ContratLocationImplDao implements IRepository<ContratLocation> {

    private EntityManager entityManager;

    public ContratLocationImplDao() {
        this.entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    }

    @Override
    public int add(ContratLocation contrat) {
        entityManager.getTransaction().begin();
        entityManager.persist(contrat);
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(ContratLocation contrat) {
        entityManager.getTransaction().begin();
        ContratLocation contratDB = entityManager.find(ContratLocation.class, contrat.getId());
        if (contratDB != null) {
            contratDB.setDateDebut(contrat.getDateDebut());
            contratDB.setDateFin(contrat.getDateFin());
            contratDB.setLocataire(contrat.getLocataire());
            contratDB.setUnite(contrat.getUnite());
            contratDB.setPaiements(contrat.getPaiements());
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int delete(int id) {
        entityManager.getTransaction().begin();
        ContratLocation contrat = entityManager.find(ContratLocation.class, id);
        if (contrat != null) {
            entityManager.remove(contrat);
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public List<ContratLocation> getAll() {
        List<ContratLocation> listContrats = new ArrayList<>();
        entityManager.getTransaction().begin();
        List<ContratLocation> resultats = entityManager
                .createQuery("FROM ContratLocation", ContratLocation.class)
                .getResultList();
        entityManager.getTransaction().commit();
        listContrats.addAll(resultats);
        return listContrats;
    }

    @Override
    public ContratLocation get(int id) {
        return entityManager.find(ContratLocation.class, id);
    }

    // Méthodes personnalisées utiles :
    public List<ContratLocation> getByLocataire(int locataireId) {
        return entityManager
                .createQuery("SELECT c FROM ContratLocation c WHERE c.locataire.id = :locataireId", ContratLocation.class)
                .setParameter("locataireId", locataireId)
                .getResultList();
    }

    public List<ContratLocation> getByUnite(int uniteId) {
        return entityManager
                .createQuery("SELECT c FROM ContratLocation c WHERE c.unite.id = :uniteId", ContratLocation.class)
                .setParameter("uniteId", uniteId)
                .getResultList();
    }

    public int updateStatutContrat(int contratId, StatutContrat nouveauStatut) {
        entityManager.getTransaction().begin();
        ContratLocation contratDB = entityManager.find(ContratLocation.class, contratId);

        if (contratDB != null) {
            contratDB.setStatut(nouveauStatut);
            entityManager.getTransaction().commit();
            return 1;
        }

        entityManager.getTransaction().rollback();
        return 0;
    }

}