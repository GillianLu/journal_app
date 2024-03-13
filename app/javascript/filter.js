 document.addEventListener('DOMContentLoaded', () => {
    const filterButtons = document.querySelectorAll('.filter-button');
    const taskGroups = document.querySelectorAll('.task-group');

    filterButtons.forEach(button => {
      button.addEventListener('click', (event) => {
        event.preventDefault(); 
        const filter = button.getAttribute('data-filter');
        taskGroups.forEach(group => {
          group.style.display = 'none';
        });

        
        switch (filter) {
          case 'today':
            document.getElementById('tasks-today').style.display = 'block';
            break;
          case 'tomorrow':
            document.getElementById('tasks-tomorrow').style.display = 'block';
            break;
          case 'this_week':
            document.getElementById('tasks-this-week').style.display = 'block';
            break;
        }
      });
    });
  });