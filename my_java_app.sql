DROP DATABASE IF EXISTS my_java_app;
CREATE DATABASE my_java_app;
USE my_java_app;

CREATE TABLE utilisateurs (refUser INT AUTO_INCREMENT PRIMARY KEY, 
			   nomUser VARCHAR(120), 
			   prenomUser VARCHAR(120), 
			   emailUser VARCHAR(120), 
			   passwordUser VARCHAR(120),
			   adresseUser VARCHAR(250),
                           codepostalUser VARCHAR(10),
                           villeUser VARCHAR(200));

