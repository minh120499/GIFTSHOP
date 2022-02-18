import { componentHTML } from './module/components.js';
import { header } from './module/header.js';
import * as validateForm from './module/validation.js';

componentHTML();
function render() {
  return new Promise((resolve) => {
    setTimeout(() => {
      renderAPI();
      resolve();
    }, 1000);
  });
}

// Render API
function renderAPI() {
  $.ajax('http://localhost/BE/AboutUs/AboutUs.php').done(function (data) {
    // console.log($.parseJSON(data))
    $('#con-email').text($.parseJSON(data)[0].email);
    $('#con-phone').text($.parseJSON(data)[0].phone);
    $('#con-address').text($.parseJSON(data)[0].address);
  });
}

// Render header.js
render().then(() => {
  return new Promise((resolve) => {
    setTimeout(() => {
      header();
      resolve();
    }, 1000);
  });
});

//Validation
const formFeedback = document.querySelector('#form-feedback');
const formCtrls = Array.from(formFeedback.querySelectorAll('.form-ctrl'));
const btnSubmit = formFeedback.querySelector('input[type="submit"]');
const listInput = ['#name', '#email', '#subject', '#feedback'];
listInput.forEach((input) => {
  validateForm.sanitizeValue(input);
});
validateForm.uppercase('#subject');
listInput.forEach((input) => {
  validateForm.onBlur(input, 'This field is required!');
});
validateForm.onBlurEmail(
  '#email',
  'This field is required!',
  'Email is not valid!'
);
btnSubmit.addEventListener('click', (e) => {
  e.preventDefault();
  listInput.forEach((input) => {
    validateForm.checkRequired(input, 'This field is required!');
  });
  validateForm.checkEmail(
    '#email',
    'This field is required!',
    'Email is not valid!'
  );

  // Khi các giá trị hợp lệ thì thực hiện submit và gửi dữ liệu
  if (formCtrls.every((formCtrl) => formCtrl.classList.contains('valid'))) {
    $.post(
      'http://localhost/BE/ContactUs/ContactUs.php',
      {
        name: $('#name').val(),
        email: $('#email').val(),
        subject: $('#subject').val(),
        message: $('#feedback').val(),
      },
      function (data) {
        console.log(data);
      }
    );
    alert('Your feedback has been sent!');
  }
});
