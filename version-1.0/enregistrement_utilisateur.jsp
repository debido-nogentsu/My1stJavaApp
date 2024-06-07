<html>
<head>
<title>My 1st Java Application</title>
</head>
<body>
<%
/*******************************************************************************
***** My 1st Java Application 1.0 : enregistrement_utilisateur.jsp           ***
***** Auteur : David Nogent/Adagp, 2023                                      ***
***** JSP enregistrement un nouvel utilisateur dans la base de données       ***
*******************************************************************************/

// récupération des valeurs du formulaire que l'on place dans des variables
String nom = request.getParameter("nom");
String prenom = request.getParameter("prenom");
String email = request.getParameter("email");
String password = request.getParameter("pw");
String adresse = request.getParameter("adresse");
String cp = request.getParameter("cp");
String ville = request.getParameter("ville");

// chargement du pilote JDBC pour mysql :
Class.forName("com.mysql.jdbc.Driver");
// ouverture de la connexion avec mysql sur le port 3307, mettez 3306 si port par défaut, remplacez MyJavaApp par votre MySQL login et password :
java.sql.Connection cnx = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3307/my_java_app?user=MyJavaApp&password=MyJavaApp");
// preparation et execution de la requete SQL :
java.sql.Statement req;

// définition de la reqûete
String requete = "INSERT INTO utilisateurs VALUES(" + null + ", '" + nom + "', '" + prenom + "', '" + email +"', '" + password + "', '" + adresse + "', '" + cp + "', '" + ville + "')";

req = cnx.createStatement(); // initiation de la requête
req.executeUpdate(requete); // exécution de la requête
req.close(); // fermeture de la requête
cnx.close(); // fermeture de la connexion à la base de données

// affichage d'un message dans le navigateur
out.println("BRAVO!");
out.println("<br />");
out.println("Votre compte a &eacute;t&eacute; parfaitement cr&eacute;&eacute;");
out.println("<br />");
out.println("Vous allez &ecirc;tre redirig&eacute; vers la page d\'accueil pour connecter");
out.println("<meta http-equiv='refresh' content='5; url=index.html' />");
%>
</body>
</html>