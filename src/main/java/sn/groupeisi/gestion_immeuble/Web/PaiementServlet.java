package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.ContratLocationImplDao;
import sn.groupeisi.gestion_immeuble.Dao.PaiementImpleDao;
import sn.groupeisi.gestion_immeuble.Entities.ContratLocation;
import sn.groupeisi.gestion_immeuble.Entities.Paiement;
import sn.groupeisi.gestion_immeuble.Entities.StatutPaiement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/paiement")
public class PaiementServlet extends HttpServlet {

    private final PaiementImpleDao paiementDao = new PaiementImpleDao();
    private final ContratLocationImplDao contratDao = new ContratLocationImplDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "save":
                Paiement paiement = new Paiement();
                paiement.setDatePaiement(LocalDate.parse(req.getParameter("datePaiement")));
                paiement.setMontant(Double.parseDouble(req.getParameter("montant")));
                paiement.setStatut(StatutPaiement.valueOf(req.getParameter("statut")));

                int contratId = Integer.parseInt(req.getParameter("contratId"));
                ContratLocation contrat = contratDao.get(contratId);
                paiement.setContratLocation(contrat);

                paiementDao.add(paiement);
                resp.sendRedirect("?action=list");
                break;

            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                Paiement paiementUpdate = paiementDao.get(id);
                if (paiementUpdate != null) {
                    paiementUpdate.setDatePaiement(LocalDate.parse(req.getParameter("datePaiement")));
                    paiementUpdate.setMontant(Double.parseDouble(req.getParameter("montant")));
                    paiementUpdate.setStatut(StatutPaiement.valueOf(req.getParameter("statut")));

                    int cId = Integer.parseInt(req.getParameter("contratId"));
                    paiementUpdate.setContratLocation(contratDao.get(cId));

                    paiementDao.update(paiementUpdate);
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
                List<Paiement> paiements = paiementDao.getAll();
                req.setAttribute("paiements", paiements);
                req.getRequestDispatcher("paiement/paiement.jsp").forward(req, resp);
                break;

            case "add":
                req.setAttribute("contrats", contratDao.getAll());
                req.getRequestDispatcher("paiement/addPaiement.jsp").forward(req, resp);
                break;

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                Paiement paiementEdit = paiementDao.get(idEdit);
                req.setAttribute("paiement", paiementEdit);
                req.setAttribute("contrats", contratDao.getAll());
                req.getRequestDispatcher("paiement/editPaiement.jsp").forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                paiementDao.delete(idDelete);
                resp.sendRedirect("?action=list");
                break;
        }
    }
}
