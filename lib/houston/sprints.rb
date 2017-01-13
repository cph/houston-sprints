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
  #
  #    add_navigation_renderer :sprints do
  #      name "Sprints"
  #      icon "fa-thumbs-up"
  #      path { Houston::Sprints::Engine.routes.url_helpers.sprints_path }
  #      ability { |ability| ability.can? :read, Project }
  #    end


  # Add a link to feature that can be turned on for projects
  #
  #    add_project_feature :sprints do
  #      name "Sprints"
  #      icon "fa-thumbs-up"
  #      path { |project| Houston::Sprints::Engine.routes.url_helpers.project_sprints_path(project) }
  #      ability { |ability, project| ability.can? :read, project }
  #    end

end
