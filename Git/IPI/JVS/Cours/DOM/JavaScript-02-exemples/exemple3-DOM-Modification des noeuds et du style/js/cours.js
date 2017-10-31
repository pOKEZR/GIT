// ajouter le python à la liste : innerHTML += '...';

document.getElementById("langages").innerHTML += '<li id="python">Python</li>';

// plus mise à jour de la couleur de fond
document.getElementById("python").style.backgroundColor = "pink";
document.getElementById("javascript").style.backgroundColor = "pink";


// suppression du csharp
document.getElementById("langages").removeChild(
    document.getElementById("csharp")); 

// modification du texte du h1
noeud=document.querySelector("h1");
noeud.textContent += " de programmation";
noeud.textContent = noeud.textContent.toUpperCase();

// ajout d'un id sur le h1
noeud.setAttribute("id", "titre");
// modification de la couleur du h1 à partir de l'id
document.getElementById("titre").style.backgroundColor = "yellow";

// affichage du noeud en console
console.log(noeud);

