import { indexComponentHTML } from './module/components.js';
import { header } from './module/header.js';

function render() {
  return new Promise((resolve) => {
    setTimeout(() => {
      indexComponentHTML();
      showData();
      resolve();
    }, 1000);
  });
}
render().then(() => {
  return new Promise((resolve) => {
    setTimeout(() => {
      header();
      let bgImgsHeader = document.querySelectorAll('#header img');
      bgImgsHeader.forEach((img) => {
        img.src = img.getAttribute('src').slice(1);
      });
      let linkHeader = document.querySelectorAll('#header a');
      linkHeader.forEach((link) => {
        link.href = link.getAttribute('href').slice(1);
      });
      resolve();
    }, 1000);
  });
});

// Đổ dữ liệu từ API vào dùng axios
function showData() {
  axios
    .get('http://localhost/BE/DataList/ProductList.php')
    .then((e) => e.data)
    .then((e) => {
      var html = '';
      var html2 = '';
      var html3 = '';
      var html4 = '';
      var html5 = '';
      for (var i = 0; i < 8; i++) {
        html += `<div class="col-6 col-sm-4 col-lg-3 product_item">
          <div class="new_arrivals_container_content">
              <img src="${e[i].src}" alt="">
              <h3><span>${e[i].name}</span></h3>
              <p><span>${e[i].price}$</span></p>
            <div class="product_item_hover">
              <li class="FtPrAni_1">
                  <button class="add_view"><a href=""><i class="far fa-eye"></i></a></button>
              </li>
              <li class="FtPrAni_2">
                  <div class="item_hover_show">
                      <button class="add_cart">Add to cart</button>
                      <button class="add_tym"><a href=""><i class="far fa-heart"></i></a></button>
                  </div>
              </li>
            </div>
          </div>
        </div>`;
      }

      for (var i = 0; i < 10; i++) {
        html2 += `<div class="flash_sale_content_item">
          <div class="new_arrivals_container_content">
              <img src="${e[i].src}" alt="">
              <h3><span>${e[i].name}</span></h3>
              <p><span>${e[i].price}$</span></p>
              <div class="product_item_hover">
                  <li class="FtPrAni_1">
                      <button class="add_view"><a href=""><i class="far fa-eye"></i></a></button>
                  </li>
                  <li class="FtPrAni_2">
                      <div class="item_hover_show">
                          <button class="add_cart">Add to cart</button>
                          <button class="add_tym"><i class="far fa-heart"></i></button>
                      </div>
                  </li>
              </div>
          </div>
        </div>`;
      }

      for (var i = 20; i < 27; i++) {
        html3 += `<div class="product_top_mid_item">
          <img src="${e[i].src}" alt="">
        </div>`;

        html4 += `<div class="product_bottom_item" >
          <img src="${e[i].src}" alt="">
        </div>`;

        html5 += `<div class="product_top_right_item">
          <div class="product_top_right_t">
              <span>${e[i].name}</span>
              <div class="product_top_right_star">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
                  <span>${e[i].view} Reiew(s)</span>
              </div>
              <div class="product_top_right_price">
                  <li><span>${e[i].price}$</span></li>
              </div>
          </div>
          <div class="product_top_right_b">
              <p>${e[i].detail}</p>
          </div>
        </div>`;
      }

      document.querySelector('.new_Arrivals').innerHTML = html;
      document.querySelector('.flash_sale_content_container').innerHTML = html2;
      document.querySelector('.product_top_mid_center').innerHTML = html3;
      document.querySelector('.product_bottom_content').innerHTML = html4;
      document.querySelector('.product_top_right_content').innerHTML = html5;

      const rightbtn = document.querySelector('.product_bottom_right_btn');
      const leftbtn = document.querySelector('.product_bottom_left_btn');
      const imgNumber = document.querySelectorAll('.product_top_mid_item');

      rightbtn.addEventListener('click', function () {
        index = index + 1;
        if (index > imgNumber.length - 1) {
          index = 0;
        }
        document.querySelector('.product_top_mid_center').style.right =
          index * 100 + '%';
        document.querySelector('.product_top_right_content').style.right =
          index * 100 + '%';
      });

      leftbtn.addEventListener('click', function () {
        index = index - 1;
        if (index < 0) {
          index = imgNumber.length - 1;
        }
        document.querySelector('.product_top_mid_center').style.right =
          index * 100 + '%';
        document.querySelector('.product_top_right_content').style.right =
          index * 100 + '%';
      });

      const imgNumberLi = document.querySelectorAll('.product_bottom_item');

      imgNumberLi.forEach(function (currentValue, index, arr) {
        currentValue.addEventListener('click', function () {
          document.querySelectorAll('.product_top_mid_center')[0].style.right =
            index * 100 + '%';
        });
      });
    });
}

// Bắt sự kiện click của 2 nút next và prev
var flash_sale = document.getElementsByClassName('flash_sale_content_item');

for (var i = 0; i <= flash_sale.length; i++) {
  // flash_sale[i].style.left = i*20+"%";
}

var prev_sale = document.querySelector('.flash_sale_content_btn_left');
var next_sale = document.querySelector('.flash_sale_content_btn_right');
var index = 0;

if (index == 0) {
  prev_sale.classList.add('hide');
}

function checkIndex() {
  if (index == 0) {
    prev_sale.classList.add('hide');
  } else {
    prev_sale.classList.remove('hide');
  }

  if (index == flash_sale.length - 5) {
    next_sale.classList.add('hide');
  } else {
    next_sale.classList.remove('hide');
  }
}

prev_sale.addEventListener('click', function () {
  if (index > 0) {
    index--;
    checkIndex();
    for (var i = 0; i < flash_sale.length; i++) {
      flash_sale[i].style.left = (i - index) * 20 + '%';
    }
  }
});

next_sale.addEventListener('click', function () {
  if (index < flash_sale.length - 5) {
    index++;
    checkIndex();
    for (var i = 0; i < flash_sale.length; i++) {
      flash_sale[i].style.left = (i - index) * 20 + '%';
    }
  }
});
