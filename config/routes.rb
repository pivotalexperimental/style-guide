StyleGuide::Engine.routes.draw do
  root :to => "style#index"
  match "/style/:id" => "style#show", :as => :style
end
