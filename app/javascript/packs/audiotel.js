const message = document.getElementById('message');
const audiotel = document.getElementById('audiotel-btn');
const ajaxbtn = document.getElementById('ajax-btn');
const results = document.querySelector("#ajaxresults")


function strRandom(o) {
  var a = 10,
      b = 'abcdefghijklmnopqrstuvwxyz',
      c = '',
      d = 0,
      e = ''+b;
  if (o) {
    if (o.startsWithLowerCase) {
      c = b[Math.floor(Math.random() * b.length)];
      d = 1;
    }
    if (o.length) {
      a = o.length;
    }
    if (o.includeUpperCase) {
      e += b.toUpperCase();
    }
    if (o.includeNumbers) {
      e += '1234567890';
    }
  }
  for (; d < a; d++) {
    c += e[Math.floor(Math.random() * e.length)];
  }
  return c;
}

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
// le js pour la validation du code:

// on appel la fonction de validation et on lui passe le code a valider
document.querySelector("#valid-code")
  .addEventListener("submit", (event) =>{
      event.preventDefault();
      const Code = document.querySelector("#le-champ").value;
      isvalidCode(Code);
  })

//si le code n'est pas validé, on change son status a validé
const isvalidCode = (code) => {
  $.ajax({
  type:"GET",
  url:`api/v1/calls/${code}`,
  dataType:"json",
  data: {code: code},
  success:function(result){

    if (result.code_status == "code validé") {
    message.innerHTML = "Ce code n'est pas valide";
   } else {
    message.innerHTML = "Code validé";
        changeCodeStatus(code);
   }
     }
  })
};


const changeCodeStatus = (code) => {
// ici il faut lancer une requette pour trouver l'appel qui correspond a ce code et updater son status
  updateCall(code)
// ensuite il faut generer un code promo
    findFormule(code)
 const formule ="A200"
  generateCodePromo(formule)
};

//cette fonction update le code_status d'un call, identifié a partir de son code, a "code validé"
const updateCall = (code) => {
   $.ajax({
        url: "/api/v1/calls",
        data: {"code": code},
        type: "post"
      });
};


const generateCodePromo = (formule) => {
//il faut ajouter la prise en charge de la formule et du transid du call
  const promo_code = strRandom({
  includeNumbers: true,
  length: 8,
});
  var now = new Date();
  var date = new Date();
  date.setDate(now.getDate()+30);

  $.ajax({
        type: "post",
        url: "/api/v1/codes",
        data: { "code" :
 {
     "user_id" : gon.user_id ,
     "transid" : "transid",
     "code" : promo_code,
     "value" : "10",
     "finaluser" : null,
     "associatedorder" : null,
     "status": "a valider",
     "valid_until": date,
     "utilised_at" : null
 }},
      });

};



const findFormule = (code) => {
  const apiUrl3 = `http://localhost:3000/api/v1/calls/${code}`;
  fetch(apiUrl3)
    .then(response => response.json())
    .then((call) => {
          const formuleAppel =  call.formule
      });
}
