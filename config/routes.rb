Rails.application.routes.draw do
  resources :links, path: '', param: 'short_url', only: [:create, :show]
end
