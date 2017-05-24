Rails.application.routes.draw do
  get 'taxis/get_nearest'
  get 'taxis/end_ride'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
