Rails.application.routes.draw do
  devise_for :users
  resources :comments   # Con esto accedemos a todas las rutas del controlador, sin tener que indicarlas aquí una por una
  resources :posts   

  # Ruta para acceder a todos los posts que haya creado un usuario
  get '/:name' => 'posts#user_posts', as: :user_posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
end
