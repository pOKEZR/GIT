// on récupère le noeud du bouton
var noeudBouton = document.getElementById("bouton");

// Le noeud Bouton écoute (listener) l’événement “click” 
// et lance la function clic
// event est un événement
noeudBouton.addEventListener("click", function (test) {
    console.log("Entrée dans la fonction du addEventListener !"+ 
       " / Evénement : "+test.type + 
       " / Bouton : "+test.target.textContent + // e.target = noeud déclencheur
       " / Balise : "+test.target.nodeName
)});