// -------------------------------------------------
// Ajout d'un noeud python en dernier
// -------------------------------------------------
// creation d'un noeud li
noeud = document.createElement("li"); 
noeud.id = "python";                 
noeud.textContent = "Python";

// lien du noeud avec son parent
document.getElementById("langages").appendChild(noeud);
// Console
console.log(noeud); // le noeud créé
console.log(document.getElementById("langages"));  // son parent

// -------------------------------------------------
// Ajout d'un noeud JQuery encore après : le CSS met un fond jaune
// -------------------------------------------------
// creation d'un noeud li
noeud = document.createElement("li"); 
noeud.id = "jquery";
noeud.textContent = "JQuery";

// lien du noeud avec son parent
document.getElementById("langages").appendChild(noeud); 

// Console
console.log(noeud); // le noeud créé
console.log(document.getElementById("langages"));  // son parent

// -------------------------------------------------
// Ajout d'un noeud HTML en premier et en rose
// -------------------------------------------------
// creation d'un noeud li
noeud = document.createElement("li"); 
noeud.id = "HTML";
noeud.textContent = "HTML";

// lien du noeud avec son parent : en premier, avant le ccpp
document.getElementById("langages").insertBefore(noeud, 
    document.getElementById("ccpp"));

// Modification de la couleur
noeud.style.backgroundColor = "pink";

// Console
console.log(noeud); // le noeud créé
console.log(document.getElementById("langages"));  // son parent