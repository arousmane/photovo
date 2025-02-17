Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'inverter_records#index'

  resource :inverter_records, only: %i(:index) do
    collection do
      post :import
    end
  end
end
