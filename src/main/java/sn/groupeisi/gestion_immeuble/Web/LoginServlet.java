package sn.groupeisi.gestion_immeuble.Web;

import org.mindrot.jbcrypt.BCrypt;
import sn.groupeisi.gestion_immeuble.Dao.UtilisateurImplDao;
<<<<<<< HEAD
=======
import sn.groupeisi.gestion_immeuble.Entities.Role;
>>>>>>> 0249102 (design de l'application)
import sn.groupeisi.gestion_immeuble.Entities.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

<<<<<<< HEAD

@WebServlet("/login")
public class LoginServlet  extends HttpServlet {
=======
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
>>>>>>> 0249102 (design de l'application)

    private final UtilisateurImplDao userDao = new UtilisateurImplDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Affiche le formulaire de login
<<<<<<< HEAD
        req.getRequestDispatcher("auth/login.jsp").forward(req, resp);
=======

        req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);

>>>>>>> 0249102 (design de l'application)
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Utilisateur user = userDao.findByEmail(email);

        if (user == null || !BCrypt.checkpw(password, user.getPassword())) {
            req.setAttribute("error", "Email ou mot de passe incorrect !");
<<<<<<< HEAD
            req.getRequestDispatcher("auth/login.jsp").forward(req, resp);
            return;
        }


        // Stocker l'objet complet dans la session
        HttpSession session = req.getSession();
        session.setAttribute("currentUser", user);

        // Redirection vers le dashboard
        resp.sendRedirect("dashboard");
=======
            req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
            return;
        }

        // Création de la session et stockage de l'objet Utilisateur
        HttpSession session = req.getSession();
        session.setAttribute("user", user);


        if (user.getRole() == Role.PROPRIETAIRE) {
            session.setAttribute("proprietaireId", user.getId());
        } else if (user.getRole() == Role.LOCATAIRE) {
            session.setAttribute("locataireId", user.getId());
        } else if (user.getRole() == Role.ADMIN) {
            session.setAttribute("adminId", user.getId());
        }

        session.setAttribute("userRole", user.getRole().name());



        // Redirection selon le rôle
        switch (user.getRole()) {
            case ADMIN -> resp.sendRedirect(req.getContextPath() + "/dashboard/admin");
            case PROPRIETAIRE -> resp.sendRedirect(req.getContextPath() + "/dashboard/proprietaire");
            case LOCATAIRE -> resp.sendRedirect(req.getContextPath() + "/dashboard/locataire");
            default -> resp.sendRedirect(req.getContextPath() + "/auth/login.jsp?error=role");
        }
>>>>>>> 0249102 (design de l'application)
    }
}
