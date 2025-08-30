package sn.groupeisi.gestion_immeuble.Web;


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
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/demande")
public class DemandeLocationServlet extends HttpServlet {
    private final DemandeLocationImplDao demandeDao = new DemandeLocationImplDao();
    private final LocataireImplDao locataireDao = new LocataireImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
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
}
