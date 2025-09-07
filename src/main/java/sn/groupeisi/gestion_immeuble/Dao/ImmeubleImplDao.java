package sn.groupeisi.gestion_immeuble.Dao;

import jakarta.persistence.EntityManager;
import sn.groupeisi.gestion_immeuble.Entities.Immeuble;
import sn.groupeisi.gestion_immeuble.utils.JPAUtil;

import java.util.ArrayList;
import java.util.List;

public class ImmeubleImplDao implements IRepository<Immeuble> {

    private EntityManager entityManager;

    public ImmeubleImplDao() {
        this.entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    }

    @Override
    public int add(Immeuble immeuble) {
        entityManager.getTransaction().begin();
        entityManager.persist(immeuble);
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(Immeuble immeuble) {
        entityManager.getTransaction().begin();
        Immeuble immeubleDB = entityManager.find(Immeuble.class, immeuble.getId());
        if (immeubleDB != null) {
            immeubleDB.setNom(immeuble.getNom());
            immeubleDB.setAdresse(immeuble.getAdresse());
            immeubleDB.setNombreEtages(immeuble.getNombreEtages());
            immeubleDB.setDescription(immeuble.getDescription());
            immeubleDB.setEquipements(immeuble.getEquipements());
            immeubleDB.setProprietaire(immeuble.getProprietaire());
            immeubleDB.setUniteLocations(immeuble.getUniteLocations());
            immeubleDB.setImage(immeuble.getImage());
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public int delete(int id) {
        entityManager.getTransaction().begin();
        Immeuble immeuble = entityManager.find(Immeuble.class, id);
        if (immeuble != null) {
            entityManager.remove(immeuble);
        }
        entityManager.getTransaction().commit();
        return 1;
    }

    @Override
    public List<Immeuble> getAll() {
        List<Immeuble> listImmeubles = new ArrayList<>();
        entityManager.getTransaction().begin();
        List<Immeuble> resultat = entityManager
                .createQuery("FROM Immeuble", Immeuble.class)
                .getResultList();
        entityManager.getTransaction().commit();
        listImmeubles.addAll(resultat);
        return listImmeubles;
    }

    @Override
    public Immeuble get(int id) {
        Immeuble im = entityManager.find(Immeuble.class, id);
        if (im != null) {
            // Force le chargement de la collection lazy
            im.getEquipements().size();
        }
        return im;
    }

    public long countByProprietaire(int proprietaireId) {
        return entityManager.createQuery(
                        "SELECT COUNT(i) FROM Immeuble i WHERE i.proprietaire.id = :pid", Long.class)
                .setParameter("pid", proprietaireId)
                .getSingleResult();
    }
}
