import { componentHTML } from './module/components.js';
import { header } from './module/header.js';
import { multiStep, nextStep } from './module/multistep.js';
import { multiPageItem } from './module/multipage.js';
import { updateCart } from './module/updatecart.js';
import * as validateForm from './module/validation.js';

componentHTML();

function render() {
  return new Promise((resolve) => {
    setTimeout(() => {
      renderAPI();
      resolve();
    }, 1000);
  });
}

// Render giỏ hàng
function renderAPI() {
  // Cart Summary
  $.ajax('http://localhost/BE/DataList/ProductList.php').done(function (data) {
    var html = '';
    var items = $.parseJSON(data);
    // console.log(items);
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
    });
    updateCart();
    counter();
    delProduct();
  });
}
render()
  .then(() => {
    return new Promise((resolve) => {
      setTimeout(() => {
        header();
        resolve();
      }, 1000);
    });
  })
  .then(() => {
    multiPageItem();
  });

// Chuyển Step khi ấn Next hoặc Previous
multiStep();

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

// Validate Form dữ liệu người dùng
const formInfo = document.querySelector('#form-info');
const nextBtn = formInfo.parentElement.querySelector('.btn-next1');
const listInput = ['#firstname', '#lastname', '#phone', '#email', '#address'];
var parentEles = Array.from(formInfo.querySelectorAll('.form-ctrl'));
listInput.forEach((input) => {
  validateForm.sanitizeValue(input);
});
validateForm.uppercase('#firstname');
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
    let progressStep = document.querySelectorAll('.step');
    nextStep(e, progressStep, -1);
  }
});

//Khi chọn method thông báo lỗi sẽ mất
const inputRadioDivs = document.querySelectorAll('.input-radio');
console.log(inputRadioDivs[1]);
Array.from(inputRadioDivs).forEach((div) => {
  let smallTag = div.querySelector('small');
  console.log(smallTag);
  let inputRadio = Array.from(div.querySelectorAll('input[type="radio"]'));
  inputRadio.forEach((input) => {
    input.addEventListener('change', () => {
      smallTag.innerText = '';
    });
  });
});

// Submit form
const confirmBtn = document.querySelector('.btn-cf');
confirmBtn.addEventListener('click', (e) => {
  // Kiểm tra người dùng đã chọn method hay chưa
  const finalStep = document.querySelector('.step4');
  const inputRadioLastDiv = document.querySelectorAll('.input-radio')[1];
  let inputRadio = Array.from(
    inputRadioLastDiv.querySelectorAll('input[type="radio"]')
  );
  let smallTag = inputRadioLastDiv.querySelector('small');
  if (!inputRadio.every((input) => input.checked)) {
    smallTag.innerText = 'Please choose one of these methods below!';
    smallTag.style.color = 'red';
  }

  if (inputRadio.some((input) => input.checked)) {
    smallTag.innerText = '';
    finalStep.classList.add('active');
    setTimeout(() => {
      alert('Your order is confirmed!!!');
      $.post(
        'http://localhost/BE/Checkout/Checkout.php',
        {
          userid: 1,
          orderid: 2,
          name: 3,
          email: 3,
          phone: 3,
          address: 3,
          payment: 'ssss',
        },
        function (data) {
          // console.log(data);
          // var dataneh = $.parseJSON(data)[0];
        }
      );
      window.location = 'http://127.0.0.1:5500/FE/index.html';
    }, 1000);
  }
});


var firstNameVal = document.querySelector('#firstname').value;
var lastNameVal = document.querySelector('#lastname').value;
var emailVal = document.querySelector('#email').value;
var phoneVal = document.querySelector('#phone').value;
var addressVal = document.querySelector('#address').value;

// Đổ dữ liệu người dùng
$.post(
  'http://localhost/BE/Users/GetInfo.php',
  {
    userid: 3,
  },
  function (data) {
    var dataUser = $.parseJSON(data)[0];
    firstNameVal = dataUser.firstname;
    lastNameVal = dataUser.lastname;
    emailVal = dataUser.email;
    phoneVal = dataUser.phone.split('-').join('');
    addressVal = dataUser.address;
    console.log(dataUser);
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
