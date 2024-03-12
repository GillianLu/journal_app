document.addEventListener("DOMContentLoaded", function () {
    const sidebarToggle = document.getElementById('sidebarToggle');
    const mySidebar = document.getElementById('mySidebar');
    const body = document.body;

    sidebarToggle.addEventListener('click', function (event) {
        event.preventDefault();
        const isOpen = mySidebar.style.width === '250px';

        if (isOpen) {
            mySidebar.style.width = '0';
            body.classList.remove('sidebar-open');
            body.classList.remove('open');
            body.classList.remove('open-form');
        }
        else {
            mySidebar.style.width = '250px';
            body.classList.add('sidebar-open');
            body.classList.add('open');
            body.classList.add('open-form');
        }
        
    });
    
});