package sn.groupeisi.gestion_immeuble.Web;


import sn.groupeisi.gestion_immeuble.Dao.ContratLocationImplDao;
import sn.groupeisi.gestion_immeuble.Dao.LocataireImplDao;
import sn.groupeisi.gestion_immeuble.Dao.UniteLocationImplDao;
import sn.groupeisi.gestion_immeuble.Entities.ContratLocation;
import sn.groupeisi.gestion_immeuble.Entities.Locataire;
import sn.groupeisi.gestion_immeuble.Entities.StatutContrat;
import sn.groupeisi.gestion_immeuble.Entities.UniteLocation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/contrat")
public class ContratLocationServlet extends HttpServlet {

    private final ContratLocationImplDao contratDao = new ContratLocationImplDao();
    private final LocataireImplDao locataireDao = new LocataireImplDao();
    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "save":
                ContratLocation contrat = new ContratLocation();

                int locataireId = Integer.parseInt(req.getParameter("locataireId"));
                Locataire locataire = locataireDao.get(locataireId);
                contrat.setLocataire(locataire);

                int uniteId = Integer.parseInt(req.getParameter("uniteId"));
                UniteLocation unite = uniteDao.get(uniteId);
                contrat.setUnite(unite);

                contrat.setDateDebut(LocalDate.parse(req.getParameter("dateDebut")));
                contrat.setDateFin(LocalDate.parse(req.getParameter("dateFin")));
                contrat.setStatut(StatutContrat.EN_COURS);

                contratDao.add(contrat);
                resp.sendRedirect("?action=list");
                break;

            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                ContratLocation contratUpdate = contratDao.get(id);
                if (contratUpdate != null) {
                    contratUpdate.setDateDebut(LocalDate.parse(req.getParameter("dateDebut")));
                    contratUpdate.setDateFin(LocalDate.parse(req.getParameter("dateFin")));

                    int locId = Integer.parseInt(req.getParameter("locataireId"));
                    contratUpdate.setLocataire(locataireDao.get(locId));

                    int unId = Integer.parseInt(req.getParameter("uniteId"));
                    contratUpdate.setUnite(uniteDao.get(unId));

                    String statutStr = req.getParameter("statut");
                    contratUpdate.setStatut(StatutContrat.valueOf(statutStr));

                    contratDao.update(contratUpdate);
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
                List<ContratLocation> contrats = contratDao.getAll();
                req.setAttribute("contrats", contrats);
                req.getRequestDispatcher("contrat/contrat.jsp").forward(req, resp);
                break;

            case "add":
                req.setAttribute("locataires", locataireDao.getAll());
                req.setAttribute("unites", uniteDao.getAll());
                req.getRequestDispatcher("contrat/addContrat.jsp").forward(req, resp);
                break;

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                ContratLocation contratEdit = contratDao.get(idEdit);
                req.setAttribute("contrat", contratEdit);
                req.setAttribute("locataires", locataireDao.getAll());
                req.setAttribute("unites", uniteDao.getAll());
                req.getRequestDispatcher("contrat/editContrat.jsp").forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                contratDao.delete(idDelete);
                resp.sendRedirect("?action=list");
                break;
        }
    }
}
