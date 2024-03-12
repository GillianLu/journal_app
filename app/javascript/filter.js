 document.addEventListener('DOMContentLoaded', () => {
    const filterButtons = document.querySelectorAll('.filter-button');
    const taskGroups = document.querySelectorAll('.task-group');

    filterButtons.forEach(button => {
      button.addEventListener('click', (event) => {
        event.preventDefault(); // Prevent the link from navigating.
        const filter = button.getAttribute('data-filter');

        // Hide all task groups initially.
        taskGroups.forEach(group => {
          group.style.display = 'none';
        });

        // Show the selected task group.
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