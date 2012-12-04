StyleGuide::Engine.routes.draw do
  root :to => "style#index"
  resource :style, :path => '', :only => [:index]
end
