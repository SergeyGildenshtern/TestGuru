document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.password-validation')
    const password = document.querySelector('#user_password')
    const passwordConfirmation = document.querySelector('#user_password_confirmation')

    let submitButton = document.querySelector('input[type="submit"]')
    let matchIcon = document.querySelector('.octicon-check')
    let mismatchIcon = document.querySelector('.octicon-x')

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
