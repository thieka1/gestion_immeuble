package sn.groupeisi.gestion_immeuble.Web;

import sn.groupeisi.gestion_immeuble.Dao.ImmeubleImplDao;
import sn.groupeisi.gestion_immeuble.Dao.UniteLocationImplDao;
import sn.groupeisi.gestion_immeuble.Entities.Immeuble;
import sn.groupeisi.gestion_immeuble.Entities.Role;
import sn.groupeisi.gestion_immeuble.Entities.StatutUnite;
import sn.groupeisi.gestion_immeuble.Entities.UniteLocation;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/unite")
@MultipartConfig
public class UniteLocationServlet extends HttpServlet {

    private final UniteLocationImplDao uniteDao = new UniteLocationImplDao();
    private final ImmeubleImplDao immeubleDao = new ImmeubleImplDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";

        HttpSession session = req.getSession(false);
        Utilisateur user = (Utilisateur) session.getAttribute("user");

        switch (action) {
            case "save":
                UniteLocation unite = new UniteLocation();
                unite.setNumero(req.getParameter("numero"));
                unite.setNombrePieces(Integer.parseInt(req.getParameter("nombrePieces")));
                unite.setSuperficie(Double.parseDouble(req.getParameter("superficie")));
                unite.setLoyerMensuel(Double.parseDouble(req.getParameter("loyerMensuel")));
                unite.setStatut(StatutUnite.valueOf(req.getParameter("statut")));

                // Upload image
                Part filePartSave = req.getPart("image");
                if (filePartSave != null && filePartSave.getSize() > 0) {
                    String fileName = Paths.get(filePartSave.getSubmittedFileName()).getFileName().toString();
                    String uploadPath = getServletContext().getRealPath("") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    filePartSave.write(uploadPath + File.separator + fileName);
                    unite.setImage(fileName);
                }

                // Immeuble
                int immeubleId;
                if(user.getRole() == Role.ADMIN){
                    immeubleId = Integer.parseInt(req.getParameter("immeubleId"));
                } else {
                    immeubleId = Integer.parseInt(req.getParameter("immeubleId"));
                    Immeuble imCheck = immeubleDao.get(immeubleId);
                    if(!imCheck.getProprietaire().getId().equals(user.getId())){
                        resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Vous ne pouvez pas choisir cet immeuble");
                        return;
                    }
                }
                unite.setImmeuble(immeubleDao.get(immeubleId));

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

                    // Upload image
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
                    Immeuble imCheck = immeubleDao.get(idImmeuble);
                    if(user.getRole() == Role.PROPRIETAIRE && !imCheck.getProprietaire().getId().equals(user.getId())){
                        resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Vous ne pouvez pas choisir cet immeuble");
                        return;
                    }
                    u.setImmeuble(imCheck);

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

        HttpSession session = req.getSession(false);
        Utilisateur user = (Utilisateur) session.getAttribute("user");

        switch (action) {
            case "list":
                List<UniteLocation> unites;
                if(user.getRole() == Role.ADMIN){
                    unites = uniteDao.getAll();
                } else {
                    unites = uniteDao.getAll().stream()
                            .filter(u -> u.getImmeuble().getProprietaire().getId().equals(user.getId()))
                            .collect(Collectors.toList());
                }
                req.setAttribute("unites", unites);
                req.getRequestDispatcher("unite/unite.jsp").forward(req, resp);
                break;

            case "add":
            case "edit":
                List<Immeuble> immeubles;
                if(user.getRole() == Role.ADMIN){
                    immeubles = immeubleDao.getAll();
                } else {
                    immeubles = immeubleDao.getAll().stream()
                            .filter(i -> i.getProprietaire().getId().equals(user.getId()))
                            .collect(Collectors.toList());
                }
                req.setAttribute("immeubles", immeubles);

                if("edit".equals(action)){
                    int idEdit = Integer.parseInt(req.getParameter("id"));
                    UniteLocation uniteEdit = uniteDao.get(idEdit);
                    req.setAttribute("unite", uniteEdit);
                }

                req.getRequestDispatcher("unite/" + action + "Unite.jsp").forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                UniteLocation uDelete = uniteDao.get(idDelete);
                if(user.getRole() == Role.PROPRIETAIRE && !uDelete.getImmeuble().getProprietaire().getId().equals(user.getId())){
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Vous ne pouvez pas supprimer cette unité");
                    return;
                }
                uniteDao.delete(idDelete);
                resp.sendRedirect("?action=list");
                break;

            case "nextNumero": // Nouveau cas pour AJAX
                int immeubleIdAjax = Integer.parseInt(req.getParameter("immeubleId"));
                UniteLocation lastUnite = uniteDao.findLastUniteByImmeuble(immeubleIdAjax);
                String nextNumero;
                if (lastUnite == null) {
                    nextNumero = "A001";
                } else {
                    int num = Integer.parseInt(lastUnite.getNumero().substring(1)) + 1;
                    nextNumero = String.format("A%03d", num);
                }
                resp.setContentType("text/plain");
                resp.getWriter().write(nextNumero);
                return;
        }
    }
}
