<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion Étudiant</title>
</head>
<body>

<h2>Connexion Étudiant</h2>

<form action="etudiant-login" method="post">
    <label>Nom :</label><br>
    <input type="text" name="nom" required><br><br>

    <label>Prénom :</label><br>
    <input type="text" name="prenom" required><br><br>

    <label>CNE :</label><br>
    <input type="text" name="cne" required><br><br>

    <button type="submit">Se connecter</button>
</form>

<p style="color:red">${error}</p>

</body>
</html>