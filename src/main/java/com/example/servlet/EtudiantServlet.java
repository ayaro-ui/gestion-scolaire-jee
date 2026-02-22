package com.example.servlet;

import com.example.dao.EtudiantDAO;
import com.example.model.Etudiant;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class EtudiantServlet extends HttpServlet {

    private EtudiantDAO dao;

    @Override
    public void init() throws ServletException {
        super.init();
        dao = new EtudiantDAO();
    }

    // ===== GET ===== (liste / edit / delete)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Vérifier si l'utilisateur est connecté
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String search = request.getParameter("search");

        try {
            if (action == null) {
                List<Etudiant> liste;

                if (search != null && !search.isEmpty()) {
                    // Rechercher par nom ou CNE
                    liste = dao.searchEtudiants(search);
                } else {
                    // Afficher tout
                    liste = dao.getAllEtudiants();
                }

                request.setAttribute("liste", liste);
                request.getRequestDispatcher("/lister.jsp").forward(request, response);

            } else if (action.equals("add")) {
                request.getRequestDispatcher("/ajouter.jsp").forward(request, response);

            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Etudiant e = dao.getEtudiantById(id);
                request.setAttribute("etudiant", e);
                request.getRequestDispatcher("/modifier.jsp").forward(request, response);

            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteEtudiant(id);
                response.sendRedirect(request.getContextPath() + "/etudiant");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur : " + e.getMessage());
        }
    }

    // ===== POST ===== (ajouter / modifier)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Vérifier si l'utilisateur est connecté
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        request.setCharacterEncoding("UTF-8"); // pour accents

        String idParam = request.getParameter("id"); // existe uniquement si modification
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String cne = request.getParameter("cne");
        String email = request.getParameter("email");

        Etudiant e = new Etudiant();
        e.setNom(nom);
        e.setPrenom(prenom);
        e.setCne(cne);
        e.setEmail(email);

        try {
            if (idParam == null || idParam.isEmpty()) {
                // Ajout
                dao.addEtudiant(e);
            } else {
                // Modification
                e.setId(Integer.parseInt(idParam));
                dao.updateEtudiant(e);
            }

            // Rediriger vers la liste après ajout/modification
            response.sendRedirect(request.getContextPath() + "/etudiant");

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().println("Erreur : " + ex.getMessage());
        }
    }
}
