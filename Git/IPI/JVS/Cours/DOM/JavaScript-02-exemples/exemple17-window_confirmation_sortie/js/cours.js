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