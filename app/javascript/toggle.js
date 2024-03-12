// app/javascript/toggle.js

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll('.toggle-completion').forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      const taskId = this.dataset.taskId;
      const taskRow = document.getElementById(`task_${taskId}`);
      taskRow.classList.toggle('completed');
    });
  });
});
