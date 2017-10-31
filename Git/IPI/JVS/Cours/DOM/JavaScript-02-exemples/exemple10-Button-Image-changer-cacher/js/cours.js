function changerImage () {
	// Affichage dans la console //////////////////////////////////////
	console.log("Entrée dans changerImage")
	image=document.getElementById('image1').src;
	console.log("Image : "+image);
	console.log("Image : "+image.substring(image.lastIndexOf("/")));

	///////////////////////////////////////////////////////////////////
	// La fonction proprement dite
	///////////////////////////////////////////////////////////////////
	// On récupère le nom du fichier : attention, c'est le nom avec chemin complet
	image=document.getElementById('image1').src;
	// Le substr permet de récupérer seulement la fin : tout après le dernier "/"
	image=document.getElementById('image1').src.substring(image.lastIndexOf("/"));
	// On inverse la valeur de l'attribut src
	if(image=='/img1.jpg'){
		document.getElementById('image1').src = '../images/img2.jpg'
	}
	else{
		document.getElementById('image1').src = '../images/img1.jpg'
	}	
}

function afficherImage () {
	console.log("Entrée dans afficherImage")
	document.getElementById('image2').style.display='';
}

