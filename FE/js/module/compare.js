export function compare() {
  console.log();
  var html = '';
  var productList = [];
  axios.get('http://localhost/be/DataList/ProductList.php').then((e) => {
    e.data.map((item) => {
      productList = [...productList, ...[{ id: item.id, name: item.name }]];
    });
  });

  // Ẩn so sánh
  document.querySelector('.compare-close').addEventListener('click', () => {
    document.querySelector('.compare-product').style.display = 'none';
  });

  // Click so sánh
  let cmp = document.querySelectorAll('.compare');
  cmp.forEach((item) => {
    item.addEventListener('click', () => {
      document.querySelector('.compare-product').style.display = 'grid';
      document.querySelector('.compare-product').style.animationName = 'popup';
      let formData = new FormData();
      formData.append('id', item.getAttribute('productid'));
      axios
        .post('http://localhost/be/Compare/Compare.php', formData)
        .then((e) => e.data[0])
        .then((e) => {
          html = `<div>${e.name}</div>
                        <img src="${e.src}" alt="">
                        <div>${e.brand}</div>
                        <div>${e.country}</div> 
                        <div>${e.date}</div>
                        <div>${e.price}$</div>
                        <div>${e.size}</div>
                        <div>${e.rating}</div>
                        <div>${e.anniversary}</div>`;
          document.querySelector('.compare-left').innerHTML = html;
        });
    });
  });

  // Serach suggest
  document.querySelector('.button-compare-left').onclick =
    function searchForCompareLeft() {
      let data = document.querySelector('.product-compare-left').value;
      const result = productList.filter((item) => item.name === data);

      let formData = new FormData();
      formData.append('id', result[0].id);
      axios
        .post('http://localhost/be/Compare/Compare.php', formData)
        .then((e) => e.data[0])
        .then((e) => {
          html = `<div>${e.name}</div>
                        <img src="${e.src}" alt="">
                        <div>${e.brand}</div>
                        <div>${e.country}</div> 
                        <div>${e.date}</div>
                        <div>${e.price}$</div>
                        <div>${e.size}</div>
                        <div>${e.rating}</div>
                        <div>${e.anniversary}</div>`;
          document.querySelector('.compare-left').innerHTML = html;
        });
    };
  document.querySelector('.button-compare-right').onclick =
    function searchForCompareRight() {
      let data = document.querySelector('.product-compare-right').value;
      const result = productList.filter((item) => item.name === data);

      let formData = new FormData();
      formData.append('id', result[0].id);
      axios
        .post('http://localhost/be/Compare/Compare.php', formData)
        .then((e) => e.data[0])
        .then((e) => {
          html = `<div>${e.name}</div>
                        <img src="${e.src}" alt="">
                        <div>${e.brand}</div>
                        <div>${e.country}</div> 
                        <div>${e.date}</div>
                        <div>${e.price}$</div>
                        <div>${e.size}</div>
                        <div>${e.rating}</div>
                        <div>${e.anniversary}</div>`;
          document.querySelector('.compare-right').innerHTML = html;
        });
    };
  // Onkeyup
  document.querySelector('.product-compare-right').onkeyup =
    function getSearchValueRight(e) {
      let data = document.querySelector('.product-compare-right').value;
      const result = productList.filter((item) =>
        item.name.toLowerCase().includes(data.toLowerCase())
      );
      document.querySelector('#list-compare-right').innerHTML = '';
      result.forEach((item) => {
        let list = document.createElement('div');
        list.addEventListener('click', () => {
          document.querySelector('.product-compare-right').value =
            list.textContent;
          document.querySelector('#list-compare-right').style.display = 'none';
        });
        html = `${item.name}`;
        list.textContent = html;
        document.querySelector('#list-compare-right').appendChild(list);
      });
      document.querySelector('#list-compare-right').style.display = 'block';
    };
  document.querySelector('.product-compare-left').onkeyup =
    function getSearchValueLeft() {
      let data = document.querySelector('.product-compare-left').value;
      const result = productList.filter((item) =>
        item.name.toLowerCase().includes(data.toLowerCase())
      );
      document.querySelector('#list-compare-left').innerHTML = '';
      result.forEach((item) => {
        let list = document.createElement('div');
        list.addEventListener('click', () => {
          document.querySelector('.product-compare-left').value =
            list.textContent;
          document.querySelector('#list-compare-left').style.display = 'none';
        });
        html = `${item.name}`;
        list.textContent = html;
        document.querySelector('#list-compare-left').appendChild(list);
      });
      document.querySelector('#list-compare-left').style.display = 'block';
    };
  // Show list suggest
  document.querySelector('.product-compare-left').onclick =
    function showSuggetsLeft() {
      productList.forEach((item) => {
        let list = document.createElement('div');
        list.addEventListener('click', () => {
          document.querySelector('.product-compare-left').value =
            list.textContent;
          document.querySelector('#list-compare-left').style.display = 'none';
        });
        html = `${item.name}`;
        list.textContent = html;
        document.querySelector('#list-compare-left').appendChild(list);
      });
      document.querySelector('#list-compare-left').style.display = 'block';
    };
  document.querySelector('.product-compare-right').onclick =
    function showSuggetsRight() {
      productList.forEach((item) => {
        let list = document.createElement('div');
        list.addEventListener('click', () => {
          document.querySelector('.product-compare-right').value =
            list.textContent;
          document.querySelector('#list-compare-right').style.display = 'none';
        });
        html = `${item.name}`;
        list.textContent = html;
        document.querySelector('#list-compare-right').appendChild(list);
      });
      document.querySelector('#list-compare-right').style.display = 'block';
    };
  document.querySelector('.product-compare-left').onblur = () => {
    // document.querySelector('#list-compare-left').style.visibility = 'hidden'
  };
}
