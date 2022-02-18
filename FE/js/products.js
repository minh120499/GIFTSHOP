import { componentHTML } from './module/components.js';
import { header } from './module/header.js';
import { multiPageItem } from './module/multipage.js'

componentHTML();
// multiPageItem();


var btn_square = document.querySelector('.square');
var btn_pillar = document.querySelector('.pillar');

let idPage = 1;
let start = 0;

var productList = [];
var productListToFliter = [];

btn_pillar.addEventListener('click', function () {
  document.querySelector('.content_container_main').classList.add('hide');
  document
    .querySelector('.content_container_main_pillar')
    .classList.add('show');
  if (btn_square.classList.contains('active')) {
    btn_square.classList.remove('active');
    btn_pillar.classList.add('active');
  }
});

btn_square.addEventListener('click', function () {
  document.querySelector('.content_container_main').classList.remove('hide');
  document
    .querySelector('.content_container_main_pillar')
    .classList.remove('show');
  if (btn_pillar.classList.contains('active')) {
    btn_square.classList.add('active');
    btn_pillar.classList.remove('active');
  }
});

var show_filter = document.querySelector('.show_filter');
show_filter.addEventListener('click', function () {
  document.querySelector('.SideBar').classList.toggle('filter_show');
});

//search filter làm nút tìm kiếm giống W3 school chỉ search được trong 1 trang
document.querySelector('#myInput').onkeyup = function search() {
  // Declare variables
  var input, filter, main, infor, p, i, txtValue;
  input = document.getElementById('myInput');
  filter = input.value.toUpperCase();
  if (btn_square.classList.contains('active')) {
    main = document.querySelector('.content_container_main');
    infor = main.getElementsByClassName('content_container_item');
    for (i = 0; i < infor.length; i++) {
      p = infor[i].getElementsByClassName('title')[0];
      txtValue = p.textContent || p.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        infor[i].style.display = '';
      } else {
        infor[i].style.display = 'none';
      }
    }
  } else {
    main = document.querySelector('.content_container_main_pillar');
    infor = main.getElementsByClassName('content_container_item_pillar');

    for (i = 0; i < infor.length; i++) {
      p = infor[i].getElementsByClassName('title')[0];
      txtValue = p.textContent || p.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        infor[i].style.display = '';
      } else {
        infor[i].style.display = 'none';
      }
    }
  }
}

// Render Best Sale
function RenderBestSale() {
  axios
    .get('http://localhost/be/DataList/TopSales.php')
    .then((e) => e.data)
    .then((e) => {
      let html = '';
      document.querySelector('.SideBar_bestseller_content').innerHTML = '';
      e.forEach((item) => {
        html += `<li class="row">
                            <div class="col-4">
                                <a href="./product.html" class="go-to-product" productid="${item.id}"><img src="${item.src}" alt=""></a>
                            </div>
                            <div class="col-8">
                                <p><a href="./product.html" class="go-to-product" productid="${item.id}">${item.name}</a></p>
                                <p>$<span>${item.price}</span></p>
                            </div>
                        </li>`;
      });
      document.querySelector('.SideBar_bestseller_content').innerHTML += html;
    });
}

// Làm 2 nút chuyển trang
// var check = 0;
// const previousBtn = document.querySelector('.previousbtn');
// const nextBtn = document.querySelector('.nextbtn');
// nextBtn.addEventListener('click', () => {
//   idPage++;
//   if (check == 1) {
//     renderProduct();
//   } else if (check == 2) {
//     renderProductBrand();
//   } else {
//     asyncCall();
//   }
// });

// previousBtn.addEventListener('click', () => {
//   idPage--;
//   if (check == 1) {
//     renderProduct();
//   } else if (check == 2) {
//     renderProductBrand();
//   } else {
//     asyncCall();
//   }
// });

