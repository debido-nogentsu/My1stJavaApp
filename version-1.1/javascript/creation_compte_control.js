// JavaScript Document Validant le formulaire de la page index.html
// d'après les recommandations du World Wide Web Consortium
function RecommandationW3C() {
	var email = document.forms["Connexion"]["email"]; // récupération des données du formulaire que l'on place dans des variables
	var pw = document.forms["Connexion"]["pw"];
	
	var nom = document.forms["Connexion"]["nom"];
	var prenom = document.forms["Connexion"]["prenom"];
	var adresse = document.forms["Connexion"]["adresse"];
	var cp = document.forms["Connexion"]["cp"];
	var ville = document.forms["Connexion"]["ville"];
	
	if (email.value == "") {
	alert("Veuillez saisir votre adresse email !");
	email.focus();
	return false;
	}
	
	if (email.value.indexOf("@", 0) < 0)                 
    { 
    alert("Mettez une adresse email valide !"); 
    email.focus(); 
    return false; 
    }    
    
	if (email.value.indexOf(".", 0) < 0)                 
    { 
    alert("Mettez une adresse email valide !"); 
    email.focus(); 
    return false; 
    }    
	
	if (pw.value == "") {
	alert("Veuillez saisir votre mot de passe !");
	pw.focus();
	return false;
	}
	
	if (nom.value == "") {
	alert("Veuillez saisir votre nom !");
	nom.focus();
	return false;
	}
	
	if (prenom.value == "") {
	alert("Veuillez saisir votre pr&eacute;nom !");
	prenom.focus();
	return false;
	}
	
	if (adresse.value == "") {
	alert("Veuillez saisir votre adresse !");
	adresse.focus();
	return false;
	}
	
	if (cp.value == "") {
	alert("Veuillez saisir votre code postal !");
	cp.focus();
	return false;
	}
	
	if (ville.value == "") {
	alert("Veuillez saisir votre ville !");
	vlle.focus();
	return false;
	}
	
return true;	
}

