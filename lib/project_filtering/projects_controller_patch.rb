require_dependency 'auto_completes_controller'

module ProjectFiltering
  module AutoCompletesControllerPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable
        helper :projects
        include ProjectsHelper
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def projects
        q = params[:q].to_s.strip
        if q.present?
          @projects = Project.active.visible.like(q).order('lft')
        else
          @projects = Project.active.visible
        end
        render :layout => false
      end
    end
  end
end

# Guards against including the module multiple time (like in tests)
# and registering multiple callbacks
unless AutoCompletesController.included_modules.include? ProjectFiltering::AutoCompletesControllerPatch
  AutoCompletesController.send(:include, ProjectFiltering::AutoCompletesControllerPatch)
end  

