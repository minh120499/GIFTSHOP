//-------------------------------------------- PHẦN 1: CÁC THAO TÁC VỚI KHÁCH HÀNG -------
// Lấy ra giá trị được chọn trong ô select của phần khách hàng
var selectValue = '';
function getTextSelect(x) {
  var options = x.children;
  var valueSelect = '';
  for (var i = 0; i < options.length; i++) {
    if (options[i].selected) {
      valueSelect += options[i].value;
    }
  }
  selectValue = valueSelect;
}

// làm nút search của phần khách hàng
function searchCustomer() {
  let inputCustomer = document.getElementById('CustomerInput').value; // nút search của phần Khách hàng

  if (selectValue == '') {
    document.getElementById('searchErr').innerHTML =
      ' Vui lòng chọn mục tìm kiếm';
    return false;
  } else if (inputCustomer == '') {
    document.getElementById('searchErr').innerHTML = ' Vui lòng nhập nội dung';
    return false;
  }

  axios
    .get('http://localhost/BE/Admin/GetUsers.php')
    .then((e) => e.data)
    .then((e) => {
      var html1 = '';
      let STT = [];
      let firstName = [];
      let lastName = [];
      let address = [];
      let phone = [];

      for (let i = 0; i < e.length; i++) {
        if (
          selectValue === 'name' &&
          (e[i].firstname + ' ' + e[i].lastname)
            .toLowerCase()
            .includes(inputCustomer.toLowerCase()) === true
        ) {
          STT.push(i + 1);
          firstName.push(e[i].firstname);
          lastName.push(e[i].lastname);
          address.push(e[i].address);
          phone.push(e[i].phone);
        } else if (
          selectValue === 'address' &&
          e[i].address.toLowerCase().includes(inputCustomer.toLowerCase()) ===
            true
        ) {
          STT.push(i + 1);
          firstName.push(e[i].firstname);
          lastName.push(e[i].lastname);
          address.push(e[i].address);
          phone.push(e[i].phone);
        } else if (
          selectValue === 'phone' &&
          e[i].phone.toLowerCase().includes(inputCustomer.toLowerCase()) ===
            true
        ) {
          STT.push(i + 1);
          firstName.push(e[i].firstname);
          lastName.push(e[i].lastname);
          address.push(e[i].address);
          phone.push(e[i].phone);
        } else if (selectValue == '') {
          document.getElementById('searchErr').innerHTML =
            'Vui lòng chọn mục cần tìm';
        } else {
          document.getElementById('searchErr').innerHTML = '';
        }
      }

      // Vòng lặp for để đổ dữ liệu mới tìm được ra
      for (let i = 0; i < STT.length; i++) {
        html1 += `<tr>
                <td>
                    <span>${STT[i]}</span>
                </td>
                <td>
                    <span class="customer_firstname">${firstName[i]}</span>
                </td>
                <td>
                    <span class="customer_lastname">${lastName[i]}</span>
                </td>
                <td>
                    <span class="customer_address">${address[i]}</span>
                </td>
                <td>
                    <span class="customer_phone">${phone[i]}</span>
                </td>
                <td>
                    <span userId="${STT[i]}" class="customer_Detail"">chi tiết</span>
                </td>
            </tr>`;
      }

      // đổ dữ liệu ra
      document.getElementById('customer_Management_content_table').innerHTML =
        html1;

      // Làm thao tác chuyển sang chi tiết người dùng
      setTimeout(() => {
        let a = document.querySelectorAll('span[userId]');
        a.forEach((item) => {
          item.onclick = () => {
            var x = item.getAttribute('userid');
            let htmlCustomer_Information1 = '';
            for (let i = 0; i < STT.length; i++) {
              if (STT[i] == x) {
                htmlCustomer_Information1 += `
                                <div class="col-4">
                                    <div class="customer_Information_avatar">
                                        <img src="${e[x - 1].avatar}" alt="">
                                    </div>
                                </div>
                                <div class="col-8 customer_Information_title">
                                    <ul>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>FirstName : </span>
                                            </div>
                                            <span>${e[x - 1].firstname}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>LastName : </span>
                                            </div>
                                            <span>${e[x - 1].lastname}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>FullName : </span>
                                            </div>
                                            <span>${
                                              e[x - 1].firstname +
                                              ' ' +
                                              e[x - 1].lastname
                                            }</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Birthday : </span>
                                            </div>
                                            <span>${e[x - 1].birthday}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Địa Chỉ : </span>
                                            </div>
                                            <span>${e[x - 1].address}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Email : </span>
                                            </div>
                                            <span>${e[x - 1].email}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Số Điện Thoại : </span>
                                            </div>
                                            <span>${e[x - 1].phone}</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-12 customer_Information_content">
                                    <!-- <h3>Thống kê khách Hàng : </h3>
                                    <ul>
                                        <li>
                                            <span>Tổng số lượng sản phẩm đã mua : </span>
                                            <span class="customer_Information_content_quantily">10</span>
                                        </li>
                                        <li>
                                            <span>Tổng số tiền đã mua :</span>
                                            <span class="customer_Information_content_price">1.000.000 Đ</span>
                                        </li>
                                        <li>
                                            <span>Xếp hạng thành viên : </span>
                                            <span class="customer_Information_content_classification">Thành viên Bạc</span>
                                        </li>
                                    </ul> -->
                                    <button class="customer_Information_comback">come back</button>
                                </div>`;
              }
            }
            document.querySelector('.Information_Customer').innerHTML =
              htmlCustomer_Information1;
            $('.customer_Management_container').hide();
            $('.customer_Information').show();
            document
              .querySelector('.customer_Information_comback')
              .addEventListener('click', function () {
                $('.customer_Management_container').show();
                $('.customer_Information').hide();
              });
          };
        });
      }, 1000);
    });
}

