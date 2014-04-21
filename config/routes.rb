SeatYourself::Application.routes.draw do
  resources :restaurants do
    resources :reservations
  end

  resources :users do
    resources :reservations
  end

  resources :sessions, :only => [:new, :create, :destroy]

end
