console.log("------------BALISE HTML-----------");
afficherInfos(document.documentElement);

console.log("------------BALISE HEAD-----------");
afficherInfos(document.head);

console.log("------------BALISE BODY-----------");
afficherInfos(document.body);

function afficherInfos(noeud){
    console.log('NodeName : '+noeud.nodeName);
    // pour alléger on // textContent et innerHTML
    // console.log('textContent : '+noeud.textContent)
    // console.log('innerHTML : '+noeud.innerHTML);
    console.log('Les childNodes :')
    afficherLesNoeuds(noeud.childNodes);
}

function afficherLesNoeuds(noeuds){
    for (var i=0, j=0; i < noeuds.length; i++) {
        if(!noeudIgnorable(noeuds[i])) {
            console.log(noeuds[i].parentNode.nodeName+'['+j+'] : '
              +noeuds[i].nodeName);
            // le compteur j permet de numéroter les enfants par pas de 1
            // on ne l'incrémenter que quand on a un noeud à afficher
            j++; 
            // pour alléger on // noeuds[i]
            // console.log(noeuds[i]);
        }         
    }
}

/**
 * Détermine si un noeud devrait être ignoré par les fonctions itérateurs.
 *
 * @param noeud  Un noeud du DOM |Node|
 * @return     vrai si le noeud est :
 *                1) un noeud |Text| composé uniquement de blancs
 *                2) un noeud de commentaire |Comment|
 *             et faux dans les autres cas.
 */

function noeudIgnorable(noeud) {
  if ( noeud.nodeType == Node.COMMENT_NODE) return true;
  if ( (noeud.nodeType == Node.TEXT_NODE) && noeudVide(noeud) ) return true; 
  return false;
}

/**
 * Détermine si un noeud texte est entièrement composé de blancs
 *
 * @param noeud  Un noeud du DOM |Node|
 * @return     Vrai si tout le contenu texte de |noeud| est composé de blancs,
 *             faux dans les autres cas.
 */
function noeudVide(noeud) {
  // Utilisation des fonctionnalités String et RegExp d'ECMA-262 Edition 3
  if ( /[^\t\n\r ]/.test(noeud.data) ) return false;
  return true;
}
