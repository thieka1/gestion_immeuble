package sn.groupeisi.gestion_immeuble.Entities;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import java.io.OutputStream;
import java.util.List;

public class PdfReportGenerator {

    public static void generateDemandesPdf(OutputStream out, List<DemandeLocation> demandes) throws DocumentException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, out);
        document.open();

        // Titre
        Font titleFont = new Font(Font.HELVETICA, 16, Font.BOLD);
        Paragraph title = new Paragraph("Rapport des Demandes de Location", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);

        // Tableau
        PdfPTable table = new PdfPTable(5); // 5 colonnes
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);

        // Largeur colonnes
        float[] columnWidths = {1f, 3f, 2f, 2f, 2f};
        table.setWidths(columnWidths);

        // En-têtes
        Font headerFont = new Font(Font.HELVETICA, 12, Font.BOLD);
        table.addCell(new PdfPCell(new Phrase("ID", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Locataire", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Unité", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Date", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Statut", headerFont)));

        // Contenu
        for (DemandeLocation d : demandes) {
            table.addCell(String.valueOf(d.getId()));
            table.addCell(d.getLocataire().getUtilisateur().getNom() + " " + d.getLocataire().getUtilisateur().getPrenom());
            table.addCell(d.getUnite().getNumero());
            table.addCell(d.getDateDemande().toString());
            table.addCell(d.getStatut().toString());
        }

        document.add(table);
        document.close();
    }


    public static void generatePaiementsPdf(OutputStream out, List<Paiement> paiements) throws DocumentException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, out);
        document.open();

        // Titre
        Font titleFont = new Font(Font.HELVETICA, 16, Font.BOLD);
        Paragraph title = new Paragraph("Rapport des Paiements", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);

        // Tableau
        PdfPTable table = new PdfPTable(5); // 5 colonnes
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);
        table.setWidths(new float[]{1f, 3f, 2f, 2f, 2f});

        // En-têtes
        Font headerFont = new Font(Font.HELVETICA, 12, Font.BOLD);
        table.addCell(new PdfPCell(new Phrase("ID", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Locataire", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Unité", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Montant", headerFont)));
        table.addCell(new PdfPCell(new Phrase("Date Paiement", headerFont)));

        // Contenu
        for (Paiement p : paiements) {
            table.addCell(String.valueOf(p.getId()));
            table.addCell(p.getContratLocation().getLocataire().getUtilisateur().getNom() + " " + p.getContratLocation().getLocataire().getUtilisateur().getPrenom());
            table.addCell(p.getContratLocation().getUnite().getNumero());
            table.addCell(String.valueOf(p.getMontant()));
            table.addCell(p.getDatePaiement().toString());
        }

        document.add(table);
        document.close();
    }

}
