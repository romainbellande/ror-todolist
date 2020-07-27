Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  get '/api' => redirect('/api/v1/api-docs.json')

  namespace :v1 do
    resources :boards do
      resources :todos
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
