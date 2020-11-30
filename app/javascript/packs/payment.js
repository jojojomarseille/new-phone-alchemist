const promoCodeMessage = document.querySelector("#messagePromoCode");


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

const isPromoCodeValid = (promoCodeToCheck) => {
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
    changeCodeStatus(result.code);
    const pricetable = document.querySelector("#pricetable");
    pricetable.innerHTML += `<br /> code ${result.code}:  ${result.value}`;
    updateOrderPrice(result.code);
    } else {
    promoCodeMessage.innerHTML = "Code non utilisable";
   }
     }
  })

}

const changeCodeStatus = (code) => {
  $.ajax({
        url: "/api/v1/codes/using",
        data: {"code": code,
               "associatedorder": gon.current_order_id
      },
        type: "post"
      });
}

const updateOrderPrice = (code) => {
  $.ajax({
        url: "/api/v1/orders",
        data: {"code": code,
                "order": gon.current_order_id
      },
        type: "post"
      });
//la il refaut une requette ajax qui vas retourner le montant updaté de la order
//ensuite on update ce montant de order.
      $.ajax({
  type:"GET",
  url:`/api/v1/orders/${gon.current_order_id}`,
  dataType:"json",

  success:function(result){
   const totalPrice = document.querySelector("#totalPrice");
  const newPrice = result.amount_cents;
  totalPrice.innerHTML += newPrice;
         }
        })
}