// Hàm đổ dữ liệu ra khi load trang
function renderContent(listProducts = 'empty') {
  if (listProducts == 'empty') {

    axios
      .get('http://localhost/BE/DataList/ProductList.php')
      .then((e) => e.data)
      .then((e) => {
        productList = e;
        listProducts = e
        listProducts == 'empty' ? '' : (productListToFliter = listProducts);
      });
  }
  console.log(liss)
  var html2 = '';
  var html3 = '';
  var select = document.getElementById('show_items');
  var perPage = select.options[select.selectedIndex].value;
  let end = perPage * idPage;
  start = (idPage - 1) * perPage;
  let totalPages = Math.ceil(listProducts.length / perPage);

  listProducts.forEach((item, i) => {
    if (i >= start && i < end) {
      html2 += `<div class="col-6 col-lg-4 content_container_item">
              <div class="content_container_item_border">
                  <div class="content_container_item_show">
                      <img src=${listProducts[i].src} alt="">
                      <div class="content_container_item_show_infor">
                          <p class="title">${listProducts[i].name}</p>
                          <p>$<span>${listProducts[i].price}</span></p>
                      </div>
                  </div>
                  <div class="content_container_item_hover">
                      <li>
                          <button class="add_view" productid="${item.id}"><i class="far fa-eye"></i></button>
                      </li>
                      <li>
                          <button class="add_cart" productid="${item.id}">Add to cart</button>`;
      if (
        !localStorage
          .getItem('wishlist')
          .split(',')
          .includes(item.id.toString())
      ) {
        html2 += `<button class="add_tym" productid="${item.id}"><i class="far fa-heart"></i></button>`;
      } else {
        html2 += `<button class="add_tym clicked-wishlist" productid="${item.id}"><i class="far fa-heart"></i></button>`;
      }
      html2 += `</li>
                  </div>
              </div>
          </div>`;
      let stringdetail = '';
      if (listProducts[i].detail.length > 150) {
        stringdetail = listProducts[i].detail.slice(0, 150) + ' ...';
      } else {
        stringdetail = listProducts[i].detail;
      }

      html3 += `<div class="content_container_item_pillar ">
            <div class="content_container_item_pillar_img">
            <img src=${listProducts[i].src} alt="">
                <button class="add_view" productid="${item.id}"><i class="far fa-eye"></i></button>
            </div>
            <div class="content_container_item_pillar_content">
                <h2><div class="title" productid="${item.id}" >${listProducts[i].name}</div></h2>
                
                <div class="content_container_item_pillar_star">`;
      for (let i = 0; i < Math.floor(item.rating); i++) {
        html3 += `<i class="far fa-star"></i>`;
      }
      html3 += `</div>
                <div class="content_container_item_pillar_price">
                    <span>$</span><span>${listProducts[i].price}</span>
                </div>
                <div class="content_container_item_pillar_content_title">
                    <span>${stringdetail}</span>
                </div>
                <div class="content_container_item_pillar_content_btn">
                    <button class="add_cart" productid="${item.id}">Add to cart</button>`;
      if (
        !localStorage
          .getItem('wishlist')
          .split(',')
          .includes(item.id.toString())
      ) {
        html3 += `<button class="add_tym" productid="${item.id}"><i class="far fa-heart"></i></button>`;
      } else {
        html3 += `<button class="add_tym clicked-wishlist" productid="${item.id}"><i class="far fa-heart"></i></button>`;
      }
      html3 += `</div>
            </div>
          </div>`;
    }
  });

  var html4 = ``;
  for (var i = 1; i <= totalPages; i++) {
    if (idPage === i) {
      html4 += `<p class='active'><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
    } else {
      html4 += `<p><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
    }
  }

  document.querySelector('.content_container_main').innerHTML = html2;
  document.querySelector('.content_container_main_pillar').innerHTML =
    html3;
  document.querySelector('.content_container_title_right').innerHTML =
    html4;
}

// Hiển thị dữ liệu ra theo loại sản phẩm
function RenderCategories() {
  axios
    .get('http://localhost/BE/DataList/Categories.php')
    .then((e) => e.data)
    .then((e) => {
      let html = '';
      e.forEach((item) => {
        html += `<li cateid="${item.id}" class="${item.name}"><span>${item.name}</span></li>`;
      });
      document.querySelector('.SideBar_Category').outerHTML = html;
      let dom = document.querySelectorAll('li[cateid]')
      dom.forEach(item => {
        item.onclick = () => {
          renderProductsByCategories(item.getAttribute('cateid'))
        }
      })
    });
}

//Lay va in ra brand
function RenderBrand() {
  axios
    .get('http://localhost/BE/DataList/Brands.php')
    .then((e) => e.data)
    .then((e) => {
      var html1 = '';
      e.forEach((item) => {
        html1 += `<li brandid="${item.id}" class="${item.name}"><span>${item.name}</span><span>(${item.quantity})</span></li>`;
      });
      document.querySelector('.SideBar_Color').outerHTML = html1;
      let dom = document.querySelectorAll('li[brandid]')
      dom.forEach(item => {
        item.onclick = () => {
          renderProductsByBrands(item.getAttribute('brandid'))
        }
      })
    });
}

var product = [];
var productBrand = [];

