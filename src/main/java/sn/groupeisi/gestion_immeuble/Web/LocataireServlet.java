package sn.groupeisi.gestion_immeuble.Web;


import sn.groupeisi.gestion_immeuble.Dao.LocataireImplDao;
import sn.groupeisi.gestion_immeuble.Dao.UtilisateurImplDao;
import sn.groupeisi.gestion_immeuble.Entities.Locataire;
import sn.groupeisi.gestion_immeuble.Entities.Role;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/locataire")
public class LocataireServlet extends HttpServlet {

        private final LocataireImplDao locataireDao = new LocataireImplDao();
        UtilisateurImplDao utilisateurDao = new UtilisateurImplDao();
        List<Utilisateur> utilisateurs;

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String action = req.getParameter("action");
            if (action == null) action = "";

            switch (action) {
                case "save":
                    Locataire locataire = new Locataire();
                    UtilisateurImplDao utilisateurDao = new UtilisateurImplDao();
                    locataire.setProfession(req.getParameter("profession"));
                    locataire.setAdresse(req.getParameter("adresse"));

                    // Récupération de l'utilisateur existant via DAO
                    int utilisateurId = Integer.parseInt(req.getParameter("id_utilisateur"));
                    Utilisateur utilisateur = utilisateurDao.get(utilisateurId); // récupère depuis DB
                    locataire.setUtilisateur(utilisateur);

                    locataireDao.add(locataire);
                    resp.sendRedirect("?action=list");
                    break;

                case "update":
                    int id = Integer.parseInt(req.getParameter("id"));
                    Locataire l = locataireDao.get(id);
                    if (l != null) {
                        l.setProfession(req.getParameter("profession"));
                        l.setAdresse(req.getParameter("adresse"));
                        locataireDao.update(l);
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
                    List<Locataire> locataires = locataireDao.getAll();
                    req.setAttribute("locataires", locataires);
                    req.getRequestDispatcher("locataire/locataire.jsp").forward(req, resp);
                    break;

                case "add":
                    utilisateurs = utilisateurDao.getAll()
                            .stream() .
                            filter(u -> u.getRole() == Role.LOCATAIRE)
                            .toList(); req.setAttribute("utilisateurs", utilisateurs);
                            req.getRequestDispatcher("locataire/addLocataire.jsp").forward(req, resp);
                    break;

                case "edit":
                    int idEdit = Integer.parseInt(req.getParameter("id"));
                    utilisateurs = utilisateurDao.getAll()
                            .stream()
                            .filter(u -> u.getRole() == Role.LOCATAIRE)
                            .toList(); req.setAttribute("utilisateurs", utilisateurs);
                    Locataire locataireEdit = locataireDao.get(idEdit);
                    req.setAttribute("locataire", locataireEdit); req.getRequestDispatcher("locataire/editLocataire.jsp").forward(req, resp); break;

                case "delete":
                    int idDelete = Integer.parseInt(req.getParameter("id"));
                    locataireDao.delete(idDelete);
                    resp.sendRedirect("?action=list");
                    break;

            }
        }
}

