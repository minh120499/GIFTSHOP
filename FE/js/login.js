//Đổ dữ liệu xuống để so sánh
// API
var api = 'http://localhost/be/Admin/GetUsers.php';

// Hàm lấy giá trị trong API
function getAPI(callback) {
  fetch(api)
    .then(function (response) {
      return response.json();
    })
    .then(callback);
}

// khởi tạo 3 mảng lưu email, phone và password
var emailCompar = [];
var phoneCompar = [];
var passwordCompar = [];

function start() {
  getAPI(function (api) {
    for (var i = 0; i < api.length; i++) {
      emailCompar.push(`${api[i].brand}`);
      phoneCompar.push(`${api[i].country}`);
      passwordCompar.push(`${api[i].quantity}`);
    }
  });
}
start();

function Loginform() {
  var username = document.getElementById('username').value;
  var password = document.getElementById('password').value;

  // Kiểm tra username và password xem có thỏa mãn không
  // đầu tiên là kiểm tra xem đã điền đủ thông tin chưa
  if (_.isEmpty(username) && _.isEmpty(password)) {
    username = '';
    password = '';
    document.getElementById('loginError').innerHTML =
      star + 'Please complete all information';
  }
  // Nếu điền đủ rồi
  else {
    // sẽ duyệt 1 vòng lặp để kiểm tra
    for (let i = 0; i < emailCompar.length; i++) {
      // nếu username không trùng với phone hoặc email
      if (
        String(emailCompar[i]) != username ||
        String(phoneCompar[i]) != username
      ) {
        username = '';
        document.getElementById('loginError').innerHTML =
          star + 'Please check your login information again';
      } // Nếu password không trùng thì
      else if (String(passwordCompar[i] != password)) {
        username = '';
        document.getElementById('loginError').innerHTML =
          star + 'Please check your login information again';
      } // nếu trùng hết thì
      else {
        document.getElementById('usernameError').innerHTML = '';
      }
    }
  }

  // Sau khi đăng thông tin được điền đầy đủ
  if (username && password) {
    // ta đẩy id với giá trị truyền vào là user lên localStorage và sẽ sử dụng cái id đẩy lên này để thao tác với các form khác
    // như form thông tin người dùng
    // form giỏ hàng hay form yêu thích
    var storageKey = 'idMerry';
    var id = [];
    id.push(username);
    localStorage.setItem(storageKey, id);
  }
}
