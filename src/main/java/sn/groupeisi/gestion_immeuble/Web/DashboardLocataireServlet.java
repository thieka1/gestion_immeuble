package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.*;
import sn.groupeisi.gestion_immeuble.Entities.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/locataire")
public class DashboardLocataireServlet extends HttpServlet {

    private final ImmeubleImplDao immeubleDao = new ImmeubleImplDao();
    private final LocataireImplDao locataireDao = new LocataireImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
    private final ContratLocationImplDao contratDao = new ContratLocationImplDao();
    private final PaiementImpleDao paiementDao = new PaiementImpleDao();
    private final DemandeLocationImplDao demandeDao = new DemandeLocationImplDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Utilisateur user = (Utilisateur) session.getAttribute("user");
        Integer locataireId = (user.getRole() == Role.LOCATAIRE) ? user.getId() : null;

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                List<Immeuble> immeubles = immeubleDao.getAll();
                req.setAttribute("immeubles", immeubles);

                if (locataireId != null) {
                    req.setAttribute("mesContrats", contratDao.countByLocataire(locataireId));
                    req.setAttribute("mesPaiements", paiementDao.countByLocataire(locataireId));
                    req.setAttribute("mesDemandes", demandeDao.countByLocataire(locataireId));
                }

                req.getRequestDispatcher("/dashboard/dashboardLocataire.jsp").forward(req, resp);
                break;

            case "add":
                String idParam = req.getParameter("id");
                if (idParam != null) {
                    int immeubleId = Integer.parseInt(idParam);

                    // Récupérer uniquement les unités DISPONIBLES
                    List<UniteLocation> unitesDisponibles = uniteDao.getByImmeuble(immeubleId).stream()
                            .filter(u -> u.getStatut() == StatutUnite.DISPONIBLE)
                            .toList();
                    req.setAttribute("unites", unitesDisponibles);

                    if (user.getRole() == Role.LOCATAIRE) {
                        Locataire locataire = locataireDao.findByUtilisateur(user.getId());
                        req.setAttribute("locataire", locataire);  // champ masqué pour locataire
                    } else if (user.getRole() == Role.ADMIN) {
                        List<Locataire> locataires = locataireDao.getAll();
                        req.setAttribute("locataires", locataires); // champ visible pour admin
                    }


                    req.getRequestDispatcher("/demande/addDemande.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/dashboard/locataire");
                }
                break;

            default:
                resp.sendRedirect(req.getContextPath() + "/dashboard/locataire");
        }
    }
}
