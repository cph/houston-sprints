module Houston
  module Sprints
    module Task
      extend ActiveSupport::Concern

      included do
        has_and_belongs_to_many :sprints, extend: UniqueAdd
      end


      module ClassMethods
        def completed_during(sprint)
          where(arel_table[:completed_at].in(sprint.range).or(arel_table[:first_commit_at].in(sprint.range)))
        end

        def checked_out_by(user, during: nil)
          raise ArgumentError, "Please specify :during which Sprint" unless during
          all.merge(SprintTask.where(sprint_id: during.id))
        end
      end


      def completed_during?(sprint)
        return false unless completed?
        completed_at < sprint.ends_at
      end

      def checked_out?(sprint)
        SprintTask.where(sprint_id: sprint.id, task_id: id).checked_out.exists?
      end

      def checked_out_by_me?(sprint, user)
        SprintTask.where(sprint_id: sprint.id, task_id: id).checked_out_by(user).exists?
      end

      def check_out!(sprint, user)
        SprintTask.where(sprint_id: sprint.id, task_id: id).check_out!(user)
      end

      def check_in!(sprint)
        SprintTask.where(sprint_id: sprint.id, task_id: id).check_in!
      end

    end
  end
end
