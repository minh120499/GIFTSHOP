import { componentHTML } from './components.js';
import { slider } from './slider.js';

// ----------------------------------

componentHTML();
slider();

$.ajax('http://localhost/BE/DataList/ProductList.php').done(function (data) {
  var product = [];
  $.parseJSON(data).map((item) => {
    if (item.id == '2') {
      product = [...product, ...[item]];
    }
  });
  console.log(product[0]);
  let html = `<div class="images">
        <div class="image">
            <img src="${product[0].src}">
            <div class="expend">
                <i class="fas fa-expand-arrows-alt"></i>
            </div>
        </div> 
        <div class="sub-images">
    `;
  product.map((item) => {
    // html += `<img src="${item.src}" id="${item.src}">`;
    let subImages = document.querySelector('.sub-images');
    console.log(subImages);
    let img = subImages.createElement('img');
    // img.innerHTML = `<img src="${item.src}" id="${item.src}">`;
    img.setAttribute('src', item.src);
    img.setAttribute('id', item.src);
    console.log(img);
    img.addEventListener('click', (e) => {
      console.log(e.target);
    });
    $('.product-detail').append(img);
  });
  html += `</div>
    </div>
    <div class="product-info">
        <div class="product-info__top">
            <div class="product-info__top-head">
                <h1 class="title">${product[0].name}
                </h1>
                <div class="rating"> `;
  for (let i = 0; i < product[0].rating; ++i) {
    html += `<i class="fa fa-star checked"></i>`;
  }
  html += `</div>
                <div class="prices">
                    <span class="old-price">$ ${product[0].price}</span>
                    <span class="new-price">$ ${product[0].price}</span>
                </div>
                <div class="status green">In Stock</div>
            </div>
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
                    <input type="number" value="1" class="quantity" min="1" step="1">
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
        </div>
    </div>`;
  $('.product-detail').append(html);
});
