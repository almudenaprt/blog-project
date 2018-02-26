Rails.application.routes.draw do
  resources :posts   # Con esto accedemos a todas las rutas del controlador, sin tener que indicarlas aquí una por una
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
