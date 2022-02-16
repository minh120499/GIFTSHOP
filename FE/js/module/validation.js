export function sanitizeValue(selector) {
    let inputElement = document.querySelector(selector);
    const regexSanitization = /^[^a-zA-Z0-9]/g;
    inputElement.addEventListener('input', () => {
        inputElement.value = inputElement.value.replace(regexSanitization,'');
    })
}

function showError(selector, message) {
    let inputElement = document.querySelector(selector);
    let smallTag = inputElement.parentElement.querySelector('small');
    smallTag.innerText = message;
    if (smallTag.parentElement.classList.value.includes('valid')) {
    smallTag.parentElement.classList.replace('valid','invalid')
    } else {
    smallTag.parentElement.classList.add('invalid')
    }
}

function hideError(selector) {
    let inputElement = document.querySelector(selector);
    let smallTag = inputElement.parentElement.querySelector('small');
    smallTag.innerText = '';
    if (smallTag.parentElement.classList.value.includes('invalid')) {
    smallTag.parentElement.classList.replace('invalid','valid')
    } else {
    smallTag.parentElement.classList.add('valid')
    }
}

export function uppercase (selector) {
    let inputElement = document.querySelector(selector);
    inputElement.addEventListener('input', () => {
        inputElement.value = inputElement.value.toUpperCase();
    })
}

export function checkRequired(selector, message) {
    let inputElement = document.querySelector(selector);
        if (!inputElement.value) {
            showError(selector, message);
        } else {
            hideError(selector);
        }
        inputElement.addEventListener('input', () => {
            hideError(selector);
        }) 
    }

export function checkEmail(selector, message1, message2) {
    let inputElement = document.querySelector(selector);
    const regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/g;
        if (!inputElement.value) {
            showError(selector, message1);
        } else if (!regexEmail.test(inputElement.value)) {
            showError(selector, message2);
        } else {
            hideError(selector);
        }
        inputElement.addEventListener('input', () => {
            hideError(selector);
        })
    }

export function checkPhoneNumber(selector, message1, message2) {
    let inputElement = document.querySelector(selector);
    const regexPhone = /^\d{10}$/g;
    if (!inputElement.value) {
        showError(selector, message1);
    } else if (!regexPhone.test(inputElement.value)) {
        showError(selector, message2);
    } else {
        hideError(selector);
    }
    inputElement.addEventListener('input', () => {
        hideError(selector);
    })
}

export function onBlur (selector, message) {
    let inputElement = document.querySelector(selector);
    inputElement.addEventListener('blur', () => {
        checkRequired(selector, message);
    }) 
}

export function onBlurEmail (selector, message1, message2) {
    let inputElement = document.querySelector(selector);
    inputElement.addEventListener('blur', () => {
        checkEmail(selector, message1, message2)
    })
}