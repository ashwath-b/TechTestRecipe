Rails.application.routes.draw do
  resources :categories, only: :index, param: :name do
    resources :recipes, only: [:index]
  end

  get 'recipes/:id', to: 'recipes#show'
end
