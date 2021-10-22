Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:new, :create, :index, :show] do
    # collection do
      # get :top
    # end

    # member do
    #  get :chef
    # end

  #   # NESTING:
  #   # /restaurants/:restaurant_id/reviews
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end
