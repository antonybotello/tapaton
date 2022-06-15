$(document).ready(function()
	{
	$("#modal-status").ready(function () {
        
	    //saco el valor accediendo a un input de tipo text y name = nombre
	    var status=$('input:hidden[name=modal-status]').val();
        if(status=='t'){
            var myModal = new bootstrap.Modal(document.getElementById('mainModal'));
            myModal.show();
            
	    //saco el valor accediendo a un input de tipo text y name = nombre
        }
	

	});
});