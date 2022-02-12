export function counter () {
    const plusBtns = document.querySelectorAll('.plus');
    const minusBtns = document.querySelectorAll('.minus');
    const quantities = document.querySelectorAll('.quantity');
    for (let i = 0; i < plusBtns.length; i++) {
        const plusBtn = plusBtns[i];
        const minusBtn = minusBtns[i];
        const quantityInput = quantities[i];
        plusBtn.addEventListener('click', (e) => {
            let quantity = e.target.previousElementSibling;
            let newValue = parseInt(quantity.value) + 1;
            quantity.value = newValue;
            updateCart();
        })
        minusBtn.addEventListener('click', (e) => {
            let quantity = e.target.nextElementSibling;
            let newValue = parseInt(quantity.value) - 1;
            if (newValue > 0) {
                quantity.value = newValue;
            }
            updateCart();
        })
        quantityInput.addEventListener('input', (e) => {
            e.target.value;
            updateCart();
        })
    }
}

export function delProduct () {
    const delBtns = document.querySelectorAll('.delbtn');
    for (let i = 0; i < delBtns.length; i++) {
        const delBtn = delBtns[i];
        delBtn.addEventListener('click', (e) => {
            e.target.parentElement.parentElement.remove();
            updateCart();
        })
    }
}

export function updateCart() {
    const cartContainer = document.querySelector('.cart-items');
    const cartItemsList = cartContainer.querySelectorAll('.cart-item');
    let subTotal = 0;
    let total = 0;
    for (let i = 0; i < cartItemsList.length; i++) {
        const cartItem = cartItemsList[i];
        let price = cartItem.querySelector('.item-price span');
        let quantity = cartItem.querySelector('.quantity');
        price = parseFloat(price.innerText.replace('$ ',''));
        quantity = parseInt(quantity.value);
        subTotal += (price * quantity);
    }
    
    document.querySelector('.subtotal span').innerText = `$ ${subTotal}`;
    document.querySelector('.total span').innerText = `$ ${subTotal}`;

    //delivery
    const carryOut = document.querySelector('.carryout');
    const standardDeli = document.querySelector('.standard');
    let deliPrice = document.querySelector('.deli span');
    carryOut.addEventListener('click', () => {
        deliPrice.innerText = '$ 0';
        total = subTotal + 0;
        document.querySelector('.total span').innerText = `$ ${total}`;
    })
    standardDeli.addEventListener('click', () => {
        deliPrice.innerText = '$ 3';
        total = subTotal + 3;
        document.querySelector('.total span').innerText = `$ ${total}`;
    })
}

export function multiStep() {
    const nextBtns = document.querySelectorAll('.btn-next');
    const prevBtns = document.querySelectorAll('.btn-prev');
    const progressStep = document.querySelectorAll('.step');
    for (let i = 0; i < prevBtns.length; i++) {
        const prevBtn = prevBtns[i];
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
    for (let i = 0; i < nextBtns.length; i++) {
        const nextBtn = nextBtns[i];
        nextBtn.addEventListener('click', (e) => {
            let currentStep = e.target.parentElement.parentElement;
            let nextStep = currentStep.nextElementSibling;
            // console.log(nextStep)
            currentStep.style.left = '-100%';
            currentStep.style.right = 'calc(100% + 30px)';
            nextStep.style.left = '0';
            nextStep.style.right = '0';
            let j = i + 1;
            progressStep[j].classList.add('active');
        })
    }
}

