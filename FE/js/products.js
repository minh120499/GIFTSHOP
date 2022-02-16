var btn_square = document.querySelector(".square");
var btn_pillar = document.querySelector(".pillar");

let idPage = 1;
let start = 0;

btn_pillar.addEventListener("click", function () {
  document.querySelector(".content_container_main").classList.add("hide");
  document
    .querySelector(".content_container_main_pillar")
    .classList.add("show");
  if (btn_square.classList.contains("active")) {
    btn_square.classList.remove("active");
    btn_pillar.classList.add("active");
  }
});

btn_square.addEventListener("click", function () {
  document.querySelector(".content_container_main").classList.remove("hide");
  document
    .querySelector(".content_container_main_pillar")
    .classList.remove("show");
  if (btn_pillar.classList.contains("active")) {
    btn_square.classList.add("active");
    btn_pillar.classList.remove("active");
  }
});

var show_filter = document.querySelector(".show_filter");
show_filter.addEventListener("click", function () {
  document.querySelector(".SideBar").classList.toggle("filter_show");
});

//search filter làm nút tìm kiếm giống W3 school chỉ search được trong 1 trang
function search() {
  // Declare variables
  var input, filter, main, infor, p, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  if (btn_square.classList.contains("active")) {
    main = document.querySelector(".content_container_main");
    infor = main.getElementsByClassName("content_container_item");
    for (i = 0; i < infor.length; i++) {
      p = infor[i].getElementsByClassName("title")[0];
      txtValue = p.textContent || p.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        infor[i].style.display = "";
      } else {
        infor[i].style.display = "none";
      }
    }
  } else {
    main = document.querySelector(".content_container_main_pillar");
    infor = main.getElementsByClassName("content_container_item_pillar");

    for (i = 0; i < infor.length; i++) {
      p = infor[i].getElementsByClassName("title")[0];
      txtValue = p.textContent || p.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        infor[i].style.display = "";
      } else {
        infor[i].style.display = "none";
      }
    }
  }
}

// Làm 2 nút chuyển trang
var check = false;
const previousBtn = document.querySelector(".previousbtn");
const nextBtn = document.querySelector(".nextbtn");
nextBtn.addEventListener("click", () => {
  idPage++;
  if(check == true){
    renderProduct();
  }else {
    renderContent();
  }
});

previousBtn.addEventListener("click", () => {
  idPage--;
  if(check == true){
    renderProduct();
  }else {
    renderContent();
  }
});


