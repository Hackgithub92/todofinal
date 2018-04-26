Rails.application.routes.draw do
    resources :users do
        resources :lists
    end
end
