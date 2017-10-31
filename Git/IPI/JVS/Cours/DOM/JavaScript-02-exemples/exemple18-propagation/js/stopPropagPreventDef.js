// ajout d'un listener niveau window : le navigateur
window.addEventListener("beforeunload", function (e) {
    // console.log
    console.log("beforeunload");
    console.log(e);

    // on définit un message qui n'apparaît nul part !
  var message = "On est bien ici !"; 

    // on set returnValue : 
    // ça provoque une demande de confirmation (standard)
    e.returnValue = message; 

    // on return le message :
    // ça provoque une demande de conf. dans certains navigateur
    return message; 
});

// Annulation du comportement standard, ici un href
document.getElementById("interdit1").addEventListener("click", function (e) {
    alert("Continuez plutôt à lire le cours !");
    console.log("e.preventDefault()");  
    onsole.log(e);      
    e.preventDefault(); // blocage du lien
});

// Annulation du comportement du noeud parent : ici la window
document.getElementById("interdit2").addEventListener("click", function (e) {
    console.log("e.stopPropagation()");  
    e.stopPropagation(); // arrêt de la propagation
    // ne marche pas dans tous les navigateurs
});


