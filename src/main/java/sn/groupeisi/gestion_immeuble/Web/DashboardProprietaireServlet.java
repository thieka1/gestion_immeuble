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
@WebServlet("/dashboard/proprietaire")
public class DashboardProprietaireServlet extends HttpServlet {
    private final ImmeubleImplDao immeubleDao = new ImmeubleImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
    private final ContratLocationImplDao contratDao = new ContratLocationImplDao();
    private final PaiementImpleDao paiementDao = new PaiementImpleDao();
    private final DemandeLocationImplDao demandeDao = new DemandeLocationImplDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer proprietaireId = (Integer) req.getSession().getAttribute("proprietaireId");
        if (proprietaireId == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        req.setAttribute("immeubles", immeubleDao.findByProprietaireId(proprietaireId));
        req.setAttribute("unites", uniteDao.findByProprietaireId(proprietaireId));
        req.setAttribute("contrats", contratDao.findByProprietaireId(proprietaireId));
        req.setAttribute("paiements", paiementDao.findByProprietaireId(proprietaireId));
        req.setAttribute("demandes", demandeDao.findByProprietaireId(proprietaireId));

        req.getRequestDispatcher("/dashboard/dashboardProprietaire.jsp").forward(req, resp);
    }
}

