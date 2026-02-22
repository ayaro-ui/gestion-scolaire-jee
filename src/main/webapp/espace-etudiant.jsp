<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.model.Etudiant" %>

<%
    Etudiant etu = (Etudiant) session.getAttribute("etudiant");
    if (etu == null) {
        response.sendRedirect("etudiant-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Espace Étudiant</title>
</head>
<body>

<h2>Bienvenue <%= etu.getPrenom() %> <%= etu.getNom() %></h2>

<p><strong>CNE :</strong> <%= etu.getCne() %></p>
<p><strong>Email :</strong> <%= etu.getEmail() %></p>

<hr>
<a href="logout-etudiant">Déconnexion</a>

</body>
</html>