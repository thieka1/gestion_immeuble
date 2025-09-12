package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.DemandeLocationImplDao;
import sn.groupeisi.gestion_immeuble.Entities.DemandeLocation;
import sn.groupeisi.gestion_immeuble.Entities.PdfReportGenerator;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/rapport/demandes")
public class RapportDemandesServlet extends HttpServlet {

    private final DemandeLocationImplDao demandeDao = new DemandeLocationImplDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<DemandeLocation> demandes = demandeDao.getAll();

        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "attachment; filename=demandes.pdf");

        try {
            PdfReportGenerator.generateDemandesPdf(resp.getOutputStream(), demandes);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la génération du PDF");
        }
    }
}
