package sn.groupeisi.gestion_immeuble.Web;

import org.mindrot.jbcrypt.BCrypt;
import sn.groupeisi.gestion_immeuble.Dao.UtilisateurImplDao;
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/login")
public class LoginServlet  extends HttpServlet {

    private final UtilisateurImplDao userDao = new UtilisateurImplDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Affiche le formulaire de login
        req.getRequestDispatcher("auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Utilisateur user = userDao.findByEmail(email);

        if (user == null || !BCrypt.checkpw(password, user.getPassword())) {
            req.setAttribute("error", "Email ou mot de passe incorrect !");
            req.getRequestDispatcher("auth/login.jsp").forward(req, resp);
            return;
        }

        // Création de la session
        HttpSession session = req.getSession();
        session.setAttribute("id", user.getId());
        session.setAttribute("nom", user.getNom());
        session.setAttribute("prenom", user.getPrenom());
        session.setAttribute("role", user.getRole());

        // Redirection vers le dashboard
        resp.sendRedirect("dashboard");
    }
}
