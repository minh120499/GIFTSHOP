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


// API các thao tác với API
var api = "http://localhost/BE/Users/GetInfo.php";

var idMerry = localStorage.getItem('idMerry');
console.log(idMerry);

// Hàm lấy giá trị trong API
function getAPI(callback){
    fetch(api)
        .then(function(response){
            return response.json();
        })
        .then(callback);       
}

function start(){
    getAPI(function(api){
        // ta sẽ duyệt mảng 
        for(var i = 0 ; i <api.length ; i++){
            // sau đó kiểm tra nếu cái id trên localStorage nó trùng với email hoặc phone thì 
            if(idMerry === api[i].phone || idMerry === api[i].email){
                // ta sẽ đổ hết dữ liệu ra
                var html_mail = `<span>${api[i].email}</span>`;
                var html_phone = `<span>${api[i].phone}</span>`;
                var html_img = `<img src="${api[i].avatar}" alt="">`;
                var html_infor_img = `<img src="${api[i].avatar}" alt="">`;
                document.getElementById('birthday').value = api[i].birthday;
                document.getElementById('firstName').value = api[i].firstname;
                document.getElementById('lastName').value = api[i].lastname;
                document.getElementById('address').value = api[i].address;
                document.querySelector('.email_text').innerHTML = html_mail;
                document.querySelector('.phone_number_text').innerHTML = html_phone;
                document.querySelector('.infor_img').innerHTML = html_infor_img;
                document.querySelector('.my_Profile_Img').innerHTML = html_img;
            }
        }
    });
}

start();

// Hàm sửa lại thông tin của form
// Cái này em code




















