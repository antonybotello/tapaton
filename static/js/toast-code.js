var toastTriggerExito = document.getElementById('liveToastBtnExito')
var toastTriggerError = document.getElementById('liveToastBtnError')
var toastTriggerAlerta = document.getElementById('liveToastBtnAlerta')

var toastLiveExampleExito = document.getElementById('liveToastExito')
var toastLiveExampleError = document.getElementById('liveToastError')
var toastLiveExampleAlerta = document.getElementById('liveToastAlerta')

if (toastTriggerExito) {
    toastTriggerExito.addEventListener('click', function () {
        var toast = new bootstrap.Toast(toastLiveExampleExito)

        toast.show()
    })
}
if (toastTriggerError) {
    toastTriggerError.addEventListener('click', function () {
        var toast = new bootstrap.Toast(toastLiveExampleError)

        toast.show()
    })
}
if (toastTriggerAlerta) {
    toastTriggerAlerta.addEventListener('click', function () {
        var toast = new bootstrap.Toast(toastLiveExampleAlerta)

        toast.show()
    })
}