Shammes::Application.routes.draw do
  resources :hits, :only => [:index]
  get "/hit/push" => "hits#push"
  root :to => "hits#index"
end