// Gọi đến API của trang danh sách khách hàng
function renderContentCustomer() {
  axios
    .get('http://localhost/BE/Admin/GetUsers.php')
    .then((e) => e.data)
    .then((e) => {
      var html = '';
      for (let i = 0; i < e.length; i++) {
        html += `<tr>
                <td>
                    <span>${i + 1}</span>
                </td>
                <td>
                    <span class="customer_firstname">${e[i].firstname}</span>
                </td>
                <td>
                    <span class="customer_lastname">${e[i].lastname}</span>
                </td>
                <td>
                    <span class="customer_address">${e[i].address}</span>
                </td>
                <td>
                    <span class="customer_phone">${e[i].phone}</span>
                </td>
                <td>
                    <span userId="${i}" class="customer_Detail"">chi tiết</span>
                </td>
            </tr>`;
      }
      // đổ dữ liệu ra
      document.getElementById('customer_Management_content_table').innerHTML =
        html;

      // Làm thao tác chuyển sang chi tiết người dùng
      setTimeout(() => {
        let a = document.querySelectorAll('span[userId]');
        a.forEach((item) => {
          item.onclick = () => {
            var x = item.getAttribute('userid');
            var htmlCustomer_Information = '';
            for (let i = 0; i < e.length; i++) {
              if (x == i) {
                htmlCustomer_Information += `
                                <div class="col-4">
                                    <div class="customer_Information_avatar">
                                        <img src="${e[i].avatar}" alt="">
                                    </div>
                                </div>
                                <div class="col-8 customer_Information_title">
                                    <ul>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>FirstName : </span>
                                            </div>
                                            <span>${e[i].firstname}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>LastName : </span>
                                            </div>
                                            <span>${e[i].lastname}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>FullName : </span>
                                            </div>
                                            <span>${
                                              e[i].firstname +
                                              ' ' +
                                              e[i].lastname
                                            }</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Birthday : </span>
                                            </div>
                                            <span>${e[i].birthday}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Địa Chỉ : </span>
                                            </div>
                                            <span>${e[i].address}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Email : </span>
                                            </div>
                                            <span>${e[i].email}</span>
                                        </li>
                                        <li>
                                            <div class="customer_Information_f">
                                                <span>Số Điện Thoại : </span>
                                            </div>
                                            <span>${e[i].phone}</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-12 customer_Information_content">
                                    <!-- <h3>Thống kê khách Hàng : </h3>
                                    <ul>
                                        <li>
                                            <span>Tổng số lượng sản phẩm đã mua : </span>
                                            <span class="customer_Information_content_quantily">10</span>
                                        </li>
                                        <li>
                                            <span>Tổng số tiền đã mua :</span>
                                            <span class="customer_Information_content_price">1.000.000 Đ</span>
                                        </li>
                                        <li>
                                            <span>Xếp hạng thành viên : </span>
                                            <span class="customer_Information_content_classification">Thành viên Bạc</span>
                                        </li>
                                    </ul> -->
                                    <button class="customer_Information_comback">come back</button>
                                </div>`;
              }
            }
            document.querySelector('.Information_Customer').innerHTML =
              htmlCustomer_Information;
            $('.customer_Management_container').hide();
            $('.customer_Information').show();
            document
              .querySelector('.customer_Information_comback')
              .addEventListener('click', function () {
                $('.customer_Management_container').show();
                $('.customer_Information').hide();
              });
          };
        });
      }, 1000);
    });
}

//---------------------------------------- PHẦN 2: CÁC THAO TÁC VỚI QUẢN LÝ SẢN PHẨM -----
// Hàm lấy ra giá trị được chọn trong ô select tìm kiếm theo của phần quản lý sản phẩm
var selectproductChoose = '';
function getTextSelectProductChoose(x) {
  var options = x.children;
  var valueSelect = '';
  for (var i = 0; i < options.length; i++) {
    if (options[i].selected) {
      valueSelect += options[i].value;
    }
  }
  selectproductChoose = valueSelect;
}

