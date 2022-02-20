// Update giỏ hàng
export function updateCart() {
  const cartContainer = document.querySelector('.cart-items');
  const cartItemsList = cartContainer.querySelectorAll('.cart-item');
  let subTotal = 0;
  let total = 0;
  for (let i = 0; i < cartItemsList.length; i++) {
    const cartItem = cartItemsList[i];
    let price = cartItem.querySelector('.item-price span');
    let quantity = cartItem.querySelector('.quantity');
    price = parseFloat(price.innerText.replace('$ ', ''));
    quantity = parseInt(quantity.value);
    subTotal += price * quantity;
  }

  document.querySelector('.subtotal span').innerText = `$ ${subTotal}`;
  document.querySelector('.total span').innerText = `$ ${subTotal}`;

  // Delivery Calculate
  const carryOut = document.querySelector('.carryout');
  const standardDeli = document.querySelector('.standard');
  let deliFee = document.querySelector('.deli span');
  carryOut.addEventListener('click', () => {
    deliFee.innerText = '$ 0';
    total = subTotal + 0;
    document.querySelector('.total span').innerText = `$ ${total}`;
  });
  standardDeli.addEventListener('click', () => {
    let deliFeeTxt = document.querySelector('.delivery-price').innerText;
    let deliFeeNum = parseInt(deliFeeTxt.slice(0, -1));
    deliFee.innerText = `$ ${deliFeeNum}`;
    total = subTotal + deliFeeNum;
    document.querySelector('.total span').innerText = `$ ${total}`;
  });
}
