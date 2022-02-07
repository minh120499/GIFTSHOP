export function counter () {
    const plusBtns = document.querySelectorAll('.plus');
    const minusBtns = document.querySelectorAll('.minus');
    for (let i = 0; i < plusBtns.length; i++) {
        const plusBtn = plusBtns[i];
        const minusBtn = minusBtns[i];
        plusBtn.addEventListener('click', (e) => {
            let quantity = e.target.parentElement.querySelector('.quantity')
            let newValue = parseInt(quantity.value) + 1;
            quantity.value = newValue;
            updateCart();
        })
        minusBtn.addEventListener('click', (e) => {
            let quantity = e.target.parentElement.querySelector('.quantity')
            let newValue = parseInt(quantity.value) - 1;
            if (newValue > 0) {
                quantity.value = newValue;
            }
            updateCart();
        })
    }
}

export function delProduct () {
    const delBtns = document.querySelectorAll('.delbtn');
    for (let i = 0; i < delBtns.length; i++) {
        const delBtn = delBtns[i];
        delBtn.addEventListener('click', (e) => e.target.parentElement.parentElement.remove())
    }
    updateCart();
}

function updateCart() {
    const cartContainer = document.querySelector('.cart-items');
    const cartItemsList = cartContainer.querySelectorAll('.cart-item');
    let subTotal = 0;
    for (let i = 0; i < cartItemsList.length; i++) {
        const cartItem = cartItemsList[i];
        let priceItem = cartItem.querySelector('.item-price span');
        let quantityItem = cartItem.querySelector('.quantity');
        let price = parseFloat(priceItem.innerText.replace('$ ',''));
        let quantity = parseInt(quantityItem.value);
        subTotal += (price * quantity);
    }
    document.querySelector('.subtotal span').innerText = `$ ${subTotal}`;
}

export function multiStep() {
    const nextBtns = document.querySelectorAll('.btn-next');
    const prevBtns = document.querySelectorAll('.btn-prev');
    const progressStep = document.querySelectorAll('.step');
    for (let i = 0; i < nextBtns.length; i++) {
        const nextBtn = nextBtns[i];
        const prevBtn = prevBtns[i];
        nextBtn.addEventListener('click', (e) => {
            let currentStep = e.target.parentElement.parentElement;
            let nextStep = currentStep.nextElementSibling;
            // console.log(nextStep)
            currentStep.style.left = '-100%';
            currentStep.style.right = 'calc(100% + 30px)';
            nextStep.style.left = '0';
            nextStep.style.right = '0';
            progressStep[i].classList.add('active')
        })
        prevBtn.addEventListener('click', (e) => {
            let currentStep = e.target.parentElement.parentElement;
            let prevStep = currentStep.previousElementSibling;
            // console.log(prevStep)
            currentStep.style.left = 'calc(100% + 30px)';
            currentStep.style.right = '-100%';
            prevStep.style.left = '0';
            prevStep.style.right = '0';
            progressStep[i].classList.remove('active')
        })
    }
}