Rails.application.routes.draw do
  resources :links, path: '', param: 'short_url', only: %i[create show]
end