// Làm nút search của phần sản phẩm
function SearchProduct() {
  let inputProduct = document.getElementById('searchProduct').value;
  if (selectproductChoose == '') {
    document.querySelector('.searchProductErr').innerHTML =
      'Vui lòng chọn mục cần tìm';
    return false;
  } else if (inputProduct == '') {
    document.querySelector('.searchProductErr').innerHTML =
      'Vui lòng nhập nội dung cần tìm';
    return false;
  } else {
    document.querySelector('.searchProductErr').innerHTML = '';
  }

  axios
    .get('http://localhost/BE/DataList/ProductList.php')
    .then((e) => e.data)
    .then((e) => {
      var html2 = '';
      var productid = [];
      var productImg = [];
      var productname = [];
      var productdetaile = [];
      var productquantity = [];
      var productprice = [];
      var productbrand = [];
      var producttype = [];
      var productdate = [];

      for (let i = 0; i < e.length; i++) {
        if (
          selectproductChoose === 'name' &&
          e[i].name.toLowerCase().includes(inputProduct.toLowerCase()) === true
        ) {
          productid.push(e[i].id);
          productImg.push(e[i].src);
          productname.push(e[i].name);
          productdetaile.push(e[i].detail);
          productquantity.push(e[i].quantity);
          productprice.push(e[i].price);
          productbrand.push(e[i].brand);
          producttype.push(e[i].anniversary);
          productdate.push(e[i].date);
        } else if (
          selectproductChoose === 'price' &&
          e[i].price == inputProduct
        ) {
          productid.push(e[i].id);
          productImg.push(e[i].src);
          productname.push(e[i].name);
          productdetaile.push(e[i].detail);
          productquantity.push(e[i].quantity);
          productprice.push(e[i].price);
          productbrand.push(e[i].brand);
          producttype.push(e[i].anniversary);
          productdate.push(e[i].date);
        }
      }

      // đổ dữ liệu vừa tìm được ra
      var b;
      if (productname.length < 15) {
        b = productname.length;
      } else {
        b = 15;
      }
      for (let i = 0; i < b; i++) {
        let x = '';
        if (productdetaile[i].length < 200) {
          x = productdetaile[i];
        } else {
          x = productdetaile[i].slice(0, 200) + ' ...';
        }
        html2 += `<div class="product_Management_content_item row">
                <div class="product_Management_content_item_img col-2">
                    <img src="${productImg[i]}" alt="">
                    <button class="add_view" productId="${productid[i]}"><i class="far fa-eye"></i></button>
                </div>
                <div class="product_Management_content_item_title col-8">
                    <h4 productId="${productid[i]}" class="product_info">${productname[i]}</h4>
                    <p>${x}</p>
                    <span>${productquantity[i]}</span>
                </div>
                <div class="product_Management_content_item_price">
                    <span>${productprice[i]}$</span>
                </div>
            </div>`;
      }

      document.querySelector(
        '.product_Management_content_container'
      ).innerHTML = html2;

      // làm các nút chọn page
      function showchoosepage(x) {
        var paging = Math.ceil(x / 15);
        var html_product_paging = '';
        var pagingFirstActive = document.querySelector(
          '.product_Management_content_paging span:first-child'
        );
        for (let i = 0; i < paging; i++) {
          html_product_paging += `<span>${i + 1}</span>`;
        }
        document.querySelector('.product_Management_content_paging').innerHTML =
          html_product_paging;
        if (pagingFirstActive != undefined) {
          pagingFirstActive.classList.add('paging_active');
        } else {
          $('.product_Management_content_paging span:first-child').hide();
        }
      }
      showchoosepage(productname.length);

      // Hàm hiển thị chi tiết từng sản phẩm
      function ProductsDetailInfo() {
        setTimeout(() => {
          let a = document.querySelectorAll('h4[productId], button[productId]');
          a.forEach((item) => {
            item.onclick = () => {
              let x = item.getAttribute('productId');
              var product_Detail_content = '';
              for (let i = 0; i < productname.length; i++) {
                if (x - 1 == i) {
                  product_Detail_content += `
                                <div class="product_Detail_content">
                                    <h3>Chi tiết Sản Phẩm</h3>
                                    <div class="row">
                                        <div class="col-4">
                                            <img src="${productImg[i]}" alt="" id="ProductsImage">
                                            <input type="file" id="imagefile" onchange="chooseFile(this)" accept="image/gif, image/jpeg, image/png">
                                            <span>Dung lượng file tối đa 1 MB Định dạng:.JPEG, .PNG</span>
                                        </div>
                                        <div class="col-8">
                                            <div class="form-group">
                                                <label for="">Id sản phẩm :</label>
                                                <span id="ProductsId">${productid[i]}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Tên Sản Phẩm :<span id="ProductsNameErr"></span></label>
                                                <input type="text" id="ProductsName" value="${productname[i]}">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Mô tả sản phẩm :<span id="ProductsDetailErr"></span></label>
                                                <textarea name="" id="ProductsDetail" cols="30" rows="5">${productdetaile[i]}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Loại sản phẩm :</label>
                                                <span id="ProductsAniversary">${producttype[i]}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Thương hiệu :</label>
                                                <span class="">${productbrand[i]}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Giá hiện tại :</label>
                                                <span id="product_price_now">${productprice[i]}$</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Nhập giá mới :<span id="ProductsPriceErr"></span></label>
                                                <input type="number" id="ProductsPrice">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Số lượng tồn :</label>
                                                <span class="product_quantity">${productquantity[i]}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Ngày nhập :</label>
                                                <span class="">${productdate[i]}</span>
                                            </div>
                                            <div class="form_btn">
                                            <button onclick="SaveInforProduct();">Lưu</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="product_Detail_comeback">
                                    <button>Go Back</button>
                                </div>`;
                }
              }
              document.querySelector('.product_Detail').innerHTML =
                product_Detail_content;
              $('.product_Management_container').hide();
              $('.product_Detail').show();
              document
                .querySelector('.product_Detail_comeback button')
                .addEventListener('click', function () {
                  $('.product_Management_container').show();
                  $('.product_Detail').hide();
                });
            };
          });
        }, 1000);
      }

      // Làm sự kiện khi click vào các nút chọn page
      function chossepage() {
        var product_paging = document.querySelectorAll(
          '.product_Management_content_paging span'
        );
        product_paging.forEach(function (item, index) {
          item.addEventListener('click', function () {
            // document.querySelector('.paging_active').classList.remove('paging_active');
            item.classList.add('paging_active');
            for (let i = 15 * index; i < 15 * (index + 1); i++) {
              if (productname[i] != undefined) {
                var x = '';
                if (productdetaile[i].length < 200) {
                  x = productdetaile[i];
                } else {
                  x = productdetaile[i].slice(0, 200) + ' ...';
                }

                html2 += `<div class="product_Management_content_item row">
                            <div class="product_Management_content_item_img col-2">
                                <img src="${productImg[i]}" alt="">
                                <button class="add_view" productId="${productid[i]}"><i class="far fa-eye"></i></button>
                            </div>
                            <div class="product_Management_content_item_title col-8">
                                <h4 productId="${productid[i]}" class="product_info">${productname[i]}</h4>
                                <p>${x}</p>
                                <span>${productquantity[i]}</span>
                            </div>
                            <div class="product_Management_content_item_price">
                                <span>${productprice[i]}$</span>
                            </div>
                        </div>`;
              } else {
                html2 += '';
              }
            }
            document.querySelector(
              '.product_Management_content_container'
            ).innerHTML = html2;
            html2 = '';
            ProductsDetailInfo();
          });
        });
      }
      chossepage();
    });
}

