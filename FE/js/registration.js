// API
var api1 = 'http://localhost/BE/Login&Register/Register.php';
var api = 'http://localhost/BE/Admin/GetUsers.php';
// Hàm lấy giá trị trong API
function getAPI(callback) {
  fetch(api)
    .then(function (response) {
      return response.json();
    })
    .then(callback);
}

// khởi tạo 2 mảng để lưu số điện thoại và email
var phoneCompar = [];
var mailCompar = [];

function start() {
  getAPI(function (api) {
    // console.log(api);
    for (var i = 0; i < api.length; i++) {
      phoneCompar.push(`${api[i].phone}`); // lưu tất cả số điện thoại vào
      mailCompar.push(`${api[i].email}`); // lưu tất cả email vào
    }
  });
}

start();

function emailIsValid(email) {
  return /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(
    email
  );
}

// Hàm kiểm tra số điện thoại
function phoneIsValid(phone) {
  return /((09|03|07|08|05)+([0-9]{8})\b)/g.test(phone);
}

// Các thao tác với form
function SubmitRegistration() {
  var firstName = document.getElementById('firstName').value;
  var lastName = document.getElementById('lastName').value;
  var address = document.getElementById('address').value;
  var email = document.getElementById('email').value;
  var phone = document.getElementById('phone').value;
  var password = document.getElementById('password').value;
  var birthday = document.getElementById('birthday').value;
  var avatar = '';
  var file = document.getElementById('avatar').value;

  let star = '<i class="fa-solid fa-star-of-life"></i>';
  // Sử dụng thư viện lodash

  // validate firstName
  if (_.isEmpty(firstName)) {
    firstName = '';
    document.getElementById('firstNameError').innerHTML =
      star + 'please enter firstName';
  } else {
    document.getElementById('firstNameError').innerHTML = '';
  }

  // validate lastName
  if (_.isEmpty(lastName)) {
    lastName = '';
    document.getElementById('lastNameError').innerHTML =
      star + 'please enter lastName';
  } else {
    document.getElementById('lastNameError').innerHTML = '';
  }

  // validate address
  if (_.isEmpty(address)) {
    address = '';
    document.getElementById('addressError').innerHTML =
      star + 'please enter address';
  } else {
    document.getElementById('addressError').innerHTML = '';
  }

  // validate birthday: Thiếu điều kiện người dùng phải đủ bao nhiêu tuổi ******
  if (_.isEmpty(birthday)) {
    birthday = '';
    document.getElementById('birthdayError').innerHTML =
      star + 'Please select a date of birth';
  } else {
    document.getElementById('birthdayError').innerHTML = '';
  }

  // validate email: kiểm tra có nhập đúng định dạng email không
  if (_.isEmpty(email)) {
    email = '';
    document.getElementById('emailError').innerHTML =
      star + 'please enter email';
  } else if (!emailIsValid(email)) {
    email = '';
    document.getElementById('emailError').innerHTML = star + 'Email invalidate';
  } else {
    document.getElementById('emailError').innerHTML = '';
  }
  // xét xem email có bị trùng không
  for (let i = 0; i < mailCompar.length; i++) {
    if (String(mailCompar[i]) == email) {
      email = '';
      document.getElementById('emailError').innerHTML =
        star + 'mail already exists';
    }
  }

  // validate Phone : kiểm tra số điện thoại có bị trùng không
  if (_.isEmpty(phone)) {
    phone = '';
    document.getElementById('phoneError').innerHTML =
      star + 'please enter Phone';
  } else if (
    phone.trim().length < 10 &&
    phone.trim().length > 11 &&
    !phoneIsValid(phone)
  ) {
    phone = '';
    document.getElementById('phoneError').innerHTML =
      star + 'phone number is not correct';
  } else {
    document.getElementById('phoneError').innerHTML = '';
  }
  // Xét xem số điện thoại có bị trùng k
  for (let i = 0; i < phoneCompar.length; i++) {
    if (String(phoneCompar[i]) == phone) {
      phone = '';
      document.getElementById('phoneError').innerHTML =
        star + 'phone number already exists';
    }
  }

  // validate password: kiểm tra nhập tối thiểu 8 chữ, 1 chữ hoa, 1 chữ thường và 1 chữ số
  var lowerCaseLetters = /[a-z]/g; // chữ thường
  var upperCaseLetters = /[A-Z]/g; // chữ hoa
  var numbers = /[0-9]/g; // 1 số

  if (_.isEmpty(password)) {
    password = '';
    document.getElementById('passwordError').innerHTML =
      star + 'please enter password';
  } else if (password.trim().length < 8) {
    password = '';
    document.getElementById('passwordError').innerHTML =
      star + 'Minimum of 8 characters';
  } else if (password.match(lowerCaseLetters) == null) {
    password = '';
    document.getElementById('passwordError').innerHTML =
      star + 'at least 1 lowercase letter';
  } else if (password.match(upperCaseLetters) == null) {
    password = '';
    document.getElementById('passwordError').innerHTML =
      star + 'at least 1 uppercase letter';
  } else if (password.match(numbers) == null) {
    password = '';
    document.getElementById('passwordError').innerHTML =
      star + 'at least 1 digit';
  } else {
    document.getElementById('passwordError').innerHTML = '';
  }

  // validate avatar
  if (_.isEmpty(file)) {
    avatar = '';
  } else {
    avatar = 'http://localhost/img/giftshop/user/' + phone + '.jpg';
    // đặt lại định dạng cho avartar theo số điện thoại vì số điện thoại là duy nhất
  }

  // Sau đó kiểm tra xem nếu nhập đầy đủ các thông tin rồi(với avatar thì k cần)
  if (
    firstName &&
    lastName &&
    address &&
    email &&
    phone &&
    password &&
    birthday
  ) {
    console.log('đã đủ');

    let data = new FormData();
    data.append('username', phone);
    data.append('firstname', firstName);
    data.append('lastname', lastName);
    data.append('address', address);
    data.append('email', email);
    data.append('phone', phone);
    data.append('avatar', avatar);
    data.append('birthday', birthday);
    data.append('password', password);
    axios.post(api1, data).then((e) => {
      console.log(e.data);
    });
  }
}
