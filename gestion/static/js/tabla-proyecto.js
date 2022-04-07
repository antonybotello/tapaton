$(document).ready(function() {
    $('#proyectos').DataTable({
       
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros por página",
            "zeroRecords": "No se encontro registro",
            "info": "Mostrando página _PAGE_ de _PAGES_",
            "infoEmpty": "No hay registros disponibles",
            "search": "Buscar: ",
            "infoFiltered": "(filtrado de _MAX_ registros totales)",
            "paginate": {
                "next": "Siguiente",
                "previous": "Anterior"
              }
        }
    });
} );