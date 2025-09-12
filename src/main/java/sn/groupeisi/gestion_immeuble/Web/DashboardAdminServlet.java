package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.*;
import sn.groupeisi.gestion_immeuble.Entities.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/dashboard/admin")
public class DashboardAdminServlet extends HttpServlet {

    private final ImmeubleImplDao immeubleDao = new ImmeubleImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
    private final ContratLocationImplDao contratDao = new ContratLocationImplDao();
    private final UtilisateurImplDao utilisateurDao = new UtilisateurImplDao();
    private final PaiementImpleDao paiementDao = new PaiementImpleDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Vérifier que l'utilisateur connecté est admin
        Utilisateur user = (Utilisateur) req.getSession().getAttribute("user");
        if (user == null || user.getRole() != Role.ADMIN) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // Statistiques
        req.setAttribute("totalImmeubles", immeubleDao.getAll().size());
        req.setAttribute("totalUnites", uniteDao.getAll().size());
        req.setAttribute("totalContratsActifs", contratDao.countActifs());
        req.setAttribute("totalLocataires", utilisateurDao.countByRole(Role.LOCATAIRE));
        req.setAttribute("totalAdmins", utilisateurDao.countByRole(Role.ADMIN));
        req.setAttribute("totalProprietaires", utilisateurDao.countByRole(Role.PROPRIETAIRE));

        // Gestion utilisateurs
        req.setAttribute("utilisateurs", utilisateurDao.getAll());

        // Suivi des paiements
        req.setAttribute("paiements", paiementDao.getAll());

        // Rapports & logs (à compléter selon ton système)
        // req.setAttribute("logs", logDao.getAll());

        req.getRequestDispatcher("/dashboard/dashboardAdmin.jsp").forward(req, resp);
    }
}
