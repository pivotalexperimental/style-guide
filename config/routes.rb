StyleGuide::Engine.routes.draw do
  root :to => "style#index"
  match "/:id" => "style#show", :as => :style
end
