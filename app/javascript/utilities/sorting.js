document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.sort-by-title')

    if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
    let table = document.querySelector('table')

    let sortedRows = Array.from(table.rows).slice(1)

    let arrowUp = this.querySelector('.octicon-arrow-up')
    let arrowDown = this.querySelector('.octicon-arrow-down')

    if (arrowUp.classList.contains('hide')) {
        sortRows(sortedRows, 1)

        arrowUp.classList.remove('hide')
        arrowDown.classList.add('hide')
    } else {
        sortRows(sortedRows, -1)

        arrowDown.classList.remove('hide')
        arrowUp.classList.add('hide')
    }

    table.tBodies[0].append(...sortedRows);
}

function sortRows(rows, type) {
    rows.sort(function (row1, row2) {
        let testTitle1 = row1.cells[0].textContent
        let testTitle2 = row2.cells[0].textContent

        if (testTitle1 < testTitle2) {
            return 1 * type
        } else if (testTitle1 > testTitle2) {
            return -1 * type
        } else {
            return 0
        }
    })
}
