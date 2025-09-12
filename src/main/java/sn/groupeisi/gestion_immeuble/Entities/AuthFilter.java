package sn.groupeisi.gestion_immeuble.Entities;

import javax.servlet.*;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        String role = (session != null) ? (String) session.getAttribute("role") : null;

        // Pages publiques accessibles sans login
        if (uri.contains("/auth/") || uri.endsWith("login") || uri.endsWith("register.jsp")
                || uri.contains("/css/") || uri.contains("/js/") || uri.contains("/images/")) {
            chain.doFilter(request, response);
            return;
        }

        // Vérification des rôles
        if (uri.contains("/admin/") && !"ADMIN".equals(role)) {
            resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
            return;
        }

        if (uri.contains("/proprietaire/") && !"PROPRIETAIRE".equals(role)) {
            resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
            return;
        }

        if (uri.contains("/locataire/") && !"LOCATAIRE".equals(role)) {
            resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
            return;
        }

        // Tout est OK
        chain.doFilter(request, response);
    }
}
