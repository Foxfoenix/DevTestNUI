window.addEventListener("load", (event) => {
    const container = document.querySelector('.container')
    container.style.visibility = 'hidden';

    window.addEventListener("message", (event) => {
        let data = event.data
        if (data.action == 'open') {
            container.style.visibility = 'visible';
        }else if (data.action == 'close') {
            container.style.visibility = 'hidden';
        }
    })

    window.addEventListener("keydown", (event) =>{
        if (event.key === 'Escape') {fetch('https://DVTNUI/closeall')}
    })

    document.querySelector('#cExit').addEventListener('click', (event) => {
        fetch('https://DVTNUI/ExitVehicle')
    })
})

