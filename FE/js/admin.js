// Làm thao tác chuyển trang qua lại 
var customer_btn = document.querySelector('.customer_btn');
var product_btn = document.querySelector('.product_btn');
var bill_btn = document.querySelector('.bill_btn');
var addProduct_btn = document.querySelector('.addProduct_btn');

customer_btn.addEventListener('click',function(){
    $.ajax('../admin/curtomer_layout.html').done(function(Data){
        document.querySelector('.admin_content').innerHTML = Data;
    })
})

product_btn.addEventListener('click',function(){
    $.ajax('../admin/product_layout.html').done(function(Data){
        console.log(Data);
        document.querySelector('.admin_content').innerHTML = Data;
    })
})

bill_btn.addEventListener('click',function(){
    $.ajax('../admin/bill_layout.html').done(function(Data){
        document.querySelector('.admin_content').innerHTML = Data;
    })
})

addProduct_btn.addEventListener('click',function(){
    $.ajax('../admin/add_product_layout.html').done(function(Data){
        document.querySelector('.admin_content').innerHTML = Data;
    })
})





// JS cho phần khách hàng
// var customer_Detail = document.querySelector('.customer_Detail');
// var customer_Information_comback = document.querySelector('.customer_Information_comback');

// customer_Detail.addEventListener('click',function(){
//     document.querySelector('.customer_Management_content').classList.add('hide');
//     document.querySelector('.customer_Information').classList.add('show');
// })

// customer_Information_comback.addEventListener('click',function(){
//     document.querySelector('.customer_Management_content').classList.remove('hide');
//     document.querySelector('.customer_Information').classList.remove('show');
// })


// JS cho phần Danh Sách Sản Phẩm
// var Anniversary_click = document.querySelector('.Anniversary_click');


// JS cho phần Danh Sách Hóa Đơn
// var see_more = document.querySelector('.see_more');

// see_more.addEventListener('click',function(){
//     document.querySelector('.bill_product').classList.toggle('more_see');
// })






















