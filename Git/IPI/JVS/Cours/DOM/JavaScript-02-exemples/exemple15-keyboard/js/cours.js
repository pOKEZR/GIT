// Affiche des informations sur un événement clavier
function infosClavier(e) {
	console.log(e);
    console.log("Fonction infoClavier: Evènement clavier : "
    	+ e.type 
    	+ " / key : " + e.key
    	+ " / keyCode : " + e.keyCode
        + " / charCode : " + e.charCode  	
    );
}

// Gestion de l'appui sur une touche du clavier produisant un caractère
document.addEventListener("keypress", function (e) {
	console.log(e);
	console.log("Fonction anonyme: Evènement clavier : "
    	+ e.type 
        + " / key : " + e.key
        + " / keyCode : " + e.keyCode
        + " / charCode : " + e.charCode       	
    );

});

// 2ème version avec appel à une fonction
document.addEventListener("keyup", infosClavier);