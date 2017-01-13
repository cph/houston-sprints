require "houston/sprints/railtie"

module Houston
  module Sprints
    class Engine < ::Rails::Engine
      isolate_namespace Houston::Sprints

      # Precompile this modules assets
      initializer :assets do |config|
        Rails.application.config.assets.precompile += %w(
          houston/sprints/application.js
          houston/sprints/application.css )
      end

      # Include the Engine's migrations with the Application
      # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
        end
      end

    end
  end
end
