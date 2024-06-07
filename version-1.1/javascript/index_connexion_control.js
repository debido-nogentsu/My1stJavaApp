// JavaScript Document Validant le formulaire de la page index.html
// d'après les recommandations du World Wide Web Consortium
function RecommandationW3C() {
	var email = document.forms["Connexion"]["email"]; // récupération des données du formulaire que l'on place dans des variables
	var pw = document.forms["Connexion"]["pw"];
	
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
	
return true;	
}

