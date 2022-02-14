import { componentHTML } from './components.js';
import { slider } from './slider.js';
import { compare } from './compare.js';

// ----------------------------------

componentHTML();
slider();

//Render chi tiết sản phẩm
$.ajax('http://localhost/BE/DataList/ProductList.php').done(function (data) {
  var product = [];
  $.parseJSON(data).map((item) => {
    if (item.id == '40') {
      product = [...product, ...[item]];
    }
  });
  console.log(product[0]);
  let html = `<div class="images">
        <div class="image">
            <img src="${product[0].src}">
        </div> 
        <div class="sub-images">
    `;
  product.map((item) => {
    html += `<img src="${item.src}">`;
  });
  html += `</div>
    </div>
    <div class="product-info">
        <div class="product-info__top">
            <div class="product-info__top-head">
                <h1 class="title">${product[0].name}
                </h1>
                <div class="rating"> `;
  for (let i = 0; i < Math.round(product[0].rating); ++i) {
    html += `<i class="fa fa-star checked"></i>`;
  }
  for (let i = 0; i < 5 - Math.round(product[0].rating); ++i) {
    html += `<i class="fa fa-star"></i>`;
  }
  html += `</div>
                <div class="prices">
                    <span class="old-price">$ ${product[0].price}</span>
                    <span class="new-price">$ ${product[0].price}</span>
                </div>`;
  if (parseInt(product[0].quantity) > parseInt(product[0].sold)) {
    html += `<div class="status green">In Stock</div>`;
  } else {
    html += `<div class="status red">Out Of Stock</div>`;
  }
  html += `</div>
            <div class="social">
                <span class="title">Share</span>
                <a href="https://www.facebook.com/" class="social-link"><i
                        class="fab fa-facebook-f"></i></a>
                <a href="https://twitter.com/" class="social-link"><i
                        class="fab fa-twitter"></i></a>
                <a href="https://www.instagram.com/" class="social-link"><i
                        class="fab fa-instagram"></i></a>
            </div>
        </div>
        <div class="product-info__bottom">
            <div class="addcart-wrapper">
                <div class="quantity-modifier">
                    <input type="button" value="-" class="minus">
                    <input type="number" value="1" class="quantity">
                    <input type="button" value="+" class="plus">
                </div>
                <div class="addcart">
                    <button type="submit">
                        <span>Add to cart</span>
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
                <div class="wishlist">
                    <i class="far fa-heart"></i>
                </div>
                <div class="compare">
                    <i class="fas fa-retweet"></i>
                </div>
            </div>
            <div class="categories-tag">
                <span class="title">Categories: </span>
                <a href="#" class="product-link fst-italic">${product[0].anniversary}</a>
            </div>
            <small>
                <span><i>Made In: </i></span>
                <b>${product[0].country}</b>
            </small>
            <div class="download">
                <a href="#" class="download-btn"><i class="fas fa-arrow-alt-to-bottom" style="margin-right: 10px;"></i>More Info</a>
                
            </div>
        </div>
    </div>`;
  $('.product-detail').append(html);

  // Thêm Description
  let description = product[0].detail;
  $('.desc-text').text(description);
});

// Kiểm tra DOM đã được render hay chưa
function docReady(fn) {
  if (
    document.readyState === 'complete' ||
    document.readyState === 'interactive'
  ) {
    setTimeout(fn, 1);
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

// Hiển thị ảnh to khi bấm vào ảnh nhỏ
docReady(() => {
  const subImgs = document.querySelectorAll('.sub-images img');
  subImgs.forEach((subImg) => {
    subImg.addEventListener('click', () => {
      let bigImg = document.querySelector('.image img');
      bigImg.src = subImg.src;
    });
  });
});

// Thêm số lượng sản phẩm
docReady(() => {
  const plusBtn = document.querySelector('.plus');
  const minusBtn = document.querySelector('.minus');
  const quantityInput = document.querySelector('.quantity');
  plusBtn.addEventListener('click', (e) => {
    let quantity = e.target.previousElementSibling;
    let newValue = parseInt(quantity.value) + 1;
    quantity.value = newValue;
  });
  minusBtn.addEventListener('click', (e) => {
    let quantity = e.target.nextElementSibling;
    let newValue = parseInt(quantity.value) - 1;
    if (newValue > 0) {
      quantity.value = newValue;
    }
  });
  quantityInput.addEventListener('input', (e) => {
    e.target.value;
  });
});

// So sánh sản phẩm
docReady(compare());
