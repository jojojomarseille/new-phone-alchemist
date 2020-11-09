import "bootstrap";

const message = document.getElementById('message');
const audiotel = document.getElementById('audiotel-btn');

// //on ecoute le click sur le bouton e on change le texte
// audiotel.addEventListener('click', function() {
//   message.innerHTML = "Code validé!!";
// });

// const le_champ = document.getElementById('le-champ');

// le_champ.addEventListener('input', checkValue);

// function updateValue(e) {
//   message.textContent = e.target.value;
// }

// function checkValue(e) {
//   if (e.target.value%2 == 0){
//     message.textContent = "paires";
//   } else {
//     message.textContent = "false";
//   }
// }
audiotel.addEventListener('click', function() {
  var x, text, code;
  x = document.getElementById("le-champ").value;

  var code = '<% @code %>';
  // if (isNaN(x) || x < 1 || x > 10) {
  //   message.innerHTML = "Code non valide";
  // } else {
  //   message.innerHTML = "Code valide";
  // }

  if (x == '<% @code %>') {
    message.innerHTML = "Code valide";
  } else {
    message.innerHTML = "Code non valide";
  }

})
