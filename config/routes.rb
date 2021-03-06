Tldrnyt::Application.routes.draw do
  get "recent", to: "articles#recent"
  get "update", to: "articles#get_recent"
  resources :articles, only: [:index]

  get 'partials/*partial' => 'partials#partial'

  get '/*path', to: 'articles#index_template'
  root to: 'articles#index_template'
end
