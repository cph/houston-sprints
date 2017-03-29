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

Handlebars.registerHelper 'renderTaskWorker', (task)->
  if task.checkedOutByMe and !task.historical and task.open
    '<button class="btn btn-danger check-out-button active" data-toggle="button">Check in</button>'
  else if task.checkedOutBy
    Handlebars.helpers.avatar(task.checkedOutBy.email, 24, task.checkedOutBy.firstName) +
     " #{task.checkedOutBy.firstName}"
  else if task.open
    '<button class="btn btn-info check-out-button" data-toggle="button">Check out</button>'
