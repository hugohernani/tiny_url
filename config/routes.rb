Rails.application.routes.draw do
  root to: 'home#new'

  resources :links, path: '', param: 'short_url', only: %i[create show]
end
