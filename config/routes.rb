Rails.application.routes.draw do
  resources :contacts do
    collection do
      get :contact_list
      post :search
    end
  end

  root "contacts#contact_list"
end
