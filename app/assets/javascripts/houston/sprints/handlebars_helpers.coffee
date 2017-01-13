Handlebars.registerPartial 'sprintTask', (task)->
  HandlebarsTemplates['sprints/task'](task)

Handlebars.registerHelper 'renderTaskStatus', (task)->
  if task.released
    '<i class="fa fa-paper-plane"></i> Released'
  else if task.committed
    '<span class="octicon octicon-git-commit"></span> Committed'
  else if task.completed
    if task.historical then 'Completed' else '<a class="complete-task-button"></a> Completed'
  else
    if task.historical then 'Open' else '<a class="complete-task-button"></a> Open'
