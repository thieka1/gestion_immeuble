package sn.groupeisi.gestion_immeuble.Web;

<<<<<<< HEAD

import sn.groupeisi.gestion_immeuble.Dao.DemandeLocationImplDao;
import sn.groupeisi.gestion_immeuble.Dao.LocataireImplDao;
import sn.groupeisi.gestion_immeuble.Dao.UniteLocationImplDao;
import sn.groupeisi.gestion_immeuble.Entities.DemandeLocation;
import sn.groupeisi.gestion_immeuble.Entities.Locataire;
import sn.groupeisi.gestion_immeuble.Entities.StatutDemande;
import sn.groupeisi.gestion_immeuble.Entities.UniteLocation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
=======
import sn.groupeisi.gestion_immeuble.Dao.*;
import sn.groupeisi.gestion_immeuble.Entities.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
>>>>>>> 0249102 (design de l'application)
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/demande")
public class DemandeLocationServlet extends HttpServlet {
<<<<<<< HEAD
    private final DemandeLocationImplDao demandeDao = new DemandeLocationImplDao();
    private final LocataireImplDao locataireDao = new LocataireImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
=======

    private final DemandeLocationImplDao demandeDao = new DemandeLocationImplDao();
    private final LocataireImplDao locataireDao = new LocataireImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
    private final ContratLocationImplDao contratDao = new ContratLocationImplDao();
    private final PaiementImpleDao paiementDao = new PaiementImpleDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "list";

        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Utilisateur user = (Utilisateur) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        switch (action) {
            case "add":
                handleAdd(req, resp, user);
                break;

            case "edit":
                handleEdit(req, resp);
                break;

            case "delete":
                handleDelete(req, resp);
                break;

            case "list":
                handleList(req, resp, user);
                break;

            case "accept":
                accepterDemande(req, resp);
                break;

            case "reject":
                refuserDemande(req, resp);
                break;

            default:
                resp.sendRedirect(req.getContextPath() + "/demande?action=list");
        }
    }
>>>>>>> 0249102 (design de l'application)

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
<<<<<<< HEAD
        if (action == null) action = "";

        switch (action) {
            case "save":
                DemandeLocation demande = new DemandeLocation();

                int locataireId = Integer.parseInt(req.getParameter("locataireId"));
                Locataire locataire = locataireDao.get(locataireId);
                demande.setLocataire(locataire);

                int uniteId = Integer.parseInt(req.getParameter("uniteId"));
                UniteLocation unite = uniteDao.get(uniteId);
                demande.setUnite(unite);

                demande.setDateDemande(LocalDate.now());
                demande.setStatut(StatutDemande.EN_ATTENTE);

                demandeDao.add(demande);
                resp.sendRedirect("?action=list");
                break;

            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                DemandeLocation demandeUpdate = demandeDao.get(id);
                if (demandeUpdate != null) {
                    int locId = Integer.parseInt(req.getParameter("locataireId"));
                    demandeUpdate.setLocataire(locataireDao.get(locId));

                    int unId = Integer.parseInt(req.getParameter("uniteId"));
                    demandeUpdate.setUnite(uniteDao.get(unId));

                    String statutStr = req.getParameter("statut");
                    demandeUpdate.setStatut(StatutDemande.valueOf(statutStr));

                    demandeDao.update(demandeUpdate);
                }
                resp.sendRedirect("?action=list");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                List<DemandeLocation> demandes = demandeDao.getAll();
                req.setAttribute("demandes", demandes);
                req.getRequestDispatcher("demande/demande.jsp").forward(req, resp);
                break;

            case "add":
                List<Locataire> locataires = locataireDao.getAll();
                List<UniteLocation> unites = uniteDao.getAll();
                req.setAttribute("locataires", locataires);
                req.setAttribute("unites", unites);
                req.getRequestDispatcher("demande/addDemande.jsp").forward(req, resp);
                break;

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                DemandeLocation demandeEdit = demandeDao.get(idEdit);
                req.setAttribute("demande", demandeEdit);

                req.setAttribute("locataires", locataireDao.getAll());
                req.setAttribute("unites", uniteDao.getAll());
                req.getRequestDispatcher("demande/editDemande.jsp").forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                demandeDao.delete(idDelete);
                resp.sendRedirect("?action=list");
                break;
        }
    }
=======
        if (!"save".equals(action)) {
            resp.sendRedirect(req.getContextPath() + "/demande?action=list");
            return;
        }

        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Utilisateur user = (Utilisateur) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        int locataireId;
        if (user.getRole() == Role.LOCATAIRE) {
            Locataire locataire = locataireDao.findByUtilisateur(user.getId());
            if (locataire == null) {
                resp.sendRedirect(req.getContextPath() + "/demande?action=add&error=noLocataire");
                return;
            }
            locataireId = locataire.getId();
        } else {
            String locataireParam = req.getParameter("locataireId");
            if (locataireParam == null || locataireParam.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/demande?action=add&error=missingLocataire");
                return;
            }
            locataireId = Integer.parseInt(locataireParam);
        }

        String uniteParam = req.getParameter("uniteId");
        if (uniteParam == null || uniteParam.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/demande?action=add&error=missingUnite");
            return;
        }
        int uniteId = Integer.parseInt(uniteParam);

        DemandeLocation demande = new DemandeLocation();
        demande.setLocataire(locataireDao.get(locataireId));
        demande.setUnite(uniteDao.get(uniteId));
        demande.setDateDemande(LocalDate.now());
        demande.setStatut(StatutDemande.EN_ATTENTE);

        demandeDao.add(demande);

        // Redirection selon rôle
        if (user.getRole() == Role.LOCATAIRE) {
            resp.sendRedirect(req.getContextPath() + "/dashboard/locataire");
        } else if (user.getRole() == Role.ADMIN) {
            resp.sendRedirect(req.getContextPath() + "/demande?action=list");
        } else {
            resp.sendRedirect(req.getContextPath() + "/demande?action=list");
        }
    }

    // ================= Méthodes internes =================

    private void handleAdd(HttpServletRequest req, HttpServletResponse resp, Utilisateur user) throws ServletException, IOException {
        List<UniteLocation> unitesDisponibles = uniteDao.getAll().stream()
                .filter(u -> u.getStatut() == StatutUnite.DISPONIBLE)
                .toList();
        req.setAttribute("unites", unitesDisponibles);

        if (user.getRole() == Role.LOCATAIRE) {
            Locataire locataire = locataireDao.findByUtilisateur(user.getId());
            if (locataire == null) {
                resp.sendRedirect(req.getContextPath() + "/demande?action=add&error=noLocataire");
                return;
            }
            req.setAttribute("locataire", locataire);
        } else if (user.getRole() == Role.ADMIN) {
            req.setAttribute("locataires", locataireDao.getAll());
        } else {
            resp.sendRedirect(req.getContextPath() + "/demande?action=list");
            return;
        }

        req.getRequestDispatcher("demande/addDemande.jsp").forward(req, resp);
    }

    private void handleEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idEdit = Integer.parseInt(req.getParameter("id"));
        DemandeLocation demandeEdit = demandeDao.get(idEdit);
        req.setAttribute("demande", demandeEdit);
        req.setAttribute("locataires", locataireDao.getAll());
        req.setAttribute("unites", uniteDao.getAll());
        req.getRequestDispatcher("demande/editDemande.jsp").forward(req, resp);
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        Utilisateur user = (Utilisateur) session.getAttribute("user");

        int idDelete = Integer.parseInt(req.getParameter("id"));
        DemandeLocation demande = demandeDao.get(idDelete);

        if(demande == null){
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Demande non trouvée");
            return;
        }

        // Vérification du rôle : admin peut tout supprimer, locataire seulement ses demandes
        if(user.getRole() == Role.ADMIN ||
                (user.getRole() != Role.ADMIN && demande.getLocataire().getUtilisateur().getId().equals(user.getId()))) {
            try {
                demandeDao.delete(idDelete);
                resp.sendRedirect(req.getContextPath() + "/demande?action=list");
            } catch (Exception e) {
                // Gestion d'erreur si la demande est liée à une unité (FK)
                resp.sendError(HttpServletResponse.SC_CONFLICT,
                        "Impossible de supprimer la demande car elle est liée à une unité ou un enregistrement existant.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Vous n'avez pas le droit de supprimer cette demande");
        }
    }

    private void handleList(HttpServletRequest req, HttpServletResponse resp, Utilisateur user) throws ServletException, IOException {
        List<DemandeLocation> demandes;
        if (user.getRole() == Role.LOCATAIRE) {
            Locataire loc = locataireDao.findByUtilisateur(user.getId());
            demandes = (loc != null) ? demandeDao.findByLocataireId(loc.getId()) : List.of();
        } else if (user.getRole() == Role.PROPRIETAIRE) {
            demandes = demandeDao.findByProprietaireId(user.getId());
        } else { // ADMIN
            demandes = demandeDao.getAll();
        }
        req.setAttribute("demandes", demandes);
        req.getRequestDispatcher("demande/demande.jsp").forward(req, resp);
    }


    private void accepterDemande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int demandeId = Integer.parseInt(req.getParameter("id"));
        DemandeLocation demande = demandeDao.get(demandeId);

        if (demande != null && demande.getStatut() == StatutDemande.EN_ATTENTE) {
            // Mettre la demande à ACCEPTÉE
            demande.setStatut(StatutDemande.ACCEPTEE);
            demandeDao.update(demande);

            // Créer le contrat
            ContratLocation contrat = new ContratLocation();
            contrat.setLocataire(demande.getLocataire());
            contrat.setUnite(demande.getUnite());
            contrat.setDateDebut(LocalDate.now());
            contrat.setDateFin(LocalDate.now().plusYears(1));
            contrat.setStatut(StatutContrat.EN_COURS);
            contratDao.add(contrat);

            // Marquer l'unité comme louée
            UniteLocation unite = demande.getUnite();
            unite.setStatut(StatutUnite.LOUE);
            uniteDao.update(unite);


            // Créer un paiement initial
            Paiement paiement = new Paiement();
            paiement.setContratLocation(contrat);
            paiement.setDatePaiement(LocalDate.now());
            paiement.setMontant(contrat.getUnite().getLoyerMensuel());
            paiement.setStatut(StatutPaiement.EN_ATTENTE);

            PaiementImpleDao paiementDao = new PaiementImpleDao();
            paiementDao.add(paiement);
        }

        resp.sendRedirect(req.getContextPath() + "/demande?action=list");
    }

    private void refuserDemande(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int demandeId = Integer.parseInt(req.getParameter("id"));
        DemandeLocation demande = demandeDao.get(demandeId);

        if (demande != null && demande.getStatut() == StatutDemande.EN_ATTENTE) {
            demande.setStatut(StatutDemande.REFUSEE);
            demandeDao.update(demande);
        }

        resp.sendRedirect(req.getContextPath() + "/demande?action=list");
    }

>>>>>>> 0249102 (design de l'application)
}
