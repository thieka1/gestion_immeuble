package sn.groupeisi.gestion_immeuble.Web;
import java.io.IOException;
import sn.groupeisi.gestion_immeuble.Dao.UtilisateurImplDao;
import sn.groupeisi.gestion_immeuble.Entities.Role;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/utilisateur")
public class UtilisateurServlet extends HttpServlet {

    private final UtilisateurImplDao utilisateurDao = new UtilisateurImplDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "save":
                Utilisateur utilisateur = new Utilisateur();
                utilisateur.setNom(req.getParameter("nom"));
                utilisateur.setPrenom(req.getParameter("prenom"));
                utilisateur.setEmail(req.getParameter("email"));
                utilisateur.setTelephone(req.getParameter("telephone"));
                utilisateur.setPassword(req.getParameter("password")); // sera hashé dans DAO
                utilisateur.setRole(Role.valueOf(req.getParameter("role"))); // ADMIN, PROPRIETAIRE, LOCATAIRE
                utilisateurDao.add(utilisateur);
                resp.sendRedirect("?action=list");
                break;

            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                Utilisateur u = utilisateurDao.get(id);
                if (u != null) {
                    u.setNom(req.getParameter("nom"));
                    u.setPrenom(req.getParameter("prenom"));
                    u.setEmail(req.getParameter("email"));
                    u.setTelephone(req.getParameter("telephone"));
                    String pwd = req.getParameter("password");
                    if (pwd != null && !pwd.isEmpty()) {
                        u.setPassword(pwd); // sera hashé dans DAO
                    }
                    u.setRole(Role.valueOf(req.getParameter("role")));
                    utilisateurDao.update(u);
                }
                resp.sendRedirect("?action=list");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") == null ? "list" : req.getParameter("action");

        switch (action) {
            case "list":
                List<Utilisateur> utilisateurs = utilisateurDao.getAll();
                req.setAttribute("utilisateurs", utilisateurs);
                req.getRequestDispatcher("utilisateur/utilisateur.jsp").forward(req, resp);

                break;

            case "add":
                req.getRequestDispatcher("utilisateur/addUtilisateur.jsp").forward(req, resp);
                break;

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                Utilisateur userEdit = utilisateurDao.get(idEdit);
                req.setAttribute("utilisateur", userEdit);
                req.getRequestDispatcher("utilisateur/editUtilisateur.jsp").forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                utilisateurDao.delete(idDelete);
                resp.sendRedirect("?action=list");
                break;
        }
    }
}
