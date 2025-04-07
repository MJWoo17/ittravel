$(document).ready(function() {
  const divwrap8s = document.querySelectorAll('.divwrap8');
  divwrap8s.forEach(function(divwrap8) {
    divwrap8.addEventListener('click', function() {
      this.classList.toggle('clicked1');
      const divwrap11 = this.querySelector('.divwrap11');
      if (divwrap11) {
        divwrap11.classList.toggle('white-text');
      }
    });
  });
}); 