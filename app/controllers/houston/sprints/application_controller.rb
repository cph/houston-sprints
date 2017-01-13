module Houston::Sprints
  class ApplicationController < ::ApplicationController
    layout "houston/sprints/application"
    helper "houston/sprints/sprint"
  end
end
