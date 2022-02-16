var click_My_Account = document.querySelector('.click_My_Account');
var edit_Profile = document.querySelector('.edit_Profile');
var purchase_Order = document.querySelector('.purchase_Order');


click_My_Account.addEventListener('click',function(){
    document.querySelector('.my_Profile').classList.remove('hide');
    document.querySelector('.Order_Purchase').classList.remove('show');
    document.querySelector('.Order_Purchase').classList.add('hide');
})

edit_Profile.addEventListener('click',function(){
    document.querySelector('.my_Profile').classList.remove('hide');
    document.querySelector('.Order_Purchase').classList.remove('show');
    document.querySelector('.Order_Purchase').classList.add('hide');
})


purchase_Order.addEventListener('click',function(){
    console.log("da click");
    document.querySelector('.my_Profile').classList.add('hide');
    document.querySelector('.Order_Purchase').classList.add('show');
})

    
















