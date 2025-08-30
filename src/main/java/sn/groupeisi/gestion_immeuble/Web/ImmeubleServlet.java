package sn.groupeisi.gestion_immeuble.Web;


import sn.groupeisi.gestion_immeuble.Dao.ImmeubleImplDao;
import sn.groupeisi.gestion_immeuble.Dao.UtilisateurImplDao;
import sn.groupeisi.gestion_immeuble.Entities.Immeuble;
import sn.groupeisi.gestion_immeuble.Entities.Role;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;

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

@WebServlet("/immeuble")
@MultipartConfig
public class ImmeubleServlet extends HttpServlet {

    private final ImmeubleImplDao immeubleDao = new ImmeubleImplDao();
    private final UtilisateurImplDao utilisateurDao = new UtilisateurImplDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "save":
                Immeuble immeuble = new Immeuble();
                immeuble.setNom(req.getParameter("nom"));
                immeuble.setAdresse(req.getParameter("adresse"));
                immeuble.setNombreEtages(Integer.parseInt(req.getParameter("nombreEtages")));
                immeuble.setDescription(req.getParameter("description"));

                // 🔹 Gestion upload image
                Part filePartSave = req.getPart("image");
                if (filePartSave != null && filePartSave.getSize() > 0) {
                    String fileName = Paths.get(filePartSave.getSubmittedFileName()).getFileName().toString();

                    String uploadPath = getServletContext().getRealPath("") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();

                    filePartSave.write(uploadPath + File.separator + fileName);
                    immeuble.setImage(fileName);
                }

                // 🔹 Équipements
                String equipementsStrSave = req.getParameter("equipements");
                if (equipementsStrSave != null && !equipementsStrSave.isEmpty()) {
                    String[] equipementsArray = equipementsStrSave.split(",");
                    for (String eq : equipementsArray) {
                        immeuble.getEquipements().add(eq.trim());
                    }
                }

                // 🔹 Propriétaire
                int proprietaireIdSave = Integer.parseInt(req.getParameter("proprietaireId"));
                Utilisateur proprietaire = utilisateurDao.get(proprietaireIdSave);
                immeuble.setProprietaire(proprietaire);

                immeubleDao.add(immeuble);
                resp.sendRedirect("?action=list");
                break;

            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                Immeuble im = immeubleDao.get(id);

                if (im != null) {
                    im.setNom(req.getParameter("nom"));
                    im.setAdresse(req.getParameter("adresse"));
                    im.setNombreEtages(Integer.parseInt(req.getParameter("nombreEtages")));
                    im.setDescription(req.getParameter("description"));

                    // 🔹 Gestion upload image (mise à jour)
                    Part filePartUpdate = req.getPart("image");
                    if (filePartUpdate != null && filePartUpdate.getSize() > 0) {
                        String fileName = Paths.get(filePartUpdate.getSubmittedFileName()).getFileName().toString();

                        String uploadPath = getServletContext().getRealPath("") + "uploads";
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) uploadDir.mkdir();

                        filePartUpdate.write(uploadPath + File.separator + fileName);
                        im.setImage(fileName);
                    }

                    // 🔹 Équipements
                    String eqStr = req.getParameter("equipements");
                    im.getEquipements().clear();
                    if (eqStr != null && !eqStr.isEmpty()) {
                        String[] eqArray = eqStr.split(",");
                        for (String eq : eqArray) {
                            im.getEquipements().add(eq.trim());
                        }
                    }

                    // 🔹 Propriétaire
                    int propId = Integer.parseInt(req.getParameter("proprietaireId"));
                    im.setProprietaire(utilisateurDao.get(propId));

                    immeubleDao.update(im);
                }

                resp.sendRedirect("?action=list");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) action = "list";
        List<Utilisateur> proprietaires = utilisateurDao.getAll()
                .stream()
                .filter(u -> u.getRole() == Role.PROPRIETAIRE)
                .toList();

        switch (action) {
            case "list":
                List<Immeuble> immeubles = immeubleDao.getAll();
                req.setAttribute("immeubles", immeubles);
                req.getRequestDispatcher("immeuble/immeuble.jsp").forward(req, resp);
                break;

            case "add":
                req.setAttribute("proprietaires", proprietaires);
                req.getRequestDispatcher("immeuble/addImmeuble.jsp").forward(req, resp);
                break;

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                Immeuble immeubleEdit = immeubleDao.get(idEdit);
                req.setAttribute("immeuble", immeubleEdit);

                // Transformer la liste des équipements en chaîne séparée par des virgules
                String equipementsStr = String.join(", ", immeubleEdit.getEquipements());
                req.setAttribute("equipementsStr", equipementsStr);

                req.setAttribute("proprietaires", proprietaires);
                req.getRequestDispatcher("immeuble/editImmeuble.jsp").forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                immeubleDao.delete(idDelete);
                resp.sendRedirect("?action=list");
                break;
        }
    }
}
