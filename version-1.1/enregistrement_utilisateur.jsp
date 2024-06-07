<%@page language="java" import="java.util.Date" import="java.text.SimpleDateFormat" %>
<html>
<head>
<title>My 1st Java Application</title>
<!-- lien vers la feuille de style -->
<link rel="stylesheet" type="text/css" href="css/my_style_app.css" media="screen" />
</head>

<body>
<div id="titre">My 1st Java Application</div>
<p id="version">version 1.1</p>
<div id="java_logo">
<img src="images/java.png" height="400" width="400" alt="java" />
</div>
<%
/****************************************************************************
***** My 1st Java Application 1.1 : enregistrement_utiliateur.jsp         ***
***** Auteur : David Nogent/Adagp, 2023                                   ***
***** Page JSP qui enregistre un nouveau compte                           ***
****************************************************************************/
// Affichage de la date du jour au format JJ/MM/AA HH:MM:SS 
SimpleDateFormat today = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
Date date = new java.util.Date();
String aujourd8 = today.format(date);

// récupération des valeurs du formulaire que l'on place dans des variables
String nom = request.getParameter("nom");
String prenom = request.getParameter("prenom");
String email = request.getParameter("email");
String password = request.getParameter("pw");
String adresse = request.getParameter("adresse");
String cp = request.getParameter("cp");
String ville = request.getParameter("ville");

try {

// chargement du pilote JDBC pour mysql
Class.forName("com.mysql.jdbc.Driver");
// ouverture de la connexion avec mysql sur le port 3307
java.sql.Connection cnx = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3307/my_java_app?user=MyJavaApp&password=MyJavaApp");

// preparation et execution de la requete SQL
java.sql.Statement req = cnx.createStatement();
java.sql.ResultSet rs = req.executeQuery("SELECT * FROM utilisateurs WHERE emailUser='" + email + "'");

if (rs.next()){ // si l'email saisi existe dans la base alors le programme affiche cela
	String emailUser = rs.getString("emailUser");
	out.println("<p id='message'>");
	out.println("Un compte existe d&eacute;j&agrave; avec cet email.");
	out.println("<br />");
	out.println("Si vous &ecirc;tes le propri&eacute;taire de ce mail : <font color='FF0'>");
	out.println(emailUser);
	out.println("</font>,");
	out.println("<br />");
	out.println("contactez un administrateur de la plateforme.");
	out.println("<br />");
	out.println("<a href='index.html'>Retour</a>");
	out.println("</p>");
	// fermeture de la connexion
	rs.close();
	req.close(); 
	cnx.close(); 

	}
	
	else { // si le mail saisi n'existe pas dans la base alors le programme procède à l'enregistrement du nouveau compte
	
// chargement du pilote JDBC pour mysql :
	Class.forName("com.mysql.jdbc.Driver");
// ouverture de la connexion avec mysql sur le port 3307, mettez 3306 si port par défaut, remplacez MyJavaApp par votre MySQL login et password :
	java.sql.Connection cnx2 = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3307/my_java_app?user=MyJavaApp&password=MyJavaApp");
// preparation et execution de la requete SQL :
	java.sql.Statement req2;

// définition de la reqûete
	String requete = "INSERT INTO utilisateurs VALUES(" + null + ", '" + nom + "', '" + prenom + "', '" + email +"', '" + password + "', '" + adresse + "', '" + cp + "', '" + ville + "','" + aujourd8 + "')";
	req2 = cnx.createStatement(); // initiation de la requête
	req2.executeUpdate(requete); // exécution de la requête
	req2.close(); // fermeture de la requête
	cnx2.close(); // fermeture de la connexion à la base de données

	out.println("<p id='message'>");
	out.println("BRAVO!");
	out.println("<br />");
	out.println("Votre compte a &eacute;t&eacute; parfaitement cr&eacute;&eacute;");
	out.println("<br />");
	out.println("Vous allez &ecirc;tre redirig&eacute; vers la page d\'accueil pour vous connecter");
	out.println("<meta http-equiv='refresh' content='10; url=index.html' />");
	out.print("</p>");
		
	}

}

finally {
	
	// utilisation obligatoire de finally dès lors qu'on utilise try, toutefois, les arguments à l'intérieur sont facultatifs

}
%>
<div id="copyright">&copy; 2023-2024 David Nogent Enterprises/Adagp. Droits R&eacute;serv&eacute;s.</div>
</body>
</html>