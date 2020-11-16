import "bootstrap";

const message = document.getElementById('message');
const audiotel = document.getElementById('audiotel-btn');
const ajaxbtn = document.getElementById('ajax-btn')
const results = document.querySelector("#ajaxresults")



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


const isvalidCode = (code) => {
  if (gon.codes.includes(code)) {
    message.innerHTML = "Code validé";
    changeCodeStatus(code)
   } else {
    message.innerHTML = "Code non valide";
   }
};


const changeCodeStatus = (code) => {
// ici il faut lancer une requette pour trouver l'appel qui correspond a ce code et updater son status
  updateCall(code)
// ensuite il faut generer un code promo
  findFormule(code)
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

// le js pour la recherche de filmes:
document.querySelector("#search-movies")
  .addEventListener("submit", (event) => {
    results.innerHTML = "";
    event.preventDefault();
     const keyword = document.querySelector("#ajax-field").value;
     searchMovie(keyword);
  });


const searchMovie = (keyword) => {
  const apiUrl = `http://www.omdbapi.com/?s=${keyword}&apikey=adf1f2d7`;
  fetch(apiUrl)
    .then(response => response.json())
    .then((data) => {
      data.Search.forEach((movie) => {
        console.log(movie);
        results.insertAdjacentHTML("beforeend",
        `<li>
            <img src="${movie.Poster}" />
            <p>${movie.Title}</p>
        </li>`);
      });
    });
};

searchMovie("batman");


// le js pour l'autocompletion post

const search = document.querySelector("#search");
search.addEventListener("Keyup", (event) => {
  console.log(event.currentTarget.value);
});



// creer un callbackstart apres un click

// document.querySelector("#createcallbackstart-btn")
//   .addEventListener("click", (event) =>{
//     const feedback = document.getElementById('feedback');

//       $.ajax({
//         type: "get",
//         url: '/api/v1/button',
//         data: {"callbackstart":
// {
//      "transid": "transid",
//      "formule": "formule",
//      "starttime": "starttime",
//      "numero": "numero",
//      "code": "code",
//      "callernum": "callernum"

// }

//         }

// });
//       feedback.innerHTML = data
  // })

//cette fonction trouve un callbackstart a partir d'un code
// const searchCallbackstart = (code) => {
//   const apiUrl2 = `http://localhost:3000//api/v1/${code}`;
//   fetch(apiUrl2)
//     .then(response => response.json())
//     .then((call) => {
//         console.log(call.transid);
//           const transidAppel =  call.transid
//       });
// };





// audiotel.addEventListener('click', function() {
//   var x, text, code;
//   x = document.getElementById("le-champ").value;

//   var code = '<% @code %>';
//   // if (isNaN(x) || x < 1 || x > 10) {
//   //   message.innerHTML = "Code non valide";
//   // } else {
//   //   message.innerHTML = "Code valide";
//   // }

//   if (x == '<% @code %>') {
//     message.innerHTML = "Code valide";
//   } else {
//     message.innerHTML = "Code non valide";
//   }

// })
