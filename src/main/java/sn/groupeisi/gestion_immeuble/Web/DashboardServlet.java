package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.*;
import sn.groupeisi.gestion_immeuble.Entities.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        int locataireId = 1; // TODO: récupérer depuis la session

        switch (action) {
            case "list":
                // Liste des immeubles
                List<Immeuble> immeubles = immeubleDao.getAll();
                req.setAttribute("immeubles", immeubles);

                // Statistiques locataire
                req.setAttribute("mesContrats", contratDao.countByLocataire(locataireId));
                req.setAttribute("mesPaiements", paiementDao.countByLocataire(locataireId));
                req.setAttribute("mesDemandes", demandDao.countByLocataire(locataireId));

                req.getRequestDispatcher("dashboard/dashboardLocataire.jsp").forward(req, resp);
                break;

            case "add":
                // récupérer l'id de l'immeuble
                String idStr = req.getParameter("id");
                if(idStr != null) {
                    int immeubleId = Integer.parseInt(idStr);
                    req.setAttribute("immeubleId", immeubleId);
                }
                List<Locataire> locataires = locataireDao.getAll();
                req.setAttribute("locataires", locataires);

                req.getRequestDispatcher("demande/addDemande.jsp").forward(req, resp);
                break;
        }
    }
}
