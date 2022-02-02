document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.timer')
    let remainingTime = control?.dataset.remainingTime

    if (control) setInterval(updateTimer, 1000)

    function updateTimer() {
        remainingTime--
        if (remainingTime <= 0) document.querySelector('form').submit()
        else control.innerHTML = `Оставшееся время: ${remainingTime}`
    }
})
