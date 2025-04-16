// Obtener elementos del DOM
const menuItems = document.querySelectorAll('.menu-item');

// Función para mostrar detalles del plato al pasar el cursor
function showDetails() {
  const details = this.querySelector('.menu-details');
  details.classList.add('visible');
}

// Función para ocultar detalles del plato al quitar el cursor
function hideDetails() {
  const details = this.querySelector('.menu-details');
  details.classList.remove('visible');
}

// Agregar eventos a los elementos del menú
menuItems.forEach(item => {
  item.addEventListener('mouseover', showDetails);
  item.addEventListener('mouseout', hideDetails);
});