Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create]
    end
  end
end
