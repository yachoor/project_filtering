# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/auto_complete/projects', :to => 'auto_completes#projects', :as => 'auto_complete_projects'
