# == Route Map
#
#                    Prefix Verb URI Pattern                                                                              Controller#Action
#        rails_service_blob GET  /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET  /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  #devise_for :users

  devise_for :users, controllers: { omniauth_callbacks: "auth/omniauth_callbacks"},
              path: '', path_names: { sign_in: 'login',
                                      sign_out: 'logout',
                                      sign_up: 'register' }

  authenticated :user do
    root to: "home#index"
  end

  root to: "main#index", as: nil
  resources :main, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