// Hàm đổ dữ liệu vào trang quản lý sản phẩm
function renderProductManagement() {
  axios
    .get('http://localhost/BE/DataList/ProductList.php')
    .then((e) => e.data)
    .then((e) => {
      // Khi dữ liệu vừa được load
      var html_product = '';
      for (let i = 0; i < 15; i++) {
        let x = '';
        if (e[i].detail.length < 200) {
          x = e[i].detail;
        } else {
          x = e[i].detail.slice(0, 200) + ' ...';
        }
        html_product += `<div class="product_Management_content_item row">
                <div class="product_Management_content_item_img col-2">
                    <img src="${e[i].src}" alt="">
                    <button class="add_view" productId="${e[i].id}"><i class="far fa-eye"></i></button>
                </div>
                <div class="product_Management_content_item_title col-8">
                    <h4 productId="${e[i].id}" class="product_info">${e[i].name}</h4>
                    <p>${x}</p>
                    <span>${e[i].quantity}</span>
                </div>
                <div class="product_Management_content_item_price">
                    <span>${e[i].price}$</span>
                </div>
            </div>`;
      }
      document.querySelector(
        '.product_Management_content_container'
      ).innerHTML = html_product;

      // làm các nút chọn page
      function showchoosepage(x) {
        var paging = Math.ceil(x / 15);
        var html_product_paging = '';
        for (let i = 0; i < paging; i++) {
          html_product_paging += `<span>${i + 1}</span>`;
        }
        document.querySelector('.product_Management_content_paging').innerHTML =
          html_product_paging;
        document
          .querySelector('.product_Management_content_paging span:first-child')
          .classList.add('paging_active');
      }
      showchoosepage(e.length);

      // Làm sự kiện khi click vào các nút chọn page
      function chossepage() {
        var product_paging = document.querySelectorAll(
          '.product_Management_content_paging span'
        );
        product_paging.forEach(function (item, index) {
          item.addEventListener('click', function () {
            document
              .querySelector('.paging_active')
              .classList.remove('paging_active');
            item.classList.add('paging_active');
            for (let i = 15 * index; i < 15 * (index + 1); i++) {
              if (e[i] != undefined) {
                let x = '';
                if (e[i].detail.length < 200) {
                  x = e[i].detail;
                } else {
                  x = e[i].detail.slice(0, 200) + ' ...';
                }
                html_product += `<div class="product_Management_content_item row">
                                <div class="product_Management_content_item_img col-2">
                                    <img src="${e[i].src}" alt="">
                                    <button class="add_view" productId="${e[i].id}"><i class="far fa-eye"></i></button>
                                </div>
                                <div class="product_Management_content_item_title col-8">
                                    <h4 productId="${e[i].id}" class="product_info">${e[i].name}</h4>
                                    <p>${x}</p>
                                    <span>${e[i].quantity}</span>
                                </div>
                                <div class="product_Management_content_item_price">
                                    <span>${e[i].price}$</span>
                                </div>
                            </div>`;
              } else {
                html_product += '';
              }
            }
            document.querySelector(
              '.product_Management_content_container'
            ).innerHTML = html_product;
            html_product = '';
            ProductsDetailInfo();
          });
        });
      }
      chossepage();

      // Hàm hiển thị chi tiết từng sản phẩm
      function ProductsDetailInfo() {
        setTimeout(() => {
          let c = document.querySelectorAll('h4[productId], button[productId]');
          c.forEach((item) => {
            item.onclick = () => {
              let x = item.getAttribute('productId');
              var product_Detail_content = '';
              for (let i = 0; i < e.length; i++) {
                if (x - 1 == i) {
                  product_Detail_content += `
                                <div class="product_Detail_content">
                                    <h3>Chi tiết Sản Phẩm</h3>
                                    <div class="row">
                                        <div class="col-4">
                                            <img src="${e[i].src}" alt="" id="ProductsImage">
                                            <input type="file" id="imagefile" onchange="chooseFile(this)" accept="image/gif, image/jpeg, image/png">
                                            <span>Dung lượng file tối đa 1 MB Định dạng:.JPEG, .PNG</span>
                                        </div>
                                        <div class="col-8">
                                            <div class="form-group">
                                                <label for="">Id Sản Phẩm :</label>
                                                <span id="ProductsId" >${e[i].id}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Tên Sản Phẩm :<span id="ProductsNameErr"></span></label>
                                                <input type="text" id="ProductsName" value="${e[i].name}">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Mô tả sản phẩm :<span id="ProductsDetailErr"></span></label>
                                                <textarea name="" id="ProductsDetail" cols="30" rows="5">${e[i].detail}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Loại sản phẩm :</label>
                                                <span id="ProductsAniversary">${e[i].anniversary}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Thương hiệu :</label>
                                                <span class="">${e[i].brand}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Giá hiện tại :</label>
                                                <span id="product_price_now">${e[i].price}$</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Nhập giá mới :<span id="ProductsPriceErr"></span></label>
                                                <input type="number" id="ProductsPrice">
                                            </div>
                                            <div class="form-group">
                                                <label for="">Số lượng tồn :</label>
                                                <span class="product_quantity">${e[i].quantity}</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="">Ngày nhập :</label>
                                                <span class="">${e[i].date}</span>
                                            </div>
                                            <div class="form_btn">
                                            <button onclick="SaveInforProduct();">Lưu</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="product_Detail_comeback">
                                    <button>Go Back</button>
                                </div>`;
                }
              }
              document.querySelector('.product_Detail').innerHTML =
                product_Detail_content;
              $('.product_Management_container').hide();
              $('.product_Detail').show();
              document
                .querySelector('.product_Detail_comeback button')
                .addEventListener('click', function () {
                  $('.product_Management_container').show();
                  $('.product_Detail').hide();
                });
            };
          });
        }, 1000);
      }
      ProductsDetailInfo();

      // ban đầu thì cho nút show ẩn đi, sau khi lựa chọn sản phẩm thì mới để nó hiện lên
      $('.Button_show').hide();
      // làm phần hiển thị ra theo thương hiệu sản phẩm
      document
        .querySelector('.Button_show')
        .addEventListener('click', function () {
          var html_product = '';
          var a = [];
          if (selectProductBrandValue == '') {
            selectProductBrandText = '';
          } else if (selectProductTypeValue == '') {
            selectProductTypeText == '';
          }

          for (let i = 0; i < e.length; i++) {
            let x = '';

            if (e[i].detail.length < 200) {
              x = e[i].detail;
            } else {
              x = e[i].detail.slice(0, 200) + ' ...';
            }

            if (e[i].brand.includes(selectProductBrandText) == true) {
              a.push(e[i].id);
              html_product += `<div class="product_Management_content_item row">
                        <div class="product_Management_content_item_img col-2">
                            <img src="${e[i].src}" alt="">
                            <button class="add_view" productId="${e[i].id}"><i class="far fa-eye"></i></button>
                        </div>
                        <div class="product_Management_content_item_title col-8">
                            <h4 productId="${e[i].id}" class="product_info">${e[i].name}</h4>
                            <p>${x}</p>
                            <span>${e[i].quantity}</span>
                        </div>
                        <div class="product_Management_content_item_price">
                            <span>${e[i].price}$</span>
                        </div>
                    </div>`;
            } else if (
              e[i].anniversary.includes(selectProductBrandText) == true
            ) {
              a.push(e[i].id);
              html_product += `<div class="product_Management_content_item row">
                        <div class="product_Management_content_item_img col-2">
                            <img src="${e[i].src}" alt="">
                            <button class="add_view" productId="${e[i].id}"><i class="far fa-eye"></i></button>
                        </div>
                        <div class="product_Management_content_item_title col-8">
                            <h4 productId="${e[i].id}" class="product_info">${e[i].name}</h4>
                            <p>${x}</p>
                            <span>${e[i].quantity}</span>
                        </div>
                        <div class="product_Management_content_item_price">
                            <span>${e[i].price}$</span>
                        </div>
                    </div>`;
            } else {
              html_product += '';
            }
          }
          showchoosepage(a.length);
          document.querySelector(
            '.product_Management_content_container'
          ).innerHTML = html_product;
          ProductsDetailInfo();
        });
    });
}