//Hàm gọi ra ra danh sách sản phẩm theo thương hiệu
function renderProductBrand() {
  var html10 = '';
  var html11 = '';
  var select = document.getElementById('show_items');
  var perPage = select.options[select.selectedIndex].value;
  end = perPage * idPage;
  start = (idPage - 1) * perPage;

  for (let i = 0; i < productBrand.length; i++) {
    if (i >= start && i < end) {
      html10 += `<div class="col-6 col-lg-4 content_container_item">
        <div class="content_container_item_border">
            <div class="content_container_item_show">
                <img src=${productBrand[i].src} alt="">
                <div class="content_container_item_show_infor">
                    <p class="title">${productBrand[i].name}</p>
                    <p>$<span>${productBrand[i].price}</span></p>
                </div>
            </div>
            <div class="content_container_item_hover">
                <li>
                    <button class="add_view" productid="${product[i].id}"><i class="far fa-eye"></i></button>
                </li>
                <li>
                    <button class="add_cart" productid="${product[i].id}">Add to cart</button>`;
      if (
        !localStorage
          .getItem('wishlist')
          .split(',')
          .includes(item.id.toString())
      ) {
        html10 += `<button class="add_tym" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      } else {
        html10 += `<button class="add_tym clicked-wishlist" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      }
      html10 += `<button class="add_share"><i class="fas fa-retweet"></i></button>
                </li>
            </div>
        </div>
      </div>`;

      let stringdetail = '';
      if (productBrand[i].detail.length > 150) {
        stringdetail = productBrand[i].detail.slice(0, 150) + ' ...';
      } else {
        stringdetail = productBrand[i].detail;
      }

      html11 += `<div class="content_container_item_pillar ">
        <div class="content_container_item_pillar_img">
        <img src=${productBrand[i].src} alt="">
            <button class="add_view" productid="${product[i].id}"><i class="far fa-eye"></i></button>
        </div>
        <div class="content_container_item_pillar_content">
            <h2><div class="title" >${productBrand[i].name}</div></h2>
            <div class="content_container_item_pillar_star">`;
      for (let i = 0; i < Math.floor(product[i].rating); i++) {
        html11 += `<i class="far fa-star"></i>`;
      }
      html11 += `</div>
            <div class="content_container_item_pillar_price">
                <span>$</span><span>${productBrand[i].price}</span>
            </div>
            <div class="content_container_item_pillar_content_title">
                <span>${stringdetail}</span>
            </div>
            <div class="content_container_item_pillar_content_btn">
                <button class="add_cart" productid="${product[i].id}">Add to cart</button>`;
      if (
        !localStorage
          .getItem('wishlist')
          .split(',')
          .includes(item.id.toString())
      ) {
        html11 += `<button class="add_tym" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      } else {
        html11 += `<button class="add_tym clicked-wishlist" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      }
      html11 += `<button class="add_share"><i class="fas fa-retweet"></i></button>
            </div>
        </div>
      </div>`;
    }
  }

  document.querySelector('.content_container_main').innerHTML = html10;
  document.querySelector('.content_container_main_pillar').innerHTML = html11;

  totalPages = Math.ceil(product.length / perPage);

  if (idPage === totalPages) {
    nextBtn.disabled = true;
  } else {
    nextBtn.disabled = false;
  }
  if (start === 0) {
    previousBtn.disabled = true;
  } else {
    previousBtn.disabled = false;
  }

  var html4 = ``;
  for (var i = 1; i <= totalPages; i++) {
    if (idPage === i) {
      html4 += `<p class='active'><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
    } else {
      html4 += `<p><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
    }
  }
  document.querySelector('.content_container_title_right').innerHTML = html4;
}

