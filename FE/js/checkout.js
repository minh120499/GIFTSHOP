import { componentHTML } from './module/components.js';
import { header } from './module/header.js';
import { multiStep } from './module/multistep.js';
import * as validateForm from './module/validation.js';

function render() {
  return new Promise((resolve) => {
    setTimeout(() => {
      componentHTML();
      renderAPI();
      resolve();
    }, 1000);
  });
}

// Render giỏ hàng
function renderAPI() {
  //Cart Summary
  $.ajax('http://localhost/BE/DataList/ProductList.php').done(function (data) {
    var html = '';
    var items = $.parseJSON(data);
    console.log(items);
    $.each(items, function (i, item) {
      html = `
                    <div class="cart-item">
                        <div class="image-item">
                            <img src="${item.src}">
                        </div>
                        <div class="item-info">
                            <h3 class="item-title">${item.name}</h3>
                            <div class="d-flex">
                                <b>Brand:</b>
                                <span style="font-style: italic; margin-left: 5px">${item.brand}<span>
                            </div>
                        </div>
                        <div class="calc">
                            <div class="item-price">
                                <span>$ ${item.price}</span>
                            </div>
                            <div class="quantity-modifier">
                                <input type="button" value="-" class="minus">
                                <input type="number" value="1" class="quantity">
                                <input type="button" value="+" class="plus">
                            </div>
                        </div>
                        <div class="delete-btn">
                            <i class="far fa-trash-alt delbtn"></i>
                        </div>
                    </div>
                    `;
      $('.cart-items').append(html);
      // console.log(i)
      if (i > 4) {
        return false;
      }
    });
    updateCart();
    counter();
    delProduct();
  });
}

// Render header.js
render().then(() => {
  return new Promise((resolve) => {
    setTimeout(() => {
      header();
      resolve();
    }, 1000);
  });
});

// Show Popup
const popup = document.querySelector('.popup');
const btnGuest = document.querySelector('.btn-guest');
window.addEventListener('load', () => {
  popup.classList.add('show');
  popup.childNodes[1].classList.add('show');
});
btnGuest.addEventListener('click', () => {
  popup.remove();
});

// Thêm bớt số lượng sản phẩm
function counter() {
  const plusBtns = document.querySelectorAll('.plus');
  const minusBtns = document.querySelectorAll('.minus');
  const quantities = document.querySelectorAll('.quantity');
  for (let i = 0; i < plusBtns.length; i++) {
    const plusBtn = plusBtns[i];
    const minusBtn = minusBtns[i];
    const quantityInput = quantities[i];
    plusBtn.addEventListener('click', (e) => {
      let quantity = e.target.previousElementSibling;
      let newValue = parseInt(quantity.value) + 1;
      quantity.value = newValue;
      updateCart();
    });
    minusBtn.addEventListener('click', (e) => {
      let quantity = e.target.nextElementSibling;
      let newValue = parseInt(quantity.value) - 1;
      if (newValue > 0) {
        quantity.value = newValue;
      }
      updateCart();
    });
    quantityInput.addEventListener('input', (e) => {
      e.target.value;
      updateCart();
    });
  }
}

// Xóa sản phẩm
function delProduct() {
  const delBtns = document.querySelectorAll('.delbtn');
  for (let i = 0; i < delBtns.length; i++) {
    const delBtn = delBtns[i];
    delBtn.addEventListener('click', (e) => {
      e.target.parentElement.parentElement.remove();
      $.post(
        'http://localhost/BE/Checkout/RemoveFromCart.php',
        {
          userid: 1,
          productid: 5,
        },
        function (data) {
          console.log(data);
        }
      );
      updateCart();
    });
  }
}

// Update giỏ hàng
function updateCart() {
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

  //delivery
  const carryOut = document.querySelector('.carryout');
  const standardDeli = document.querySelector('.standard');
  let deliPrice = document.querySelector('.deli span');
  carryOut.addEventListener('click', () => {
    deliPrice.innerText = '$ 0';
    total = subTotal + 0;
    document.querySelector('.total span').innerText = `$ ${total}`;
  });
  standardDeli.addEventListener('click', () => {
    deliPrice.innerText = '$ 3';
    total = subTotal + 3;
    document.querySelector('.total span').innerText = `$ ${total}`;
  });
}

// Validate Form dữ liệu người dùng
const formInfo = document.querySelector('#form-info');
const nextBtn = formInfo.parentElement.querySelector('.btn-next1');
const listInput = ['#name', '#lastname', '#phone', '#email', '#address'];
var parentEles = Array.from(formInfo.querySelectorAll('.form-ctrl'));
listInput.forEach((input) => {
  validateForm.sanitizeValue(input);
});
validateForm.uppercase('#name');
validateForm.uppercase('#lastname');
nextBtn.addEventListener('click', (e) => {
  listInput.forEach((input) => {
    validateForm.checkRequired(input, 'This field is required!');
    validateForm.checkEmail(
      '#email',
      'This field is required!',
      'Email is not valid!'
    );
    validateForm.checkPhoneNumber(
      '#phone',
      'This field is required!',
      'Phone number is not valid!'
    );
  });
  if (parentEles.every((parentEle) => parentEle.classList.contains('valid'))) {
    let progressStep = document.querySelector('.step1');
    let currentStep = e.target.parentElement.parentElement;
    let nextStep = currentStep.nextElementSibling;
    currentStep.style.left = '-100%';
    currentStep.style.right = 'calc(100% + 30px)';
    nextStep.style.left = '0';
    nextStep.style.right = '0';
    progressStep.classList.add('active');
  }
});
multiStep();

// Submit form
const confirmBtn = document.querySelector('.btn-cf');
confirmBtn.addEventListener('click', () => {
  const finalStep = document.querySelector('.step4');
  finalStep.classList.add('active');
  setTimeout(() => {
    alert('Your order is confirmed!!!');
    window.location = 'http://127.0.0.1:5500/FE/index.html';
  }, 1000);
});

// Đổ dữ liệu người dùng
$.post(
  'http://localhost/BE/Users/GetInfo.php',
  {
    userid: 3,
  },
  function (data) {
    var dataneh = $.parseJSON(data)[0];
    console.log(dataneh);
  }
);

//Cộng trừ số lượng

$.post(
  'http://localhost/BE/Checkout/AddToCart.php',
  {
    userid: 1,
    productid: 2,
    quantity: 3,
    price: 300,
    // minus: 1
  },
  function (data) {
    // console.log(data);
    // var dataneh = $.parseJSON(data)[0];
  }
);
