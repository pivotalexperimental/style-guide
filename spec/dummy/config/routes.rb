Rails.application.routes.draw do
  root :to => redirect("/style-guide")
  mount StyleGuide::Engine => "/style-guide"
end
