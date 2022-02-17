// Làm nút search 
var search_box_btn = document.querySelector('.search_box_btn');

search_box_btn.addEventListener('click',function(){
    this.parentElement.classList.toggle('open');
    this.previousElementSibling.focus();


    console.log(this.parentElement);          /* .parent là lấy ra phần tử cha */
    console.log(this.previousElementSibling);          /* .previousElementSibling là lấy phần tử đằng trước */
    console.log(this.nextElementSibling);              /* .nextElementSibling là lấy phần tử đằng sau */
});

// JS cho thanh menu left
var Menu_nav = document.querySelector('.Menu_nav');
var menu_left = document.querySelector('.nav-mid_rp button');
var close_menu = document.querySelector('.menu_close i');
var Promotion_down = document.querySelector('.Promotion_btn');
var Blog_down = document.querySelector('.Blog_btn');
var Menu_nav_btn = document.querySelector('.Menu_nav_btn');
var Categories_nav_btn = document.querySelector('.Categories_nav_btn');

menu_left.addEventListener("click",function(){
    document.querySelector('.Menu_nav').classList.add('show');
});

close_menu.addEventListener("click",function(){
    document.querySelector('.Menu_nav').classList.remove('show');
})

Menu_nav.addEventListener('click',function(e){
    if(e.target == e.currentTarget){
        Menu_nav.classList.remove('show');
    }
})

Promotion_down.addEventListener("click",function(){
    document.querySelector('.option_menu>li:nth-child(3)').classList.toggle('show_drop');
})

Blog_down.addEventListener("click",function(){
    document.querySelector('.option_menu>li:nth-child(4)').classList.toggle('show_drop');
})

Menu_nav_btn.addEventListener('click',function(){
    document.querySelector('.option_menu').classList.remove('hide');
    document.querySelector('.option_categories').classList.remove('show');
})

Categories_nav_btn.addEventListener('click',function(){
    document.querySelector('.option_menu').classList.add('hide');
    document.querySelector('.option_categories').classList.add('show');
})
