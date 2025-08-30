package sn.groupeisi.gestion_immeuble.Dao;

import jakarta.persistence.EntityManager;
import sn.groupeisi.gestion_immeuble.Entities.StatutUnite;
import sn.groupeisi.gestion_immeuble.Entities.UniteLocation;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

import java.util.List;

public class UniteLocationImplDao implements IRepository<UniteLocation> {

    private final EntityManager entityManager;

    public UniteLocationImplDao() {
        this.entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    }

    @Override
    public int add(UniteLocation uniteLocation) {
        entityManager.getTransaction().begin();
        entityManager.persist(uniteLocation);
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(UniteLocation uniteLocation) {
        entityManager.getTransaction().begin();
        UniteLocation uniteDB = entityManager.find(UniteLocation.class, uniteLocation.getId());

        if (uniteDB != null) {
            uniteDB.setNumero(uniteLocation.getNumero());
            uniteDB.setNombrePieces(uniteLocation.getNombrePieces());
            uniteDB.setSuperficie(uniteLocation.getSuperficie());
            uniteDB.setLoyerMensuel(uniteLocation.getLoyerMensuel());
            uniteDB.setStatut(uniteLocation.getStatut());
            uniteDB.setImmeuble(uniteLocation.getImmeuble());
            uniteDB.setImage(uniteLocation.getImage());
        }

        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int delete(int id) {
        entityManager.getTransaction().begin();
        UniteLocation unite = entityManager.find(UniteLocation.class, id);
        if (unite != null) {
            entityManager.remove(unite);
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public List<UniteLocation> getAll() {
        return entityManager.createQuery("FROM UniteLocation", UniteLocation.class).getResultList();
    }

    @Override
    public UniteLocation get(int id) {
        return entityManager.find(UniteLocation.class, id);
    }

    /**
     * Récupérer toutes les unités disponibles
     */
    public List<UniteLocation> getUnitesDisponibles() {
        return entityManager.createQuery("FROM UniteLocation u WHERE u.statut = 'DISPONIBLE'", UniteLocation.class)
                .getResultList();
    }

    /**
     * Mettre à jour uniquement le statut d'une unité de location
     */
    public int updateStatutUnite(int id, String nouveauStatut) {
        entityManager.getTransaction().begin();
        UniteLocation uniteDB = entityManager.find(UniteLocation.class, id);

        if (uniteDB != null) {
            StatutUnite.valueOf(nouveauStatut);
            entityManager.getTransaction().commit();
            return 1; // succès
        }

        entityManager.getTransaction().rollback();
        return 0; // échec : unité introuvable
    }

}
