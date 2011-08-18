Shammes::Application.routes.draw do
  root :to => "hit#index"
  get "hit/index"
  get "hit/push"
end
