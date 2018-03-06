Rails.application.routes.draw do
  devise_for :users
  resources :comments   # Con esto accedemos a todas las rutas del controlador, sin tener que indicarlas aquí una por una
  resources :posts   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
end
