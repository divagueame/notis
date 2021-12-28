Rails.application.routes.draw do
  root "application#index"

  get 'crawl', action: :crawl, controller: 'newspapers'
  resources :newspapers do
    resources :articles
  end
end
