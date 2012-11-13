Rails.application.routes.draw do
  root :to => "home#index"
  mount StyleGuide::Engine => "/style-guide"
end