// Hàm gọi ra danh sách sản phẩm theo loại sản phẩm
function renderProduct() {
  var html10 = '';
  var html11 = '';
  var select = document.getElementById('show_items');
  var perPage = select.options[select.selectedIndex].value;
  end = perPage * idPage;
  start = (idPage - 1) * perPage;

  for (let i = 0; i < product.length; i++) {
    if (i >= start && i < end) {
      html10 += `<div class="col-6 col-lg-4 content_container_item">
        <div class="content_container_item_border">
            <div class="content_container_item_show">
                <img src=${product[i].src} alt="">
                <div class="content_container_item_show_infor">
                    <p class="title">${product[i].name}</p>
                    <p>$<span>${product[i].price}</span></p>
                </div>
            </div>
            <div class="content_container_item_hover">
                <li>
                    <button class="add_view" productid="${product[i].id}"><i class="far fa-eye"></i></button>
                </li>
                <li>
                    <button class="add_cart productid="${product[i].id}"">Add to cart</button>`;
      if (
        !localStorage
          .getItem('wishlist')
          .split(',')
          .includes(product[i].id.toString())
      ) {
        html10 += `<button class="add_tym" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      } else {
        html10 += `<button class="add_tym clicked-wishlist" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      }
      // <button class="add_tym"><i class="far fa-heart"></i></button>
      html10 += `<button class="add_share"><i class="fas fa-retweet"></i></button>
                </li>
            </div>
        </div>
      </div>`;

      let stringdetail = '';
      if (product[i].detail.length > 150) {
        stringdetail = product[i].detail.slice(0, 150) + ' ...';
      } else {
        stringdetail = product[i].detail;
      }

      html11 += `<div class="content_container_item_pillar ">
        <div class="content_container_item_pillar_img">
        <img src=${product[i].src} alt="">
            <button class="add_view" productid="${product[i].id}"><i class="far fa-eye"></i></button>
        </div>
        <div class="content_container_item_pillar_content">
            <h2><div class="title" >${product[i].name}</div></h2>
            <div class="content_container_item_pillar_star">`;
      for (let i = 0; i < Math.floor(product[i].rating); i++) {
        html11 += `<i class="far fa-star"></i>`;
      }
      html11 += `</div>
            <div class="content_container_item_pillar_price">
                <span>$</span><span>${product[i].price}</span>
            </div>
            <div class="content_container_item_pillar_content_title">
                <span>${stringdetail}</span>
            </div>
            <div class="content_container_item_pillar_content_btn">
                <button class="add_cart">Add to cart</button>`;
      if (
        !localStorage
          .getItem('wishlist')
          .split(',')
          .includes(product[i].id.toString())
      ) {
        html11 += `<button class="add_tym" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      } else {
        html11 += `<button class="add_tym clicked-wishlist" productid="${product[i].id}"><i class="far fa-heart"></i></button>`;
      }
      // <button class="add_tym"><i class="far fa-heart"></i></button>
      html11 += ` <button class="add_share"><i class="fas fa-retweet"></i></button>
            </div>
        </div>
      </div>`;
    }
  }

  document.querySelector('.content_container_main').innerHTML = html10;
  document.querySelector('.content_container_main_pillar').innerHTML = html11;

  totalPages = Math.ceil(product.length / perPage);

  if (idPage === totalPages) {
    nextBtn.disabled = true;
  } else {
    nextBtn.disabled = false;
  }
  if (start === 0) {
    previousBtn.disabled = true;
  } else {
    previousBtn.disabled = false;
  }

  var html4 = ``;
  for (var i = 1; i <= totalPages; i++) {
    if (idPage === i) {
      html4 += `<p class='active'><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
    } else {
      html4 += `<p><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
    }
  }
  document.querySelector('.content_container_title_right').innerHTML = html4;
}

// Làm sự kiện click vào chọn trang
function clickBtnChoosePage(e) {
  idPage = parseInt(e.target.textContent);
  if (check == 1) {
    renderProduct();
  } else if (check == 2) {
    renderProductBrand();
  } else {
    // renderContent();
    asyncCall();
  }
}

// Làm nút tìm kiếm the giá sản phẩm Filter
document.querySelector('.searchPrice').onclick = function priceSearch() {
  let low_price = document.getElementById('low_price').value;
  let expensive = document.getElementById('expensive').value;
  let data = new FormData();
  data.append('minPrice', low_price);
  data.append('maxPrice', expensive);
  axios
    .post('http://localhost/be/DataList/ProductFilters.php', data)
    .then((e) => {
      document.querySelector('.content_container_main').innerHTML = '';
      document.querySelector('.content_container_main_pillar').innerHTML = '';
      document.querySelector('.content_container_title_right').innerHTML = '';
      // document.querySelector(".SideBar_bestseller_content").innerHTML = '';
      renderContent(e.data);
    });
}

// Nut chuyen huong den product.html
function viewButton() {
  return new Promise((rs) => {
    header();
    setTimeout(() => {
      // click best sale to product
      let a = document.querySelectorAll('.go-to-product');
      a.forEach((item) => {
        item.onclick = () => {
          localStorage.setItem('productid', item.getAttribute('productid'));
        };
      });
      // click render by top
      document.querySelector('.filterTop').onclick = () => {
        let array = [];
        let sortedArry = [];
        productListToFliter.forEach((item) => {
          array.push(item.name);
        });
        array.sort().forEach((name) => {
          productListToFliter.filter((item) => {
            if (item.name == name) {
              sortedArry = [...sortedArry, ...[item]];
            }
          });
        });
        renderContent(sortedArry);
      };

      // click render by botton
      document.querySelector('.filterBottom').onclick = () => {
        let array = [];
        let reSortedArry = [];
        productListToFliter.forEach((item) => {
          array.push(item.name);
        });
        array.reverse().forEach((name) => {
          productListToFliter.filter((item) => {
            if (item.name == name) {
              reSortedArry = [...reSortedArry, ...[item]];
            }
          });
        });
        renderContent(reSortedArry);
      };

      // click view button to product
      let viewButton = document.querySelectorAll('.add_view');
      viewButton.forEach((item) => {
        item.onclick = () => {
          localStorage.setItem('productid', item.getAttribute('productid'));
          window.location = './product.html';
        };
      });

      // click name to product
      let nameButton = document.querySelectorAll('.title');
      nameButton.forEach((item) => {
        item.onclick = () => {
          window.location = './product.html';
          localStorage.setItem('productid', item.getAttribute('productid'));
        };
      });

      //. Add to cart
      let addCart = document.querySelectorAll('.add_cart');
      addCart.forEach((item) => {
        item.onclick = () => {
          productList.filter((i) => {
            if (i.id == item.getAttribute('productid')) {
              let data = new FormData();
              data.append('userid', localStorage.getItem('userid'));
              data.append('productid', i.id);
              data.append('quantity', 1);
              data.append('price', i.price);
              axios
                .post('http://localhost/be/Checkout/AddToCart.php', data)
                .then((e) => e.data)
                .then((e) => {
                  e == 'Add Success' ? alert(e) : alert('Erros');
                });
              return;
            }
          });
        };
      });
      //. Wishlist
      let addWishlist = document.querySelectorAll('.add_tym');
      addWishlist.forEach((item) => {
        item.onclick = () => {
          let data = new FormData();
          data.append('userid', localStorage.getItem('userid'));
          data.append('productid', item.getAttribute('productid'));
          if (item.className.includes('clicked-wishlist')) {
            axios
              .post('http://localhost/be/Wishlist/delete.php', data)
              .then((e) => {
                if (e.data == 'Delete Succes') {
                  item.className = item.className.replace(
                    'clicked-wishlist',
                    ''
                  );
                }
              });
          } else {
            axios
              .post('http://localhost/be/Wishlist/Add.php', data)
              .then((e) => {
                if (e.data == 'Add Succes') {
                  item.className += ' clicked-wishlist';
                }
              });
          }
        };
      });

      rs();
    }, 1000);
  });
}

// Xu li bat dong bo
function render() {
  return new Promise((rs) => {
    setTimeout(() => {
      renderContent();
      rs('ok chay xong');
    }, 1000);
  });
}

async function asyncCall() {
  await render();
  await viewButton();
}
let data = new FormData();
data.append('userid', localStorage.getItem('userid'));
axios
  .post('http://localhost/be/Wishlist/list.php', data)
  .then((e) => e.data)
  .then((e) => {
    localStorage.setItem('wishlist', e);
  });

RenderBestSale();
RenderBrand();
RenderCategories();

if (localStorage.getItem('brandid')) {
  renderProductsByBrands(localStorage.getItem('brandid'));
  setTimeout(() => {
    viewButton();
  }, 1000);
  localStorage.removeItem('brandid');
} else if (localStorage.getItem('cateid')) {
  renderProductsByCategories(localStorage.getItem('cateid'));
  setTimeout(() => {
    viewButton();
  }, 1000);
  localStorage.removeItem('cateid');
} else {
  asyncCall();
}

// Render product by Categories
function renderProductsByCategories(cateid) {
  let data = new FormData();
  data.append('cateid', cateid);
  axios
    .post('http://localhost/be/DataList/ProductFilters.php', data)
    .then((e) => {
      document.querySelector('.content_container_main').innerHTML = '';
      document.querySelector('.content_container_main_pillar').innerHTML = '';
      document.querySelector('.content_container_title_right').innerHTML = '';
      // document.querySelector(".SideBar_bestseller_content").innerHTML = '';
      renderContent(e.data);
    });
}

// Render Prodcut by Brand
function renderProductsByBrands(brandid) {
  let data = new FormData();
  data.append('brand', brandid);
  axios
    .post('http://localhost/be/DataList/ProductFilters.php', data)
    .then((e) => {
      document.querySelector('.content_container_main').innerHTML = '';
      document.querySelector('.content_container_main_pillar').innerHTML = '';
      document.querySelector('.content_container_title_right').innerHTML = '';
      // document.querySelector(".SideBar_bestseller_content").innerHTML = '';
      renderContent(e.data);
    });
}
