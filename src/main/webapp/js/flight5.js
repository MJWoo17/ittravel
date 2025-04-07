$(document).ready(function() {
  const divwrap4_2s = document.querySelectorAll('.divwrap4_2');
  divwrap4_2s.forEach(function(divwrap4_2) {
    divwrap4_2.addEventListener('click', function() {
      this.classList.toggle('clicked1');
      if (this.classList.contains('clicked1')) {
        this.innerHTML = '<span>1</span>';
      } else {
        this.innerHTML = '';
      }
    });
  });
}); 