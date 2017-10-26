function Rectangle(){

	longueur = prompt("Entrez la longueur");
	largeur = prompt("Entrez la largeur");

	peri = 2 * longueur + 2 * largeur;
	surface = longueur * largeur;
	alert("Perimètre = " + peri);
	alert("Surface = " + surface);
 
}

function perimetreCercle(){
	var rayon=parseFloat(prompt("Entrez le rayon du cercle : "));
	var perimetre=(2*Math.PI*rayon).toFixed(2);
	return perimetre;
}

function perimetreCerclePourBouton(){
	var perimetre=perimetreCercle();
	alert('Perimètre du cercle : ' + perimetre);
}

perimetre=perimetreCercle();
console.log("Perimètre du cercle : " , perimetre);
document.write("Perimètre du cercle : ", perimetre);