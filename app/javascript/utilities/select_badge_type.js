document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.select-type-of-badge')
    const badgeType = document.querySelector('#badge_badge_type')
    const inputAddition = document.querySelector('.input-addition')

    if (control) {
        control.addEventListener('change', ChangeForm)
    }

    function ChangeForm() {
        switch (badgeType.value) {
            case '':
            case 'first_attempt':
                inputAddition.classList.add('hide')
                break
            default:
                inputAddition.classList.remove('hide')
        }
    }
})
