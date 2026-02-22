package com.example.servlet;

import com.example.dao.EtudiantDAO;
import com.example.model.Etudiant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/etudiant-login")
public class EtudiantLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String cne = request.getParameter("cne");

        EtudiantDAO dao = new EtudiantDAO();
        Etudiant etu = dao.loginEtudiant(nom, prenom, cne);

        if (etu != null) {
            HttpSession session = request.getSession();
            session.setAttribute("etudiant", etu);
            response.sendRedirect("espace-etudiant.jsp");
        } else {
            request.setAttribute("error", "Nom, prénom ou CNE incorrect");
            request.getRequestDispatcher("etudiant-login.jsp").forward(request, response);
        }
    }
}