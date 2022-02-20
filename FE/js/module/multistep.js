// Chuyển các step khi ấn next hoặc previous
export function multiStep() {
  const nextBtns = Array.from(document.querySelectorAll('.btn-next'));
  const prevBtns = Array.from(document.querySelectorAll('.btn-prev'));
  const progressStep = document.querySelectorAll('.step');
  prevBtns.forEach((prevBtn, i) => {
    prevBtn.addEventListener('click', (e) => {
      let currentStep = e.target.parentElement.parentElement;
      let prevStep = currentStep.previousElementSibling;
      currentStep.style.left = 'calc(100% + 30px)';
      currentStep.style.right = '-100%';
      prevStep.style.left = '0';
      prevStep.style.right = '0';
      progressStep[i].classList.remove('active');
    });
  });

  nextBtns.forEach((nextBtn, i) => {
    nextBtn.addEventListener('click', (e) => {
      // Kiểm tra người dùng đã chọn method hay chưa
      let currentStep = e.target.parentElement.parentElement;
      let inputRadio = Array.from(
        currentStep.querySelectorAll('input[type="radio"]')
      );
      let smallTag = currentStep.querySelector('small');
      if (inputRadio.length !== 0) {
        if (!inputRadio.every((input) => input.checked)) {
          smallTag.innerText = 'Please choose one of these methods below!';
          smallTag.style.color = 'red';
        }

        if (inputRadio.some((input) => input.checked)) {
          smallTag.innerText = '';
          nextStep(e, progressStep, i);
        }
      } else {
        nextStep(e, progressStep, i);
      }
    });
  });
}

// Chuyển sang step tiếp theo khi ấn next
export function nextStep(e, pgstep, i = -1) {
  let currentStep = e.target.parentElement.parentElement;
  let nextStep = currentStep.nextElementSibling;
  // console.log(nextStep)
  currentStep.style.left = '-100%';
  currentStep.style.right = 'calc(100% + 30px)';
  nextStep.style.left = '0';
  nextStep.style.right = '0';
  let j = i + 1;
  pgstep[j].classList.add('active');
}
