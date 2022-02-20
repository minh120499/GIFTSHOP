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
    document.querySelector('.my_Profile').classList.add('hide');
    document.querySelector('.Order_Purchase').classList.add('show');
})

var idMerry = localStorage.getItem('userId');

// API các thao tác với API
var api = "http://localhost/BE/Users/GetInfo.php";
var info = [];
let data = new FormData();
data.append('userid',idMerry)
axios.post(api,data)
.then(e => {
    info = e.data;
})


var AvatarFile = "";

// Hàm lấy giá trị trong API
function getAPI(callback){
    fetch(api)
        .then(function(response){
            return response.json();
        })
        .then(callback);       
}

function start(){
    setTimeout(()=>{
        getAPI(function(api){
            var a = info[0].birthday;
            AvatarFile = info[0].avatar;
            a = a.split('/').reverse();
            a = a.join('-');
        
            
            // ta sẽ đổ hết dữ liệu ra
            var html_mail = `<span>${info[0].email}</span>`;
            var html_phone = `<span>${info[0].phone}</span>`;
            var html_img = `<img src="${info[0].avatar}" class="imageAvatar" alt="">`;
            var html_infor_img = `<img src="${info[0].avatar}" class="imageAvatar" alt="">`;
            document.getElementById('birthday').value = '1987-03-04';
            document.getElementById('firstName').value = info[0].firstname;
            document.getElementById('lastName').value = info[0].lastname;
            document.getElementById('address').value = info[0].address;
            document.querySelector('.email_text').innerHTML = html_mail;
            document.querySelector('#phone_number_text').innerHTML = html_phone;
            document.querySelector('.infor_img').innerHTML = html_infor_img;
            document.querySelector('.my_Profile_Img').innerHTML = html_img;
            
        });
    },1000)
}

start();

// Hàm hiển thị hình ảnh khi chọn
function chooseFile(fileInput) {
    if(fileInput.files && fileInput.files[0]){
        var reader = new FileReader();

        reader.onload = function(e){
            $('.imageAvatar').attr('src', e.target.result);
        }

        reader.readAsDataURL(fileInput.files[0]);
    }
}


// Hàm sửa lại thông tin của form
// Cái này em code anh hộ em với
function saveInfor(){
    let firstname = document.getElementById('firstName').value;
    let lastname = document.getElementById('lastName').value;
    let birthday = document.getElementById('birthday').value;
    let address = document.getElementById('address').value;
    let file = document.getElementById('fileAvatar').value;
    let phone = document.getElementById('phone_number_text').textContent;
    let avartar = '';


    let star =  '<i class="fa-solid fa-star-of-life"></i>';
    // validate firstName
    if(_.isEmpty(firstname)){
        firstname = '';
        document.getElementById('firstnameErr').innerHTML = star+"please enter firstName";
    }else{
        document.getElementById('firstnameErr').innerHTML = "";
    }

    // validate lastName
    if(_.isEmpty(lastname)){
        lastname = '';
        document.getElementById('lastnameErr').innerHTML = star+"please enter lastName"
    }else{
        document.getElementById('lastnameErr').innerHTML = "";
    }


    // validate address
    if(_.isEmpty(address)){
        address = '';
        document.getElementById('addressErr').innerHTML = star+"please enter address"
    }else{
        document.getElementById('addressErr').innerHTML = "";
    }


    // validate birthday: Thiếu điều kiện người dùng phải đủ bao nhiêu tuổi ******
    if(_.isEmpty(birthday)){
        birthday = '';
        document.getElementById('birthdayErr').innerHTML = star+"Please select a date of birth";
    }else{
        document.getElementById('birthdayErr').innerHTML = "";
    }    

    // validate avatar
    if(_.isEmpty(file)){
        avatar = AvatarFile;
    }else{
        avatar = "http://localhost/img/giftshop/user/"+phone+'.jpg';
        // đặt lại định dạng cho avartar theo số điện thoại vì số điện thoại là duy nhất
    }


    if(firstname && lastname && address && birthday){
        if(file ==""){
            let dataUpdate = new FormData();
            dataUpdate.append('userid',idMerry)
            dataUpdate.append('firstname',firstname)
            dataUpdate.append('lastname',lastname)
            dataUpdate.append('address',address)
            dataUpdate.append('birthday',birthday)
        
            axios.post('http://localhost/BE/Users/Edit.php',dataUpdate)
            .then(e => {
                console.log(e.data)
            })
        }else{
            let dataUpdate = new FormData();
            dataUpdate.append('userid',idMerry)
            dataUpdate.append('firstname',firstname)
            dataUpdate.append('lastname',lastname)
            dataUpdate.append('address',address)
            dataUpdate.append('birthday',birthday)
            dataUpdate.append('avatar',avatar)
        
            axios.post('http://localhost/BE/Users/Edit.php',dataUpdate)
            .then(e => {
                console.log(e.data)
            })
        }
    }   
}





















