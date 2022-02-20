export function multiPageItem() {
  const cartItems = Array.from(document.querySelectorAll('.cart-item'));
  const nextPage = document.querySelector('.next');
  const prevPage = document.querySelector('.prev');
  const limitSize = 5;
  let slice = [0, limitSize];

  cartItems
    .slice(0, limitSize)
    .forEach((cartItem) => (cartItem.style.display = 'flex'));
  cartItems
    .slice(limitSize, cartItems.length)
    .forEach((cartItem) => (cartItem.style.display = 'none'));

  nextPage.addEventListener('click', () => {
    if (slice[1] < cartItems.length) {
      slice = slice.map((num) => num + limitSize);
    }
    showSlice(slice);
    window.scrollTo({
      top: 100,
      behavior: 'smooth',
    });
  });

  prevPage.addEventListener('click', () => {
    if (slice[0] > 0) {
      slice = slice.map((num) => num - limitSize);
    }
    showSlice(slice);
    window.scrollTo({
      top: 100,
      behavior: 'smooth',
    });
  });

  function showSlice(slice) {
    cartItems.forEach((cartItem) => (cartItem.style.display = 'none'));
    cartItems
      .slice(slice[0], slice[1])
      .forEach((cartItem) => (cartItem.style.display = 'flex'));
  }
}
