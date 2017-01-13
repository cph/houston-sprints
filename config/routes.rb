Houston::Sprints::Engine.routes.draw do

  namespace "api" do
    namespace "v1" do
      get "sprint/tasks", to: "sprint_tasks#index"
      get "sprint/tasks/mine", to: "sprint_tasks#mine"
      post "sprint/tasks/:project_slug/:shorthand", to: "sprint_tasks#create"
      delete "sprint/tasks/:project_slug/:shorthand", to: "sprint_tasks#destroy"
    end
  end

  get "sprints/current", to: "sprints#current", :as => :current_sprint
  get "sprints/:id", to: "sprints#show", constraints: {id: /\d+/}, :as => :sprint
  get "sprints/:id/dashboard", to: "sprints#dashboard", constraints: {id: /\d+/}
  get "sprints/dashboard", to: "sprints#dashboard", :as => :sprint_dashboard
  put "sprints/:id/lock", to: "sprints#lock", constraints: {id: /\d+/}

  constraints id: /\d+/, task_id: /\d+/ do
    post "sprints/:id/tasks/:task_id", to: "sprints#add_task"
    delete "sprints/:id/tasks/:task_id", to: "sprints#remove_task"
    post "sprints/:id/tasks/:task_id/lock", to: "sprint_task_locks#create"
    delete "sprints/:id/tasks/:task_id/lock", to: "sprint_task_locks#destroy"
  end

end
