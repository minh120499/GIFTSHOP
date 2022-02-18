function renderContent(listProducts = 'empty') {
    axios
        .get('http://localhost/BE/DataList/ProductList.php')
        .then((e) => e.data)
        .then((e) => {
            productList = e;
            listProducts == 'empty' ? (listProducts = e) : '';
            listProducts == 'empty' ? '' : (productListToFliter = listProducts);
        });
    var html2 = '';
    var html3 = '';
    var select = document.getElementById('show_items');
    var perPage = select.options[select.selectedIndex].value;
    let end = perPage * idPage;
    start = (idPage - 1) * perPage;
    let totalPages = Math.ceil(e.length / perPage);

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
            if (e[i].detail.length > 150) {
                stringdetail = e[i].detail.slice(0, 150) + ' ...';
            } else {
                stringdetail = e[i].detail;
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
