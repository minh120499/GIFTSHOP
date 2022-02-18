import { componentHTML } from './module/components.js';
import { header } from './module/header.js';

componentHTML();
function render() {
  return new Promise((resolve) => {
    setTimeout(() => {
      renderAPI();
      resolve();
    }, 1000);
  });
}

// RenderAPI
function renderAPI() {
  $.ajax('http://localhost/BE/AboutUs/AboutUs.php').done(function (data) {
    // console.log($.parseJSON(data)[0].aboutus)
    var html = `<p>${$.parseJSON(data)[0].aboutus}</p>`;
    $('.content').append(html);
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
