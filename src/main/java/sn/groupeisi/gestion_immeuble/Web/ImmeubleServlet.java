package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.ImmeubleImplDao;
import sn.groupeisi.gestion_immeuble.Dao.UtilisateurImplDao;
import sn.groupeisi.gestion_immeuble.Entities.Immeuble;
import sn.groupeisi.gestion_immeuble.Entities.Role;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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

        HttpSession session = req.getSession(false);
        Utilisateur user = (Utilisateur) session.getAttribute("user");

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
                if (user.getRole() == Role.ADMIN) {
                    int proprietaireId = Integer.parseInt(req.getParameter("proprietaireId"));
                    immeuble.setProprietaire(utilisateurDao.get(proprietaireId));
                } else if (user.getRole() == Role.PROPRIETAIRE) {
                    immeuble.setProprietaire(user); // Affecte automatiquement le propriétaire connecté
                }

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
                    if (user.getRole() == Role.ADMIN) {
                        int propId = Integer.parseInt(req.getParameter("proprietaireId"));
                        im.setProprietaire(utilisateurDao.get(propId));
                    } else if (user.getRole() == Role.PROPRIETAIRE) {
                        im.setProprietaire(user); // Ne peut pas changer le propriétaire
                    }

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

        HttpSession session = req.getSession(false);
        Utilisateur user = (Utilisateur) session.getAttribute("user");

        switch (action) {
            case "list":
                if (user != null) {
                    if (user.getRole() == Role.ADMIN) {
                        req.setAttribute("immeubles", immeubleDao.getAll());
                    } else if (user.getRole() == Role.PROPRIETAIRE) {
                        req.setAttribute("immeubles", immeubleDao.findByProprietaireId(user.getId()));
                    }
                    req.getRequestDispatcher("/immeuble/immeuble.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/login");
                }
                break;

            case "add":
                req.setAttribute("proprietaires", proprietaires);
                req.getRequestDispatcher("immeuble/addImmeuble.jsp").forward(req, resp);
                break;

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                Immeuble immeubleEdit = immeubleDao.get(idEdit);
                req.setAttribute("immeuble", immeubleEdit);

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
