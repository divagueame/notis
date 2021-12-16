Rails.application.routes.draw do
  root "articles#show"
  get 'crawl', action: :crawl, controller: 'newspapers'
  resources :newspapers do

    resources :articles
  end
end
