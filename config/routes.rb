Shammes::Application.routes.draw do
  resources :hits, :only => [:index]
  resources :page_views, :only => [:index]
  get "/hit/push" => HitTracker.action(:push)
  root :to => "hits#index"
end
