function myFunction() {
	//1 : Récupération de la taille de la fenêtre
    var largeur=window.innerWidth; 
    //2 : En fonction de la taille, détermination du type d'écran
    var typeEcran='';
    if(largeur<768){
    	typeEcran='smartphone - xs';
    } 
    else if(largeur<992){
    	typeEcran='tablette - sm';
    } 
    else if(largeur<1200){
    	typeEcran='ordinateur portable - md';
    } 
    else { 
    	typeEcran='ecran fixe - lg';  
    }  
    //3 : Affichage du message dans la page HTML 
    document.getElementById("largeur").innerHTML = typeEcran + " : " + largeur;
}