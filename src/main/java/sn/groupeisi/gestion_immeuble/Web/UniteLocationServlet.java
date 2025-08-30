package sn.groupeisi.gestion_immeuble.Web;



import sn.groupeisi.gestion_immeuble.Dao.ImmeubleImplDao;
import sn.groupeisi.gestion_immeuble.Dao.UniteLocationImplDao;
import sn.groupeisi.gestion_immeuble.Entities.Immeuble;
import sn.groupeisi.gestion_immeuble.Entities.StatutUnite;
import sn.groupeisi.gestion_immeuble.Entities.UniteLocation;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet("/unite")
@MultipartConfig
public class UniteLocationServlet extends HttpServlet {

    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
    private final ImmeubleImplDao immeubleDao = new ImmeubleImplDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "save":
                UniteLocation unite = new UniteLocation();
                unite.setNumero(req.getParameter("numero"));
                unite.setNombrePieces(Integer.parseInt(req.getParameter("nombrePieces")));
                unite.setSuperficie(Double.parseDouble(req.getParameter("superficie")));
                unite.setLoyerMensuel(Double.parseDouble(req.getParameter("loyerMensuel")));
                unite.setStatut(StatutUnite.valueOf(req.getParameter("statut")));

                Part filePartSave = req.getPart("image");
                if (filePartSave != null && filePartSave.getSize() > 0) {
                    String fileName = Paths.get(filePartSave.getSubmittedFileName()).getFileName().toString();

                    String uploadPath = getServletContext().getRealPath("") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();

                    filePartSave.write(uploadPath + File.separator + fileName);
                    unite.setImage(fileName);
                }

                int immeubleId = Integer.parseInt(req.getParameter("immeubleId"));
                Immeuble immeuble = immeubleDao.get(immeubleId);
                unite.setImmeuble(immeuble);

                uniteDao.add(unite);
                resp.sendRedirect("?action=list");
                break;

            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                UniteLocation u = uniteDao.get(id);
                if (u != null) {
                    u.setNumero(req.getParameter("numero"));
                    u.setNombrePieces(Integer.parseInt(req.getParameter("nombrePieces")));
                    u.setSuperficie(Double.parseDouble(req.getParameter("superficie")));
                    u.setLoyerMensuel(Double.parseDouble(req.getParameter("loyerMensuel")));
                    u.setStatut(StatutUnite.valueOf(req.getParameter("statut")));

                    // 🔹 Gestion upload image (mise à jour)
                    Part filePartUpdate = req.getPart("image");
                    if (filePartUpdate != null && filePartUpdate.getSize() > 0) {
                        String fileName = Paths.get(filePartUpdate.getSubmittedFileName()).getFileName().toString();

                        String uploadPath = getServletContext().getRealPath("") + "uploads";
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) uploadDir.mkdir();

                        filePartUpdate.write(uploadPath + File.separator + fileName);
                        u.setImage(fileName);
                    }


                    int idImmeuble = Integer.parseInt(req.getParameter("immeubleId"));
                    u.setImmeuble(immeubleDao.get(idImmeuble));

                    uniteDao.update(u);
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
                List<UniteLocation> unites = uniteDao.getAll();
                req.setAttribute("unites", unites);
                req.getRequestDispatcher("unite/unite.jsp").forward(req, resp);
                break;

            case "add":
                List<Immeuble> immeubles = immeubleDao.getAll();
                req.setAttribute("immeubles", immeubles);
                req.getRequestDispatcher("unite/addUnite.jsp").forward(req, resp);
                break;

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                UniteLocation uniteEdit = uniteDao.get(idEdit);
                req.setAttribute("unite", uniteEdit);

                List<Immeuble> allImmeubles = immeubleDao.getAll();
                req.setAttribute("immeubles", allImmeubles);

                req.getRequestDispatcher("unite/editUnite.jsp").forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                uniteDao.delete(idDelete);
                resp.sendRedirect("?action=list");
                break;
        }
    }
}
