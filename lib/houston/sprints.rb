require "houston/sprints/engine"
require "houston/sprints/configuration"

module Houston
  module Sprints
    extend self

    def config(&block)
      @configuration ||= Sprints::Configuration.new
      @configuration.instance_eval(&block) if block_given?
      @configuration
    end

  end


  # Extension Points
  # ===========================================================================
  #
  # Read more about extending Houston at:
  # https://github.com/houston/houston-core/wiki/Modules


  # Register events that will be raised by this module
  #
  #    register_events {{
  #      "sprints:create" => params("sprints").desc("Sprints was created"),
  #      "sprints:update" => params("sprints").desc("Sprints was updated")
  #    }}


  # Add a link to Houston's global navigation
  Houston.add_navigation_renderer :sprint do
    name "Sprint"
    path { Houston::Sprints::Engine.routes.url_helpers.current_sprint_path }
    ability { |ability| ability.can?(:read, Sprint) }
  end

end
