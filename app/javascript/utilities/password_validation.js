document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.password-validation')
    const password = control.querySelector('#user_password')
    const passwordConfirmation = control.querySelector('#user_password_confirmation')

    let submitButton = control.parentNode.querySelector('input[type="submit"]')
    let matchIcon = control.querySelector('.octicon-check')
    let mismatchIcon = control.querySelector('.octicon-x')

    if (control) {
        submitButton.disabled = true
        control.addEventListener('input', validatePassword)
    }

    function validatePassword() {
        if (password.value === "" || passwordConfirmation.value === "") {
            matchIcon.classList.add('hide')
            mismatchIcon.classList.add('hide')
            submitButton.disabled = true
        } else if (password.value === passwordConfirmation.value) {
            matchIcon.classList.remove('hide')
            mismatchIcon.classList.add('hide')
            submitButton.disabled = false
        } else {
            mismatchIcon.classList.remove('hide')
            matchIcon.classList.add('hide')
            submitButton.disabled = true
        }
    }
})
