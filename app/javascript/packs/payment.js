const promoCodeMessage = document.querySelector("#messagePromoCode");
var movingprice = gon.price ;
var codesInUse = [];

const totalPrice = document.querySelector("#totalPrice");
const codesEnCours = document.querySelector("#codesEnCours");


const printPrice = (price) => {
  if (price < 0){
    totalPrice.innerHTML = "0€";
    document.querySelector("#btnCheckoutByCard").style.display = none;
  } else {
totalPrice.innerHTML = `${price}€`;
}
}

printPrice(movingprice);

document.querySelector("#valid-promoCode")
.addEventListener("submit", (event) =>{
      event.preventDefault();
      const promoCodeToCheck = document.querySelector("#promoCode-le-champ").value;
      isPromoCodeValid(promoCodeToCheck);

      // console.log(promoCodeToCheck);
     //  promoCodeMessage.innerHTML = "coucou";
     // promoCodeMessage.insertAdjacentHTML("beforeend",
     //     `<p>${promoCodeToCheck}</p>`);
  })


const userPromoCodes = (user_id) => {

}

// const isPromoCodeValid = (promoCodeToCheck) => {
//   $.ajax({
//   type:"GET",
//   url:`/api/v1/codes/${promoCodeToCheck}`,
//   dataType:"json",
//   // data: {code: code},
//   success:function(result){
//     console.log(result);
//     if (result == null) {
//     promoCodeMessage.innerHTML = "Ce code est null";
//    } else if (result.status == "a valider" ){
//     promoCodeMessage.innerHTML = "Code pris en compte";
//     // changeCodeStatus(result.code);
//     addToCodesInUse(result.code)
//     const pricetable = document.querySelector("#pricetable");
//     codesEnCours.innerHTML += `<li> code ${result.code}:  -${result.value}€</li>`;
//     updateOrderPrice(result.value);
//     updateOrderPrice2(result.code);
//     } else {
//     promoCodeMessage.innerHTML = "Code non utilisable";
//    }
//      }
//   })

// }

const changeCodeStatus = (code) => {
  $.ajax({
        url: "/api/v1/codes/using",
        data: {"code": code,
               "associatedorder": gon.current_order_id
      },
        type: "post"
      });
}

const updateOrderPrice = (value) => {
  movingprice -= value ;
  if (movingprice >= 0) {
    printPrice(movingprice);
  } else {
    movingprice = 0;
    printPrice(movingprice);
    // faire disparaitre le boutons payer en carte
    //creer un autre bouton qui passe le status de la commande a payé et redirige vers la succes page
  }

}








addToCodesInUse = (code) => {
 codesInUse.push(code);
 console.log(codesInUse)
}



//apres appuis sur payer:


const updateOrderPrice2 = (code) => {
  $.ajax({
        url: "/api/v1/orders",
        data: {"code": code,
                "order": gon.current_order_id
      },
        type: "post"
      });

}

// const isPromoCodeValid = (promoCodeToCheck) => {
// if (movingprice <= 0) {
//     promoCodeMessage.innerHTML = "Vous ne pouvez plus utiliser de codes promo, le montant restant a payer est deja nul";

//   } else {
//     $.ajax({
//   type:"GET",
//   url:`/api/v1/codes/${promoCodeToCheck}`,
//   dataType:"json",
//   // data: {code: code},
//   success:function(result){
//     console.log(result);
//     if (result == null) {
//     promoCodeMessage.innerHTML = "Ce code est null";
//    } else if (result.status == "a valider" ){
//     promoCodeMessage.innerHTML = "Code pris en compte";
//     // changeCodeStatus(result.code);
//     addToCodesInUse(result.code)
//     const pricetable = document.querySelector("#pricetable");
//     codesEnCours.innerHTML += `<li> code ${result.code}:  -${result.value}€</li>`;
//     updateOrderPrice(result.value);
//     //updateOrderPrice2 c'est ce qui change le prix de l'order
//     // updateOrderPrice2(result.code);
//     } else {
//     promoCodeMessage.innerHTML = "Code non utilisable";
//    }
//      }
//   })
//   }
// }


const isPromoCodeValid = (promoCodeToCheck) => {
// j'utilise la fonction indexOf pour verifier la presence du code dans l'array des codes en cours (-1 =  code non present dans l'array)
if (codesInUse.indexOf(`${promoCodeToCheck}`) > -1 ){
  promoCodeMessage.innerHTML = "Code deja pris en compte";
}else {
  if (movingprice <= 0) {
    promoCodeMessage.innerHTML = "Vous ne pouvez plus utiliser de codes promo, le montant restant a payer est deja nul";
  } else {
    $.ajax({
  type:"GET",
  url:`/api/v1/codes/${promoCodeToCheck}`,
  dataType:"json",
  // data: {code: code},
  success:function(result){
    console.log(result);
    if (result == null) {
    promoCodeMessage.innerHTML = "Ce code est null";
   } else if (result.status == "a valider" ){
    promoCodeMessage.innerHTML = "Code pris en compte";
    // changeCodeStatus(result.code);
    addToCodesInUse(result.code)
    const pricetable = document.querySelector("#pricetable");
    codesEnCours.innerHTML += `<li> code ${result.code}:  -${result.value}€</li>`;
    updateOrderPrice(result.value);
    //updateOrderPrice2 c'est ce qui change le prix de l'order
    // updateOrderPrice2(result.code);
    } else {
    promoCodeMessage.innerHTML = "Code non utilisable";
   }
     }
  })
  }
}
}
