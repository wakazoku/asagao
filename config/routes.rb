Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as:"about"
  get "lesson/:action(/:name)" => "lesson"

  # membersモデルをリソースとして扱う。
  # collectionとしてsearchメソッドを使う
  resources :members do
  	collection { get "search" }
  end
  resources :articles
  resource :session, only: [:create, :destroy]
  # accountモデルをリソースとして扱うのは後述のコントローラに記載されているメソッドのみ
  resource :account, only: [:show, :edit, :update]
end
