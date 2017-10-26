function afficherTabConsole(tab){
	console.log('Affichage avec afficherConsole : ');
	for(i=0;i<tab.length;i++){
		console.log(tab[i]);
	}
}

function afficherTabHTML(tableau){
	document.write('<table><tr>');
	for(i=0;i<tab.length;i++){
		document.write('<td>'+tab[i]+'</td>');
	}
	document.write('</tr></table>')
}

function plusQue10(tableau){
	console.log('Fonction plusQue10 : ');
	var nbEleves=0;
	for(i=0;i<tableau.length; i++){
		if(tableau[i]>=10){
			nbEleves=nbEleves+1;
		}
	}
	return nbEleves;
}

function moyenneTableau(tableau){
	console.log('Fonction moyenneTableau : ');
	var somme=0;
	for(i=0;i<tableau.length; i++){
		somme=somme+tableau[i];
	}
	var	moy=(somme/tableau.length).toFixed(2);
	return moy;
}

function max(tableau){
	var maxi=0;
	for(i=0;i<tableau.length; i++){
		if(tableau[i]>maxi){
			maxi = tableau[i];
		}
	}
	return maxi;
}

tab=[8,12,9,12,17,18,15,13];
console.log(tab);
afficherTabConsole(tab);
afficherTabHTML(tab);
document.write('Plus que 10 : '+plusQue10(tab)+'<br>');
console.log('Plus que 10 : '+plusQue10(tab)+'<br>');
document.write('Moyenne : '+moyenneTableau(tab)+'<br>');
document.write('La note maximale est : ' + max(tab));