// Làm phần lưu thông tin sản phẩm
function SaveInforProduct() {
  var ProductsId = document.getElementById('ProductsId').textContent;
  var ProductsName = document.getElementById('ProductsName').value;
  var ProductsDetail = document.getElementById('ProductsDetail').innerHTML;
  var ProductsPrice = document.getElementById('ProductsPrice').value;
  var imagefile = document.getElementById('imagefile').value;
  var ProductsSrc = '';
  var product_price_now =
    document.getElementById('product_price_now').innerHTML;
  var ProductsAniversary =
    document.getElementById('ProductsAniversary').innerHTML;

  let star = '<i class="fa-solid fa-star-of-life"></i>';
  // Validate ô tên sản phẩm
  if (_.isEmpty(ProductsName)) {
    ProductsName = '';
    document.getElementById('ProductsNameErr').innerHTML = star;
  } else {
    document.getElementById('ProductsNameErr').innerHTML = '';
  }

  // Validate ô chi tiết sản phẩm
  if (_.isEmpty(ProductsDetail)) {
    ProductsDetail = '';
    document.getElementById('ProductsDetailErr').innerHTML = star;
  } else {
    document.getElementById('ProductsDetailErr').innerHTML = '';
  }

  // Validate ô giá mới sản phẩm
  if (_.isEmpty(ProductsPrice)) {
    ProductsPrice = product_price_now;
    document.getElementById('ProductsPriceErr').innerHTML = '';
  } else {
    if (ProductsPrice < 0) {
      ProductsPrice = product_price_now;
      document.getElementById('ProductsPriceErr').innerHTML = star;
      return false;
    } else {
      document.getElementById('ProductsPriceErr').innerHTML = '';
    }
  }

  if (_.isEmpty(imagefile)) {
    ProductsSrc = '';
  } else {
    ProductsSrc =
      'http://localhost/img/giftshop/' +
      ProductsAniversary +
      '/' +
      ProductsName +
      '.jpg';
  }

  // Cập nhật dữ liệu
  if (ProductsName && ProductsDetail && ProductsPrice) {
    if (ProductsSrc == '') {
      let dataUpdate = new FormData();
      dataUpdate.append('id', ProductsId);
      dataUpdate.append('name', ProductsName);
      dataUpdate.append('detail', ProductsDetail);
      dataUpdate.append('price', ProductsPrice);
      axios
        .post('http://localhost/BE/Admin/UpdateProduct.php', dataUpdate)
        .then((e) => {
          console.log(e.data);
        });
    } else {
      let dataUpdate = new FormData();
      dataUpdate.append('id', ProductsId);
      dataUpdate.append('name', ProductsName);
      dataUpdate.append('detail', ProductsDetail);
      dataUpdate.append('price', ProductsPrice);
      dataUpdate.append('src', ProductsSrc);
      axios
        .post('http://localhost/BE/Admin/UpdateProduct.php', dataUpdate)
        .then((e) => {
          console.log(e.data);
        });
    }
  }
}

