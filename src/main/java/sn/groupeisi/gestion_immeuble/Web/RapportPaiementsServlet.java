package sn.groupeisi.gestion_immeuble.Web;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import sn.groupeisi.gestion_immeuble.Dao.PaiementImpleDao;
import sn.groupeisi.gestion_immeuble.Entities.Paiement;
import sn.groupeisi.gestion_immeuble.Entities.PdfReportGenerator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/rapport/paiements")
public class RapportPaiementsServlet extends HttpServlet {
    private final PaiementImpleDao paiementDao = new PaiementImpleDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Paiement> paiements = paiementDao.getAll();

        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "attachment; filename=paiements.pdf");

        try {
            PdfReportGenerator.generatePaiementsPdf(resp.getOutputStream(), paiements);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la génération du PDF");
        }
    }
}


