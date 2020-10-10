function price() {
  const item = document.getElementById("item-price")
  const itemPrice = item.value;
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  if(item != null) {
    tax.innerHTML = itemPrice * 0.1
    profit.innerHTML = itemPrice * 0.9
  } else {
   item.addEventListener('input', () => {
    itemPrice = item.value;
    item.innerHTML = itemPrice
    tax.innerHTML = itemPrice * 0.1
    profit.innerHTML = itemPrice * 0.9 
   })
  }
}

setInterval(price, 1000);