// ------------------------------------- PHẦN 3: CÁC THAO TÁC VỚI QUẢN LÝ HÓA ĐƠN --------
// Hàm đổ dữ liệu ra trang danh sách hóa đơn
function renderBills() {
  axios
    .get('http://localhost/BE/Admin/GetOrders.php')
    .then((e) => e.data)
    .then((e) => {
      console.log(e)
      var x = [];
      var y = [];
      var n = [];
      var htmlBill = '';
      var htmlBillitem = [];
      for (let i = 0; i < e.length; i++) {
        y.push(e[i].date);
        x.push(e[i].id);
      }

      for (let i = 0; i < unique(x).length; i++) {
        y.push(e[i].date);
        x.push(e[i].id);
        n[i] = 0;
        for (let j = 0; j < e.length; j++) {
          if (unique(x)[i] == e[j].id) {
            n[i] += e[j].quantity * e[j].price;
          }
        }
      }

      function unique(arr) {
        return Array.from(new Set(arr));
      }

      for (let i = 0; i < unique(x).length; i++) {
        htmlBill += `<div class="bill_Management_container_content_item">
                <div class="bill_Management_container_content_item_date">
                    <span>Ngày đặt hàng : </span>
                    <span>${unique(y)[i]}</span>
                </div>
                <div class="bill_product">
                    <div class="bill_product_content_item">
                        
                    </div>
                </div>
                <div class="bill_Management_container_content_item_add">
                    <div class="line"></div>
                    <span class="see_more">Xem thêm ...</span>
                    <div class="line"></div>
                </div>
                <div class="bill_Management_container_content_item_total">
                    <img src="./image/myAccount/tongtien.png" alt="">
                    <span>Tổng tiền hóa đơn</span>
                    <span class="total_money_bill">${n[i]}</span>
                </div>
            </div>`;
      }
      document.querySelector(
        '.bill_Management_container_content_container'
      ).innerHTML = htmlBill;

      var bill = document.querySelectorAll('.bill_product_content_item');

      for (let i = 0; i < unique(x).length; i++) {
        htmlBillitem[i] = '';
        for (let j = 0; j < e.length; j++) {
          if (unique(x)[i] == e[j].id) {
            htmlBillitem[i] += ` <div class="bill_product_item row">
                    <div class="col-2">
                        <img src="${e[j].img}" alt="">
                    </div>
                    <div class="col-8">
                        <h3>${e[j].name}</h3>
                        <p>${e[j].status}</p>
                        <span>${e[j].quantity}</span>   
                    </div>
                    <div class="col-2">
                        <span>${e[j].quantity * e[i].price}</span>
                    </div>
                </div>`;
          }
        }
        bill[i].innerHTML = htmlBillitem[i];
      }

      // Làm phần xem thêm của từng sản phẩm
      var see_more = document.querySelectorAll('.see_more');
      var bill_product = document.querySelectorAll('.bill_product');
      for (let i = 0; i < see_more.length; i++) {
        see_more[i].addEventListener('click', function () {
          bill_product[i].classList.toggle('more_see');
        });
      }
    });
}