// Hàm đổ dữ liệu ra khi load trang
function renderContent() {
  axios
    .get("http://localhost/BE/DataList/ProductList.php")
    .then((e) => e.data)
    .then((e) => {
      var html2 = "";
      var html3 = "";
      var html5 = "";
      var select = document.getElementById("show_items");
      var perPage = select.options[select.selectedIndex].value;
      end = perPage * idPage;
      start = (idPage - 1) * perPage;
      totalPages = Math.ceil(e.length / perPage);

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
      
      e.map((item, i) => {
        if (i >= start && i < end) {
          html2 += `<div class="col-6 col-lg-4 content_container_item">
              <div class="content_container_item_border">
                  <div class="content_container_item_show">
                      <img src=${e[i].src} alt="">
                      <div class="content_container_item_show_infor">
                          <p class="title">${e[i].name}</p>
                          <p>$<span>${e[i].price}</span></p>
                      </div>
                  </div>
                  <div class="content_container_item_hover">
                      <li>
                          <button class="add_view"><i class="far fa-eye"></i></button>
                      </li>
                      <li>
                          <button class="add_cart">Add to cart</button>
                          <button class="add_tym"><i class="far fa-heart"></i></button>
                      </li>
                  </div>
              </div>
          </div>`;
          let stringdetail = '';
          if(e[i].detail.length > 150){
            stringdetail =  e[i].detail.slice(0, 150)+' ...';
          }else{
            stringdetail =  e[i].detail;
          }

          html3 += `<div class="content_container_item_pillar ">
            <div class="content_container_item_pillar_img">
            <img src=${e[i].src} alt="">
                <button class="add_view"><i class="far fa-eye"></i></button>
            </div>
            <div class="content_container_item_pillar_content">
                <h2><a class="title" href="">${e[i].name}</a></h2>
                <div class="content_container_item_pillar_star">
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
                <div class="content_container_item_pillar_price">
                    <span>$</span><span>${e[i].price}</span>
                </div>
                <div class="content_container_item_pillar_content_title">
                    <span>${stringdetail}</span>
                </div>
                <div class="content_container_item_pillar_content_btn">
                    <button class="add_cart">Add to cart</button>
                    <button class="add_tym"><i class="far fa-heart"></i></button>
                </div>
            </div>
          </div>`;
        }
      });

      for(var i=0 ; i < 4 ; i++){
        html5 += `<li class="row">
            <div class="col-4">
                <img src="${e[i].src}" alt="">
            </div>
            <div class="col-8">
                <p><a href="#">${e[i].name}</a></p>
                <p>$<span>${e[i].price}</span></p>
            </div>
        </li>`;
      };

      var html4 = ``;
      for (var i = 1; i <= totalPages; i++) {
        if (idPage === i) {
          html4 += `<p class='active'><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
        } else {
          html4 += `<p><span onclick="clickBtnChoosePage(event);">${i}</span></p>`;
        }
      }

      document.querySelector(".content_container_main").innerHTML = html2;
      document.querySelector(".content_container_main_pillar").innerHTML = html3;
      document.querySelector(".content_container_title_right").innerHTML = html4;
      document.querySelector('.SideBar_bestseller_content').innerHTML = html5;
    });
}
renderContent();

// Hiển thị dữ liệu ra theo loại sản phẩm và theo thương hiệu
axios
  .get("http://localhost/BE/DataList/ProductList.php")
  .then((e) => e.data)
  .then((e) => {
    //Lay va in ra categories
    var html = "";
    var categories = [];

    for (var i = 0; i < e.length; i++) {
      if (categories.includes(e[i].anniversary) === false) {
        categories = [...categories, e[i].anniversary];
      }
    }
    for (var i = 0; i < categories.length; i++){
      html += `<li onclick="producttype('${categories[i]}');" class="${categories[i]}"><span>${categories[i]}</span></li>`;
    }
    document.querySelector(".SideBar_Category").outerHTML = html;

    //Lay va in ra brand
    var html1 = "";
    var brands = [];

    for (var i = 0; i < e.length ; i++) {
      if (brands.includes(e[i].brand) === false) {
        brands = [...brands, e[i].brand];
      }
    }
    for (var i = 0; i < brands.length; i++) {
      html1 += `<li onclick="producttype('${brands[i]}');" class="${brands[i]}"><span>${brands[i]}</span><span>(1)</span></li>`;

    }
    document.querySelector(".SideBar_Color").outerHTML = html1;
  });

// Hàm gọi ra danh sách sản phẩm theo tên danh mục và tên thương hiệu
var product = [];
function producttype(classname) {
  axios.get("http://localhost/BE/DataList/ProductList.php")
  .then((e) => e.data)
  .then((e) => {
    check = true;
    product = [];
    idPage = 1;
    e.map((item, i) => {
      if (e[i].anniversary == classname) {
        product = [...product, e[i]];
      }
      if (e[i].brand == classname ){
        product = [...product, e[i]];
      }
    });
    renderProduct();
  });
}

// Hàm gọi ra danh sách sản phẩm theo tên sản phẩm
function renderProduct(){
  var html10 = "";
  var html11 = "";
  var select = document.getElementById("show_items");
  var perPage = select.options[select.selectedIndex].value;
  end = perPage * idPage;
  start = (idPage - 1) * perPage;
  
  for(let i= 0 ; i< product.length ; i++){
    if (i >= start && i < end ) {
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
                    <button class="add_view"><i class="far fa-eye"></i></button>
                </li>
                <li>
                    <button class="add_cart">Add to cart</button>
                    <button class="add_tym"><i class="far fa-heart"></i></button>
                    <button class="add_share"><i class="fas fa-retweet"></i></button>
                </li>
            </div>
        </div>
      </div>`;

      let stringdetail = '';
      if(product[i].detail.length > 150){
        stringdetail =  product[i].detail.slice(0, 150)+' ...';
      }else{
        stringdetail =  product[i].detail;
      }
      
      html11 += `<div class="content_container_item_pillar ">
        <div class="content_container_item_pillar_img">
        <img src=${product[i].src} alt="">
            <button class="add_view"><i class="far fa-eye"></i></button>
        </div>
        <div class="content_container_item_pillar_content">
            <h2><a class="title" href="">${product[i].name}</a></h2>
            <div class="content_container_item_pillar_star">
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <div class="content_container_item_pillar_price">
                <span>$</span><span>${product[i].price}</span>
            </div>
            <div class="content_container_item_pillar_content_title">
                <span>${stringdetail}</span>
            </div>
            <div class="content_container_item_pillar_content_btn">
                <button class="add_cart">Add to cart</button>
                <button class="add_tym"><i class="far fa-heart"></i></button>
                <button class="add_share"><i class="fas fa-retweet"></i></button>
            </div>
        </div>
      </div>`;
    }
  };

  document.querySelector(".content_container_main").innerHTML = html10;
  document.querySelector(".content_container_main_pillar").innerHTML = html11;

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
  document.querySelector(".content_container_title_right").innerHTML =html4;
}

// Làm sự kiện click vào chọn trang
function clickBtnChoosePage(e){
  idPage = parseInt(e.target.textContent);
  if(check == true){
    renderProduct();
  }else{
    renderContent();
  }
}


// Làm nút tìm kiếm the giá sản phẩm Filter
function priceSearch(price1,price2){
  let low_price = document.getElementById('low_price').value;
  let expensive = document.getElementById('expensive').value;
  
  if(parseInt(low_price) > parseInt(expensive)){
    alert('vui lòng nhập giá trước nhỏ hơn giá sau');
    return false;
  }else {
    price1 = parseInt(low_price);
    price2 = parseInt(expensive);
  }

}











