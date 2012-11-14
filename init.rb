ActionDispatch::Callbacks.to_prepare do
    require_dependency 'project_filtering/projects_controller_patch'
end

Redmine::Plugin.register :project_filtering do
  name 'Project Filtering plugin'
  author 'Janusz Chorko'
  description 'This plugin enables quick filtering on projects page'
  version '0.0.1'
end
