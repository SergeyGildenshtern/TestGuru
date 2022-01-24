document.addEventListener('turbolinks:load', function () {
    let control = document.getElementById('user_password_confirmation')

    if (control) { control.addEventListener('input', validateInput) }
})

function validateInput() {
    let password = document.getElementById('user_password')

    let match = this.parentNode.querySelector('.octicon-check')
    let mismatch = this.parentNode.querySelector('.octicon-x')

    if (this.value === "") {
        match.classList.add('hide')
        mismatch.classList.add('hide')
    } else if (this.value === password.value) {
        match.classList.remove('hide')
        mismatch.classList.add('hide')
    } else {
        mismatch.classList.remove('hide')
        match.classList.add('hide')
    }
}
