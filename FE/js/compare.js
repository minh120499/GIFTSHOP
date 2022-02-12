var html = ''
var productList = []
axios.get('http://localhost/be/DataList/ProductList.php')
    .then(e => {
        e.data.map(item => {
            productList = [...productList, ...[{ id: item.id, name: item.name }]]
        })
        // console.log(productList)
    })

// Ẩn so sánh
document.querySelector('.compare-close').addEventListener('click', () => {
    document.querySelector('.compare-product').style.display = 'none'
    // html = `<div class="minhi">
    //              <input type="text" class="product-compare-left" id="datalist-left">
    //             <button class="button-compare-left">Search</button>
    //         </div>`
    // document.querySelector('.compare-left').innerHTML = html;
})

// Click so sánh
document.querySelector('.compare').addEventListener('click', () => {
    document.querySelector('.compare-product').style.display = 'grid'
    document.querySelector('.compare-product').style.animationName = 'popup'
    let formData = new FormData;
    formData.append('id', 1)
    axios.post('http://localhost/be/Compare/Compare.php', formData)
        .then(e => e.data[0])
        .then(e => {
            html =
                `<div>${e.name}</div>
                        <img src="${e.src}" alt="">
                        <div>${e.brand}</div>
                        <div>${e.country}</div> 
                        <div>${e.date}</div>
                        <div>${e.price}$</div>
                        <div>${e.size}</div>
                        <div>${e.rating}</div>
                        <div>${e.anniversary}</div>`
            document.querySelector('.compare-left').innerHTML = html;
        })
})

function searchForCompareLeft() {
    let data = document.querySelector('.product-compare-left').value
    const result = productList.filter(item => item.name === data);
    
    let formData = new FormData;
    formData.append('id', result[0].id)
    axios.post('http://localhost/be/Compare/Compare.php', formData)
        .then(e => e.data[0])
        .then(e => {
            html =
                `<div>${e.name}</div>
                        <img src="${e.src}" alt="">
                        <div>${e.brand}</div>
                        <div>${e.country}</div> 
                        <div>${e.date}</div>
                        <div>${e.price}$</div>
                        <div>${e.size}</div>
                        <div>${e.rating}</div>
                        <div>${e.anniversary}</div>`
            document.querySelector('.compare-left').innerHTML = html;
        })
}

function getSearchValueLeft(e) {
    let data = document.querySelector('.product-compare-left').value
    const result = productList.filter(item => item.name.includes(e.value));
    console.log(result)
    document.querySelector('#list-compare-left').innerHTML = ''
    result.forEach(item => {
        let list = document.createElement('div')
        list.addEventListener('click', () => {
            document.querySelector('.product-compare-left').value = list.textContent
            document.querySelector('#list-compare-left').style.display = 'none'
        })
        html = `${item.name}`
        list.textContent = html
        document.querySelector('#list-compare-left').appendChild(list)
    })
    document.querySelector('#list-compare-left').style.display = 'block'
}

function showSuggetsLeft() {
    productList.forEach(item => {
        let list = document.createElement('div')
        list.addEventListener('click', () => {
            document.querySelector('.product-compare-left').value = list.textContent
            document.querySelector('#list-compare-left').style.display = 'none'
        })
        html = `${item.name}`
        list.textContent = html
        document.querySelector('#list-compare-left').appendChild(list)
    })
    document.querySelector('#list-compare-left').style.display = 'block'
}

function showSuggetsRight() {
    productList.forEach(item => {
        let list = document.createElement('div')
        list.addEventListener('click', () => {
            document.querySelector('.product-compare-right').value = list.textContent
            document.querySelector('#list-compare-right').style.display = 'none'
        })
        html = `${item.name}`
        list.textContent = html
        document.querySelector('#list-compare-right').appendChild(list)
    })
    document.querySelector('#list-compare-right').style.display = 'block'
}

function searchForCompareRight() {
    let data = document.querySelector('.product-compare-right').value
    const result = productList.filter(item => item.name === data);

    let formData = new FormData;
    formData.append('id', result[0].id)
    axios.post('http://localhost/be/Compare/Compare.php', formData)
        .then(e => e.data[0])
        .then(e => {
            html =
                `<div>${e.name}</div>
                        <img src="${e.src}" alt="">
                        <div>${e.brand}</div>
                        <div>${e.country}</div> 
                        <div>${e.date}</div>
                        <div>${e.price}$</div>
                        <div>${e.size}</div>
                        <div>${e.rating}</div>
                        <div>${e.anniversary}</div>`
            document.querySelector('.compare-right').innerHTML = html;
        })
}

function getSearchValueRight(e) {
    let data = document.querySelector('.product-compare-right').value
    const result = productList.filter(item => item.name.includes(e.value));
    console.log(result)
    document.querySelector('#list-compare-right').innerHTML = ''
    result.forEach(item => {
        let list = document.createElement('div')
        list.addEventListener('click', () => {
            document.querySelector('.product-compare-right').value = list.textContent
            document.querySelector('#list-compare-right').style.display = 'none'
        })
        html = `${item.name}`
        list.textContent = html
        document.querySelector('#list-compare-right').appendChild(list)
    })
    document.querySelector('#list-compare-right').style.display = 'block'
}
