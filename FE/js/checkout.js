import { componentHTML } from './module/components.js';
import { header } from './module/header.js';
import { multiStep, nextStep } from './module/multistep.js';
import { multiPageItem } from './module/multipage.js';
import { updateCart } from './module/updatecart.js';
import * as validateForm from './module/validation.js';

componentHTML();
var productsInOrder = []
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
  $.post(
    'http://localhost/BE/Users/GetCart.php',
    {
      userid: localStorage.getItem('userid')
    }, function (data) {
      var html = '';
      var items = $.parseJSON(data);
      productsInOrder = $.parseJSON(data);
      $.each(items, function (i, item) {
        html = `
                    <div class="cart-item">
                        <div class="image-item">
                            <img src="${item.img}">
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
                                <input type="button" productid="${item.productid}" value="-" class="minus">
                                <input type="number" productid="${item.productid}" value="${item.quantity}" class="quantity product${item.productid}">
                                <input type="button" productid="${item.productid}" value="+" class="plus">
                            </div>
                        </div>
                        <div class="delete-btn" proudctid="${item.productid}">
                            <i class="far fa-trash-alt delbtn" ></i>
                        </div>
                    </div>
                    `;
        $('.cart-items').append(html);
      });
      setTimeout(() => {
        updateCart();
        counter();
        delProduct();
        minusAndPlus();
      }, 1000)
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
if (!localStorage.getItem('userid')) {
  window.addEventListener('load', () => {
    popup.classList.add('show');
    popup.childNodes[1].classList.add('show');
  });
} else {
  popup.remove();
}
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
  const delBtns = document.querySelectorAll('.delete-btn');
  delBtns.forEach(item => {
    item.onclick = () => {
      item.parentElement.remove()
      $.post(
        'http://localhost/BE/Checkout/RemoveFromCart.php',
        {
          userid: localStorage.getItem('userid'),
          productid: item.getAttribute('proudctid'),
        },
        function (data) {
          console.log(data);
          data == "Delete success" ? alert(data) : alert("Errors");
        }
      );
      updateCart();
      multiPageItem();
    }
  })
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
Array.from(inputRadioDivs).forEach((div) => {
  let smallTag = div.querySelector('small');
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
  let payment
  let delivery
  const finalStep = document.querySelector('.step4');
  const inputRadioLastDiv = document.querySelectorAll('.input-radio')[1];
  let inputRadio = Array.from(
    inputRadioLastDiv.querySelectorAll('input[type="radio"]')
  );
  console.log(inputRadio)
  let smallTag = inputRadioLastDiv.querySelector('small');
  if (!inputRadio.every((input) => input.checked)) {
    smallTag.innerText = 'Please choose one of these methods below!';
    smallTag.style.color = 'red';
  }
  for (let i = 2; i < 4; i++) {
    if (document.querySelectorAll('input[type="radio"]')[i].checked) {
      payment = document.querySelectorAll('input[type="radio"]')[i].id
    }
  }
  for (let i = 0; i < 1; i++) {
    if (document.querySelectorAll('input[type="radio"]')[i].checked) {
      delivery = document.querySelectorAll('input[type="radio"]')[i].id
    }
  }
  console.log(payment, delivery)
  if (inputRadio.some((input) => input.checked)) {
    smallTag.innerText = '';
    finalStep.classList.add('active');
    setTimeout(() => {
      $.post(
        'http://localhost/BE/Checkout/Checkout.php',
        {
          userid: localStorage.getItem('userid'),
          orderid: 2,
          name: document.querySelector('#firstname').value + document.querySelector('#lastname').value,
          email: document.querySelector('#email').value,
          phone: document.querySelector('#phone').value,
          address: document.querySelector('#address').value,
          delivery: delivery,
          payment: payment,
        },
        function (data) {
          if (data == "Your order is confirmed") {
            alert('Your order is confirmed!!!')
            window.location = '../index.html';
          }
        }
      );
    }, 1000);
  }
});

// Đổ dữ liệu người dùng
if (localStorage.getItem('userid')) {
  $.post(
    'http://localhost/BE/Users/GetInfo.php',
    {
      userid: localStorage.getItem('userid'),
    },
    function (data) {
      var dataUser = $.parseJSON(data)[0];
      document.querySelector('#firstname').value = dataUser.firstname;
      document.querySelector('#lastname').value = dataUser.lastname;
      document.querySelector('#email').value = dataUser.email;
      document.querySelector('#phone').value = dataUser.phone.split('-').join('');
      document.querySelector('#address').value = dataUser.address;
    }
  );
}

//Cộng trừ số lượng

function minusAndPlus() {
  let minusButton = document.querySelectorAll('.minus')
  minusButton.forEach(item => {
    item.onclick = () => {
      let a = productsInOrder.filter(i => {
        return i.productid == item.getAttribute('productid')
      })
      let quantity = document.querySelector(".product" + a[0].productid).value
      $.post(
        'http://localhost/BE/Checkout/AddToCart.php',
        {
          userid: localStorage.getItem('userid'),
          productid: a[0].productid,
          quantity: quantity,
          price: a[0].price,
          img: a[0].img,
          minus: 1
        },
        function (data) {
          // var dataneh = $.parseJSON(data)[0];
        }
      );
    }
  })

  let plusButton = document.querySelectorAll('.plus')
  plusButton.forEach(item => {
    item.onclick = () => {
      let a = productsInOrder.filter(i => {
        return i.productid == item.getAttribute('productid')
      })
      let quantity = document.querySelector(".product" + a[0].productid).value
      $.post(
        'http://localhost/BE/Checkout/AddToCart.php',
        {
          userid: localStorage.getItem('userid'),
          productid: a[0].productid,
          quantity: quantity,
          price: a[0].price,
          img: a[0].img
        },
        function (data) {
          // var dataneh = $.parseJSON(data)[0];
        }
      );
    }
  })
}