//-------------------------------------- PHẦN 4: CÁC THAO TÁC VỚI THÊM MỚI SẢN PHẨM ------
// Đổ dữ liệu từ api ra các ô select
function rederApiAddProductSelect() {
  axios('http://localhost/BE/DataList/Categories.php')
    .then((e) => e.data)
    .then((e) => {
      let htmlSelectType = '';
      let htmlSelectType0 = `<option value="">Loại Sản Phẩm</option>`;
      for (let i = 0; i < e.length; i++) {
        htmlSelectType += `<option value="${e[i].id}">${e[i].name}</option>`;
      }
      document.getElementById('product_type').innerHTML =
        htmlSelectType0 + htmlSelectType;
    });

  axios('http://localhost/BE/DataList/Brands.php')
    .then((e) => e.data)
    .then((e) => {
      let htmlSelectBrand = '';
      let htmlSelectBrand0 = `<option value="">Thương hiệu sản phẩm</option>`;
      for (let i = 0; i < e.length; i++) {
        htmlSelectBrand += `<option value="${e[i].id}">${e[i].name}</option>`;
      }
      document.getElementById('product_brand').innerHTML =
        htmlSelectBrand0 + htmlSelectBrand;
    });
}

function rederApiAddProductSelect2() {
  axios('http://localhost/BE/DataList/Categories.php')
    .then((e) => e.data)
    .then((e) => {
      let htmlSelectType = '';
      let htmlSelectType0 = `<option value="">Loại Sản Phẩm</option>`;
      for (let i = 0; i < e.length; i++) {
        htmlSelectType += `<option value="${e[i].id}">${e[i].name}</option>`;
      }
      document.getElementById('product_type2').innerHTML =
        htmlSelectType0 + htmlSelectType;
    });

  axios('http://localhost/BE/DataList/Brands.php')
    .then((e) => e.data)
    .then((e) => {
      let htmlSelectBrand = '';
      let htmlSelectBrand0 = `<option value="">Thương hiệu sản phẩm</option>`;
      for (let i = 0; i < e.length; i++) {
        htmlSelectBrand += `<option value="${e[i].id}">${e[i].name}</option>`;
      }
      document.getElementById('product_brand2').innerHTML =
        htmlSelectBrand0 + htmlSelectBrand;
    });
}

// Hàm hiển thị hình ảnh khi chọn
function chooseFile(fileInput) {
  if (fileInput.files && fileInput.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#image').attr('src', e.target.result);
    };
    reader.readAsDataURL(fileInput.files[0]);
  }
}

// Hàm lấy ra các giá trị được chọn bên trong ô select của phần thêm mới sản phẩm
var selectProductTypeValue = '';
var selectProductTypeText = '';
var selectProductBrandValue = '';
var selectProductBrandText = '';

function getTextselectProductType(x) {
  let options = x.children;
  let valueSelect = '';
  let valueSelectid = '';
  for (let i = 0; i < options.length; i++) {
    if (options[i].selected) {
      valueSelectid += options[i].value;
      valueSelect += options[i].text;
    }
  }
  selectProductTypeValue = valueSelectid;
  selectProductTypeText = valueSelect;
  if (selectProductTypeValue == '') {
    $('.Button_show').hide();
  } else {
    $('.Button_show').show();
  }
}

function getTextselectProductBrand(x) {
  let options = x.children;
  let valueSelect = '';
  let valueSelectid = '';
  for (var i = 0; i < options.length; i++) {
    if (options[i].selected) {
      valueSelectid += options[i].value;
      valueSelect += options[i].text;
    }
  }
  selectProductBrandValue = valueSelectid;
  selectProductBrandText = valueSelect;
  if (selectProductBrandValue == '') {
    $('.Button_show').hide();
  } else {
    $('.Button_show').show();
  }
}

