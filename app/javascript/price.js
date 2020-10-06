function price() {
  const item = document.getElementById("item-price")
  item.addEventListener('keyup', () => {
    const itemPrice = item.value;
    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    item.innerHTML = itemPrice
    tax.innerHTML = itemPrice * 0.1
    profit.innerHTML = itemPrice * 0.9
  })
}


window.addEventListener('load', price);