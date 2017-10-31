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
    for (var i = 0; i < noeuds.length; i++) {
        console.log(noeuds[i].parentNode.nodeName+'['+i+'] : '
          +noeuds[i].nodeName);
        // pour alléger on // noeuds[i]
        // console.log(noeuds[i]);
    }
}
