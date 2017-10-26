first = prompt('Entrer le premier chiffre :');
second = prompt('Entrez le second chiffre');

document.get.ElementById("resultats").innerHTML += document.getElementById("resultats").innerHTML('<br/>');

addition = parseInt(first) + parseInt(second);
document.getElementById('resultats').innerHTML += 'addition = ' + addition + ('<br/>');

doubleDuResultat = addition*2;

document.getElementById('resultats').innerHTML += 'double =' +doubleDuResultat;

document.write(addition);
document.write('<br/>');