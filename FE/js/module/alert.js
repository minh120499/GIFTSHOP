export function alert(e) {
  document.querySelector('##alert-all-message').textContent = e;
  document.querySelector('##alert-all-message').style.animation = 'showup';
}
