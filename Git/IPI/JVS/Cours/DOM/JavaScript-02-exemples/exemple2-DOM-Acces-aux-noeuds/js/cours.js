// ========================================================
// Accès au noeuds
// ========================================================
console.log("Le 2ème noeud du 6ème noeud de body")
console.log(document.body.childNodes[5].childNodes[1]);

console.log("getElementById\(\"nouvelles\"\)");
console.log(document.getElementById("nouvelles")); // L'unique id nouvelles

console.log("getElementsByTagName\(\"h2\"\)");
var noeuds = document.getElementsByTagName("h2"); // Tous les h2
for (var i = 0; i < noeuds.length; i++) {
    console.log(noeuds[i]);
}

console.log("getElementsByTagName\(\"p\"\)");
var noeuds = document.getElementsByTagName("p"); // Tous les p
for (var i = 0; i < noeuds.length; i++) {
    console.log(noeuds[i]);
}

console.log("getElementById\(\"nouvelles\"\).getElementsByTagName(\"li\")");
var noeud = document.getElementById("nouvelles");
var noeuds = noeud.getElementsByTagName("li"); // Tous les li de nouvelles
for (var i = 0; i < noeuds.length; i++) {
    console.log(noeuds[i]);
}
console.log(noeuds [0]);
console.log(noeuds.item(0));
console.log(noeuds.length); 

console.log("getElementsByClassName\(\"merveilles\"\)");
var noeuds = document.getElementsByClassName("merveilles"); // Toutes les class merveilles
for (var i = 0; i < noeuds.length; i++) {
    console.log(noeuds[i]);
}

console.log("querySelectorAll\(\"p\"\)");
var noeuds = document.querySelectorAll("p"); // Tous les titres p
for (var i = 0; i < noeuds.length; i++) {
    console.log(noeuds[i]);
}

console.log("querySelectorAll\(\".existe\"\)");
var noeuds = document.querySelectorAll(".existe"); // Tous class existe
for (var i = 0; i < noeuds.length; i++) {
    console.log(noeuds[i]);
}

console.log("querySelectorAll\(\"#contenu p\"\)");
var noeuds = document.querySelectorAll("#contenu p"); // Tous les p dans id contenu
for (var i = 0; i < noeuds.length; i++) {
    console.log(noeuds[i]);
}

console.log("querySelectorAll\(\"#antiques .existe\"\)");
var noeuds = document.querySelectorAll("#antiques .existe"); // Tous class existe dans id antiques
for (var i = 0; i < noeuds.length; i++) console.log(noeuds[i]);

console.log("querySelector\(\"p\"\)");
console.log(document.querySelector("p")); // un seul : le premier 

var node=document.getElementById("antiques");
console.log(node.childNodes);
console.log(node.childNodes[0]);
console.log(node.childNodes[1]);

// ========================================================
// Accès aux informations des noeuds
// ========================================================
console.log("=============================================");
console.log("=============================================");

console.log("getElementById\(\"antiques\"\)");
console.log(document.getElementById("antiques")); // L'unique id antiques
console.log(document.getElementById("antiques").innerHTML);
console.log(document.getElementById("antiques").textContent);


console.log("querySelector\(\"a\"\).hasAttribute(\(\"href\"\)");
noeud=document.querySelector("a");
if (noeud.hasAttribute("href")) 
	console.log(noeud.getAttribute("href"));

console.log("querySelector\(\"a\"\).href");
console.log(document.querySelector("a").href);

console.log("getElementById\(\"antiques\"\).classList");
var noeuds = document.getElementById("antiques").classList;
for (var i = 0; i < noeuds.length; i++) console.log(noeuds[i]);

console.log("querySelectorAll\(\"a\"\).href");
var noeuds = document.querySelectorAll("a"); // Tous class existe dans id antiques
for (var i = 0; i < noeuds.length; i++) 
	if (noeuds[i].hasAttribute("href")) 
		console.log(noeuds[i].getAttribute("href"));

var node=document.querySelector("ul");
console.log(node.textContent);
console.log(node.innerHTML);



