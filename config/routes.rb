Rails.application.routes.draw do
	root 'order_lines#index'
  resources :order_lines, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
