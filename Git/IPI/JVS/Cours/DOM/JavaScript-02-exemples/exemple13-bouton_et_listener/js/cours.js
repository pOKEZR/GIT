// la fonction lancée quand on clique
function clic() {
	console.log("Entrée dans fonction clic()!");
	alert("listener de clic() bien attaché");
}

// on récupère le noeud bouton1
var bouton1 = document.getElementById("bouton1");

// on accroche un listener au noeud bouton1 
// listener de "click" qui lance la fonction clic()
bouton1.addEventListener("click", clic);

// on récupère le noeud bouton2
var bouton2 = document.getElementById("bouton2");

// on accroche un listener au noeud bouton2 
// listener de "click" qui lance une fonction anonyme qu'on écrit
bouton2.addEventListener("click", function () {
	console.log("Entrée dans la fonction anonyme");
	alert("listener de fonction anonyme bien attaché");

});
