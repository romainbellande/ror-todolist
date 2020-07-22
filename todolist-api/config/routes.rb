Rails.application.routes.draw do
  get '/api' => redirect('/api/v1/api-docs.json')
  namespace :api do
    namespace :v1 do
      resources :boards do
        resources :todos
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
