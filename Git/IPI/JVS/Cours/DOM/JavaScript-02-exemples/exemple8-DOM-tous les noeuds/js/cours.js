// 2 fonctions pour ne pas avoir les noeuds d'espaces et passages à la ligne
function is_all_ws( nod ) { return !(/[^\t\n\r ]/.test(nod.data)); }
function is_ignorable( nod ) { return ( nod.nodeType == 8) || ( (nod.nodeType == 3) && is_all_ws(nod) );}

// noeud    : noeud à afficher
// cpt      : compteur du numéro de l'enfant à afficher
// decalage : pour indenter l'affichage
function afficherArbre(noeud, cpt, decalage) {
	// on saute les noeuds texte pour alléger
    if(noeud.nodeType==Node.TEXT_NODE) return; 
    console.log(decalage+noeud.parentNode.nodeName+'['+cpt+'] : '+noeud.nodeName);
    // pour alléger on // noeuds[i]
    // console.log(noeuds[i]);
    for (var i=0, j=0; i < noeud.childNodes.length; i++) {
        if(!is_ignorable(noeud.childNodes[i])) {
            afficherArbre(noeud.childNodes[i], j++, decalage+'     ');        
        }
    }       
}

// Affiche tous les noeuds
console.log("ARBRE");
// Le premier noeud, c'est le documentElement
// Le numéro de l'enfant, c'est 0
// Le décalage, c'est chaine vide
afficherArbre(document.documentElement,0,'');