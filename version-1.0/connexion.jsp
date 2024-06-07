<html>
<head>
<title>My 1st Java Application</title>
</head>
<body>
<%
/*************************************************************
***** My 1st Java Application 1.0 : connexion.jsp          ***
***** Auteur : David Nogent/Adagp, 2023                    ***
***** JSP de connexion                                     ***
*************************************************************/

// récupération des valeurs du formulaire de la page index.html que l'on place dans des variables
String email = request.getParameter("email");
String password = request.getParameter("pw");

// chargement du pilote JDBC pour mysql
Class.forName("com.mysql.jdbc.Driver");
// ouverture de la connexion avec mysql sur le port 3307
java.sql.Connection cnx = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3307/my_java_app?user=MyJavaApp&password=MyJavaApp");

// preparation et execution de la requete SQL
java.sql.Statement req = cnx.createStatement();
java.sql.ResultSet rs = req.executeQuery("SELECT * FROM utilisateurs");
while(rs.next()){ // tant qu'il y a des données dans la base faire ce qui suit
// placer les données de la base correspondantes à Email et Password dans des variables
String db_login = rs.getString("emailUser");
String db_password = rs.getString("passwordUser");
String db_prenom = rs.getString("prenomUser");

// procéder à des vérification
if (email == db_login || db_login.equals(email))
// condition 1 : si email saisi = email base de données faire...
{ 
	if (password == db_password || db_password.equals(password))
	// condition 2 : si password saisi = password base de données faire...
	{
	out.print("<meta http-equiv='refresh' content='10; url=mon_compte.jsp' />");
	out.print("Bonjour ");
 	out.print(db_prenom);
	out.print(" !");
	out.print("<br />");
	out.print("<br />");
	out.print("Vous allez &ecirc;tre redirig&eacute; vers la page principale<br />");
	out.print("dans quelques secondes.<br />");
	out.print("Veuillez patienter...");
	}
///////////////////////////////////////////////////////////////////////////	
	else { // si condition 2 non remplie faire...
	out.print("ACC&Egrave;S R&Eacute;SERV&Eacute;");
	out.print("<br/><br/>");
	out.print("Vous devez entrer votre email et votre mot de passe<br/>");
	out.print("pour acc&egrave;der à cette partie!<br/>");
	out.print("<a href='index.html'>Revenir en arri&egrave;re.</a>");
	}
//////////////////////////////////////////////////////////////////////////////
}
else { // si condition 1 non remplie faire...
out.print("ACC&Egrave;S R&Eacute;SERV&Eacute;");
out.print("<br/><br/>");
out.print("Vous devez entrer votre email et votre mot de passe<br/>");
out.print("pour acc&egrave;der à cette partie!<br/>");
out.print("<a href='index.html'>Revenir en arri&egrave;re.</a>");
}
} // fin de while
// fermeture de la connexion
rs.close();
req.close();
cnx.close();
%>
</body>
</html>


