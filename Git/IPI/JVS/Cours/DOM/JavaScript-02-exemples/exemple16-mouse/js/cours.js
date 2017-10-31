// Renvoie le nom du bouton souris à partir de son code
function getBoutonSouris(code) {
    var bouton = "inconnu";
    switch (code) {
        case 0: bouton = "gauche"; break;
        case 1: bouton = "milieu"; break;
        case 2: bouton = "droit"; break;
    }
    return bouton;
}

// Affiche des informations sur un événement souris
function infosSouris(e) {
    console.log(e);
    console.log(
        "EVENMENT : " + e.type
        + " / BOUTON " + getBoutonSouris(e.button)
        + " / X : " + e.clientX + " / Y : " + e.clientY
    );
}

// Gestion du clic souris : sur le document
document.addEventListener("mousedown", infosSouris); // enfoncer
document.addEventListener("mouseup", infosSouris); // relacher
document.addEventListener("click", infosSouris); // cliquer