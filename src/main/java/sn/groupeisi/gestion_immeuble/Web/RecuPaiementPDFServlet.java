package sn.groupeisi.gestion_immeuble.Web;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import sn.groupeisi.gestion_immeuble.Dao.PaiementImpleDao;
import sn.groupeisi.gestion_immeuble.Entities.Paiement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.*;
import java.io.IOException;

@WebServlet("/recu-paiement")
public class RecuPaiementPDFServlet extends HttpServlet {

    private final PaiementImpleDao paiementDao = new PaiementImpleDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int paiementId;
        try {
            paiementId = Integer.parseInt(req.getParameter("id"));
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID paiement invalide");
            return;
        }

        Paiement paiement = paiementDao.get(paiementId);
        if (paiement == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Paiement non trouvé");
            return;
        }

        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "attachment; filename=recu_" + paiement.getId() + ".pdf");

        try {
            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, resp.getOutputStream());
            document.open();

            // --- Logo ---
            // Image logo = Image.getInstance("chemin/vers/logo.png");
            // logo.scaleToFit(120, 60);
            // logo.setAlignment(Element.ALIGN_CENTER);
            // document.add(logo);

            // --- Titre ---
            Paragraph title = new Paragraph("REÇU DE PAIEMENT", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, Color.BLACK));
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(Chunk.NEWLINE);

            // --- Informations principales ---
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(80);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);
            table.setHorizontalAlignment(Element.ALIGN_CENTER);

            PdfPCell cell1 = new PdfPCell(new Phrase("ID Paiement"));
            PdfPCell cell2 = new PdfPCell(new Phrase(String.valueOf(paiement.getId())));
            cell1.setBackgroundColor(Color.LIGHT_GRAY);
            table.addCell(cell1);
            table.addCell(cell2);

            table.addCell(new PdfPCell(new Phrase("Date Paiement")));
            table.addCell(new PdfPCell(new Phrase(paiement.getDatePaiement().toString())));

            table.addCell(new PdfPCell(new Phrase("Montant")));
            table.addCell(new PdfPCell(new Phrase(paiement.getMontant() + " Fcfa")));

            table.addCell(new PdfPCell(new Phrase("Contrat ID")));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(paiement.getContratLocation().getId()))));

            table.addCell(new PdfPCell(new Phrase("Locataire")));
            table.addCell(new PdfPCell(new Phrase(
                    paiement.getContratLocation().getLocataire().getUtilisateur().getPrenom() + " " +
                            paiement.getContratLocation().getLocataire().getUtilisateur().getNom()
            )));

            table.addCell(new PdfPCell(new Phrase("Statut")));
            table.addCell(new PdfPCell(new Phrase(paiement.getStatut().toString())));

            document.add(table);

            document.add(Chunk.NEWLINE);
            Paragraph footer = new Paragraph("Merci pour votre paiement.", FontFactory.getFont(FontFactory.HELVETICA, 12, Color.DARK_GRAY));
            footer.setAlignment(Element.ALIGN_CENTER);
            document.add(footer);

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
