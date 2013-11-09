Tldrnyt::Application.routes.draw do
  get "recent", to: "articles#recent"
  resources :articles, only: [:index]
  root to: 'articles#index_template'
end
