export function compare() {
  var html = '';
  var data = [];
  axios.get('http://localhost/BE/DataList/ProductList.php').then((e) => {
    data = e.data;
    // console.log(e.data);
  });

  // Ẩn so sánh
  document.querySelector('.compare-close').addEventListener('click', () => {
    document.querySelector('.compare-product').style.display = 'none';
    html = `<div class="minhi">
                <input type="text">
                <button>Search</button>
            </div>`;
    document.querySelector('.compare-left').innerHTML = html;
  });

  // Bắt đầu so sánh
  document.querySelector('.compare').addEventListener('click', () => {
    console.log(123);
    document.querySelector('.compare-product').style.display = 'grid';
    document.querySelector('.compare-product').style.animationName = 'popup';
    console.log(data);
    let formData = new FormData();
    formData.append('id', 1);
    axios
      .post('http://localhost/BE/Compare/Compare.php', formData)
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
        document.querySelector('.compare-left').innerHTML += html;
      });
  });
}
