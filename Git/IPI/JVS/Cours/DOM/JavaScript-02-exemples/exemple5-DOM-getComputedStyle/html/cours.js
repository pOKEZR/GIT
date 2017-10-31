var noeuds = document.getElementsByTagName("p");
console.log("Les couleurs des <p> AVANT modif du premier <p> : ");
console.log(noeuds);
console.log("noeuds[0].style.color : "+noeuds[0].style.color); // N'affiche rien car aucune couleur
console.log("noeuds[1].style.color : "+noeuds[1].style.color); // Affiche "green"
console.log("noeuds[2].style.color : "+noeuds[2].style.color); // N'affiche rien car la couleur est dans le CSS

console.log("Les couleurs avec un getComputedStyle <p> : ");
console.log("noeuds[0].style.color : "+getComputedStyle(noeuds[0]).color); // Affiche rouge en RGB : 255.0.0
console.log("noeuds[1].style.color : "+getComputedStyle(noeuds[1]).color); // Affiche vert en RGB :
console.log("noeuds[2].style.color : "+getComputedStyle(noeuds[2]).color); // Affiche bleue en RGB : 0.0.255


//var noeuds = document.querySelectorAll("p");
for (var i = 0; i < noeuds.length; i++) {
	noeuds[i].style.color = "red";
	noeuds[i].style.margin = "50px";
	noeuds[i].style.fontStyle = "italic";
}

var noeuds = document.getElementsByTagName("p");
console.log("Les couleurs des <p> APRES modif du premier <p> : ");
console.log("noeuds[0].style.color : "+noeuds[0].style.color); // Affiche "red"
console.log("noeuds[1].style.color : "+noeuds[1].style.color); // Affiche "red"
console.log("noeuds[2].style.color : "+noeuds[2].style.color); // Affiche "red"

console.log("Les couleurs avec un getComputedStyle <p> : ");
console.log("noeuds[0].style.color : "+getComputedStyle(noeuds[0]).color); // Affiche rouge en RGB : 255.0.0
console.log("noeuds[1].style.color : "+getComputedStyle(noeuds[1]).color); // Affiche rouge en RGB : 255.0.0
console.log("noeuds[2].style.color : "+getComputedStyle(noeuds[2]).color); // Affiche rouge en RGB : 255.0.0
