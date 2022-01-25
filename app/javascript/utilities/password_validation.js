document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.password-validation')

    if (control) {
        control.parentNode.querySelector('input[type="submit"]').disabled = true
        control.addEventListener('input', validatePassword)
    }
})

function validatePassword() {
    const password = this.querySelector('#user_password')
    const passwordConfirmation = this.querySelector('#user_password_confirmation')

    let match = this.querySelector('.octicon-check')
    let mismatch = this.querySelector('.octicon-x')
    let submitButton = this.parentNode.querySelector('input[type="submit"]')

    if (password.value === "" || passwordConfirmation.value === "") {
        match.classList.add('hide')
        mismatch.classList.add('hide')
        submitButton.disabled = true
    } else if (password.value === passwordConfirmation.value) {
        match.classList.remove('hide')
        mismatch.classList.add('hide')
        submitButton.disabled = false
    } else {
        mismatch.classList.remove('hide')
        match.classList.add('hide')
        submitButton.disabled = true
    }
}
