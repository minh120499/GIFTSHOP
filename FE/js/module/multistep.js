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
      progressStep[i].classList.remove('active');
    });
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
    });
  }
}
