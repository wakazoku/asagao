Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as:"about"
  get "bad_request" => "top#bad_request"
  get "internal_server_error" => "top#internal_server_error"
  get "lesson/:action(/:name)" => "lesson"

  # membersモデルをリソースとして扱う。
  # collectionとしてsearchメソッドを使う
  resources :members do
  	collection { get "search" }
  end
  resources :articles
  resource :session, only: [:create, :destroy]
  resource :account #設定されていないパスは全てnot_foundアクションを使う
  match "*anything" => "top#not_found", via: [:get, :post, :patch, :delete]
end
