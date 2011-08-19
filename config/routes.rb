Shammes::Application.routes.draw do
  resources :hits, :only => [:index] do
    get "push", :on => :member
  end
  root :to => "hits#index"
end
