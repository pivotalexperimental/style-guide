StyleGuide::Engine.routes.draw do
  root :to => "style#index"
  get "/:id" => "style#show", :as => :style
end
