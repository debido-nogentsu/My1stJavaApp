<html>
<head>
<title>My 1st Java Application</title>
</head>
<body>
<%
/*******************************************************************************
***** My 1st Java Application 1.0 : mon_compte.jsp                           ***
***** Auteur : David Nogent/Adagp, 2023                                      ***
***** JSP représentant la page principale mon compte                         ***
*******************************************************************************/

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
String db_nom = rs.getString("nomUser");
String db_ref = rs.getString("refUser");

out.println("Bienvenue sur votre page principale");
out.println("Vous &ecirc;tes l\'utilisateur #");
out.println(db_ref);
out.println(".");
out.println("<br />");
out.println(db_nom);
out.println(" ");
out.println(db_prenom);

} // fin de while
// fermeture de la connexion
rs.close();
req.close();
cnx.close();
%>
</body>
</html>


