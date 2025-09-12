package sn.groupeisi.gestion_immeuble.Web;

import org.mindrot.jbcrypt.BCrypt;
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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UtilisateurImplDao userDao = new UtilisateurImplDao();
    private final LocataireImplDao locataireDao = new LocataireImplDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nom = req.getParameter("nom");
        String prenom = req.getParameter("prenom");
        String email = req.getParameter("email");
        String telephone = req.getParameter("telephone");
        String password = req.getParameter("password");
        String adresse = req.getParameter("adresse");
        String profession = req.getParameter("profession");

        // Vérifier si email existe déjà
        Utilisateur existing = userDao.findByEmail(email);
        if (existing != null) {
            req.setAttribute("error", "Cet email est déjà utilisé !");
            req.getRequestDispatcher("auth/register.jsp").forward(req, resp);
            return;
        }

        // Création de l'utilisateur
        Utilisateur user = new Utilisateur();
        user.setNom(nom);
        user.setPrenom(prenom);
        user.setEmail(email);
        user.setTelephone(telephone);
        user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
        user.setRole(Role.LOCATAIRE); // rôle par défaut

        userDao.add(user);

        // Création du locataire lié
        Locataire locataire = new Locataire();
        locataire.setAdresse(adresse);
        locataire.setProfession(profession);
        locataire.setUtilisateur(user);

        locataireDao.add(locataire);

        // Redirection vers la page de login
        resp.sendRedirect("dashboard");
    }
}
