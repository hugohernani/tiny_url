Rails.application.routes.draw do
  root to: 'home#new'

  resources :links, path: '', param: 'short_url', only: %i[create show] do
    get 'info', to: 'links/statistics#show', on: :member
  end
end
