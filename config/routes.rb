Rails.application.routes.draw do
  devise_for :users, skip: 'sessions', controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  devise_scope :user do
    get	'/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post	'/users/sign_in', to: 'users/sessions#create', as: :user_session
    get	'/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # ユーザープロフィール画面(利用登録orログイン後遷移ページ)
  get '/user_profile/:id', to: 'user_profiles/index#index', as: :user_profiles

  # ユーザープロフィール編集画面
  get '/user_profile/:id/edit', to: 'user_profiles/edit/index#index', as: :user_profiles_edit

  # ユーザープロフィール更新
  patch '/user_profile/:id/edit/submit', to: 'user_profiles/edit/index#submit', as: :user_profiles_edit_submit

  # タイムライン
  get '/timelines', to: 'user_profiles/index#get_timelines', as: :user_profiles_timelines

  # ノウハウ検索
  get '/search', to: 'knowhows/search/index#search', as: :knowhows_search

  # ユーザーリスト
  get '/users', to: 'user_lists/index#index', as: :user_lists

  # ノウハウ新規登録画面
  get 'knowhow/create', to: 'knowhows/create/index#create', as: 'knowhows_create'

  # ノウハウ新規登録
  post 'knowhow/submit', to: 'knowhows/create/index#submit', as: 'knowhows_submit'

  # 相手をフォロー
  post '/follow', to: 'follows/create/index#submit', as: :follows_submit

  # フォローを外す
  post '/unfollow', to: 'follows/delete/index#delete', as: :follows_delete
end
