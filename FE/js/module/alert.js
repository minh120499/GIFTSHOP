export function alertMess(message, type = "success") {
    let dom = document.querySelector('#alert-all-message')
    dom.innerHTML = message
    dom.style.animationName = 'showup'
    dom.onclick = () => {
        dom.style.animationName = 'showoff'
    }
    if (type == "success") {
        dom.style.borderColor = '#04aa6d';
        dom.style.color = '#04aa6d';
    } else {
        dom.style.borderColor = '#e60023';
        dom.style.color = '#e60023';
        dom.innerHTML = "Error!"
    }
    setTimeout(() => {
        dom.style.animationName = 'showoff'
    },4000)
}