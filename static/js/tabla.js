$(document).ready(function () {
    $('#tabla').DataTable({
        dom: 'Bfrtip',
        rowReorder: {
            selector: 'td:nth-child(2)'
        },
        responsive: true,

        buttons: [{
            extend: 'excel',
            text: '<i class="fa-solid fa-file-excel"></i>',
        },
        {
            extend: 'pdf',
            text: '<i class="fa-solid fa-file-pdf"></i>',
            exportOptions: {
                columns: ':not(:last-child)'
            }
        },
        {
            extend: 'print',
            text: '<i class="fa-solid fa-print"></i>',
            exportOptions: {
                columns: ':not(:last-child)'
            }
        },


        ],
        "bDestroy": true,
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
});