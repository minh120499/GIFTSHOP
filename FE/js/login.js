function Loginform() {
  var username = document.getElementById('username').value;
  var password = document.getElementById('password').value;

  if (_.isEmpty(username) || _.isEmpty(password)) {
    username = '';
    password = '';
    document.getElementById('loginError').innerHTML =
      'Please complete all information';
    return false;
  } else {
    document.getElementById('loginError').innerHTML = '';
  }

  // Sau khi đăng thông tin được điền đầy đủ
  if (username && password) {
    console.log(username);
    console.log(password);
    // Post dữ liệu lên
    let data = new FormData();
    data.append('username', username);
    data.append('password', password);

    axios
      .post('http://localhost/BE/Login&Register/Login.php', data)
      .then((e) => {
        console.log(e.data);
        if (e.data == 'Login Success') {
          // Đẩy lên localstorage
          localStorage.setItem('userid', username);
        } else {
          return false;
        }
      });
    window.history.back();
  }
}
