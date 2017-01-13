require "houston/sprints/task"

module Houston
  module Sprints
    class Railtie < ::Rails::Railtie

      # The block you pass to this method will run for every request
      # in development mode, but only once in production.
      config.to_prepare do
        ::Task.send(:include, Houston::Sprints::Task)
      end

    end
  end
end