// Viết hàm thêm mới sản phẩm
function addProduct() {
  // khai báo các biến
  let product_name = document.getElementById('product_name').value;
  let product_description = document.getElementById(
    'product_description'
  ).value;
  let product_price = document.getElementById('product_price').value;
  let imagefile = document.getElementById('imagefile2').value;

  let star = '<i class="fa-solid fa-star-of-life"></i>';
  // validate cho phần nhập tên
  if (_.isEmpty(product_name)) {
    product_name = '';
    document.getElementById('product_nameErr').innerHTML = star;
  } else {
    document.getElementById('product_nameErr').innerHTML = '';
  }

  // validate cho phần nhập mô tả
  if (_.isEmpty(product_description)) {
    product_description = '';
    document.getElementById('product_descriptionErr').innerHTML = star;
  } else {
    document.getElementById('product_descriptionErr').innerHTML = '';
  }

  // validate cho giá sản phẩm
  if (_.isEmpty(product_price)) {
    product_price = '';
    document.getElementById('product_priceErr').innerHTML = star;
  } else if (product_price <= 0) {
    product_price = '';
    document.getElementById('product_priceErr').innerHTML = star;
  } else {
    document.getElementById('product_priceErr').innerHTML = '';
  }

  // validate chọn loại sản phẩm
  if (selectProductTypeValue == '') {
    selectProductTypeText = '';
    document.getElementById('product_typeErr2').innerHTML = star;
  } else {
    document.getElementById('product_typeErr2').innerHTML = '';
  }

  // validate chọn thương hiệu sản phẩm
  if (_.isEmpty(selectProductBrandValue)) {
    selectProductBrandText = '';
    document.getElementById('product_brandErr2').innerHTML = star;
  } else {
    selectProductBrandText = selectProductBrandValue;
    document.getElementById('product_brandErr2').innerHTML = '';
  }

  // validate cho chọn ảnh
  if (_.isEmpty(imagefile)) {
    imagefile = '';
    document.getElementById('product_imgErr').innerHTML = star;
  } else {
    imagefile =
      'http://localhost/img/giftshop/' +
      selectProductTypeText +
      '/' +
      product_name +
      '.jpg';
    document.getElementById('product_imgErr').innerHTML = '';
  }

  // Trả ra ngày hiện tại
  var d = new Date();
  var today = '';
  if (d.getMonth() + 1 < 10) {
    today =
      d.getDate() + '/' + '0' + (d.getMonth() + 1) + '/' + d.getFullYear();
  } else {
    today = d.getDate() + '/' + (d.getMonth() + 1) + '/' + d.getFullYear();
  }

  // Điều kiện để có thể nhận các sản phẩm
  if (
    product_name &&
    product_description &&
    product_price &&
    imagefile &&
    selectProductBrandText &&
    selectProductTypeText
  ) {
    let arr = {
      name: product_name,
      price: product_price,
      detail: product_description,
      date: today,
      anniversary: selectProductTypeText,
      brand: selectProductBrandText,
      src: imagefile,
    };

    let data = new FormData();
    data.append('name', product_name);
    data.append('price', product_price);
    data.append('detail', product_description);
    data.append('date', today);
    data.append('anniversary', selectProductTypeText);
    data.append('brand', selectProductBrandText);
    data.append('src', imagefile);
    axios.post('http://localhost/BE/Admin/AddProduct.php', data).then((e) => {
      console.log(e.data);
    });
  }
}

/*-------------------------------------------------------------------------- Các thao tác với form ---------------------------------------------------------------------*/

// hàm để ẩn hiện các phần tử
function hideContentRight() {
  $('.customer_Management').hide();
  $('.product_Management').hide();
  $('.bill_Management').hide();
  $('.add_product').hide();
  $('.customer_Information').hide();
  $('.product_Detail').hide();
}

// khởi tạo hàm để remove phần tử trước khi click
function removeActive() {
  var active = document.querySelector('.active');
  active.classList.remove('active');
}

// Làm thao tác chuyển trang qua lại
var customer_btn = document.querySelector('.customer_btn');
var product_btn = document.querySelector('.product_btn');
var bill_btn = document.querySelector('.bill_btn');
var addProduct_btn = document.querySelector('.addProduct_btn');

// Tải dữ liệu lên khi load trang
function loadAdmin() {
  hideContentRight();
  $('.customer_Management').show();
  customer_btn.classList.add('active');
  renderProductManagement();
  // customer_btn.add('active');
  // // $('.customer_btn').show();
  renderBills();
  renderContentCustomer();
}

customer_btn.addEventListener('click', function () {
  removeActive();
  hideContentRight();
  customer_btn.classList.add('active');
  $('.customer_Management').show();
});

product_btn.addEventListener('click', function () {
  removeActive();
  hideContentRight();
  rederApiAddProductSelect();

  product_btn.classList.add('active');
  $('.product_Management').show();
});

bill_btn.addEventListener('click', function () {
  removeActive();
  hideContentRight();
  renderBills();
  bill_btn.classList.add('active');
  $('.bill_Management').show();
});

addProduct_btn.addEventListener('click', function () {
  removeActive();
  hideContentRight();
  addProduct_btn.classList.add('active');
  $('.add_product').show();
  rederApiAddProductSelect2();
});
