package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.*;
import sn.groupeisi.gestion_immeuble.Entities.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

import sn.groupeisi.gestion_immeuble.Dao.*;
import sn.groupeisi.gestion_immeuble.Entities.Immeuble;
import sn.groupeisi.gestion_immeuble.Entities.Locataire;
import sn.groupeisi.gestion_immeuble.Entities.UniteLocation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private final ImmeubleImplDao immeubleDao = new ImmeubleImplDao();
    private final LocataireImplDao locataireDao = new LocataireImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
    private final ContratLocationImplDao contratDao = new ContratLocationImplDao();
    private final PaiementImpleDao paiementDao = new PaiementImpleDao();
    private final DemandeLocationImplDao demandDao = new DemandeLocationImplDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        // Récupérer l'utilisateur connecté
        HttpSession session = req.getSession(false);
        if(session == null || session.getAttribute("currentUser") == null) {
            resp.sendRedirect("login");
            return;
        }
        Utilisateur user = (Utilisateur) session.getAttribute("currentUser");

        switch (action) {
            case "list":
                List<Immeuble> immeubles = immeubleDao.getAll();
                req.setAttribute("immeubles", immeubles);

                // Si c'est un locataire, compter ses données
                Locataire locataireConnecte = locataireDao.findByUtilisateur(user.getId());
                if(locataireConnecte != null) {
                    req.setAttribute("mesContrats", contratDao.countByLocataire(locataireConnecte.getId()));
                    req.setAttribute("mesPaiements", paiementDao.countByLocataire(locataireConnecte.getId()));
                    req.setAttribute("mesDemandes", demandDao.countByLocataire(locataireConnecte.getId()));
                }

                req.getRequestDispatcher("dashboard/dashboardLocataire.jsp").forward(req, resp);
                break;

            case "add":
                String idParam = req.getParameter("id");
                if (idParam != null) {
                    int immeubleId = Integer.parseInt(idParam);

                    // unités de l'immeuble choisi
                    List<UniteLocation> unites = uniteDao.getByImmeuble(immeubleId);
                    req.setAttribute("unites", unites);

                    // vérifier si l'utilisateur connecté est un locataire
                    Locataire locataire = locataireDao.findByUtilisateur(user.getId());

                    if(locataire != null) {
                        req.setAttribute("locataire", locataire); // input hidden dans JSP
                    } else {
                        List<Locataire> locataires = locataireDao.getAll();
                        req.setAttribute("locataires", locataires); // admin
                    }

                    req.getRequestDispatcher("demande/addDemande.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("dashboard");
                }
                break;


        }
    }
}