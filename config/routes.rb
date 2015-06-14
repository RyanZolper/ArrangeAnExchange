Rails.application.routes.draw do


  ActiveAdmin.routes(self)

  #users

  get 'users/welcome'
  get 'users/check_email'
  get 'users/login'
  get 'users/logout'
  get 'users/firstloginpage'
  get 'users/mysaves'
  get 'users/changepwdpage'
  get 'users/account'
  get 'users/updatepage'
  root 'users#firsts'
  get 'users/thanks'

  patch 'users/changepwd'
  post 'users/savefam'
  post 'users/unsavefam'
  post 'users/login'
  post 'users/logout'
  post 'users/firstlogin'
  post 'users/connect'
  post 'users/host_review'
  post 'users/create'
  patch 'users/update'

  #fams

  get 'families/setup'
  get 'families/home'
  get 'showfam/:id' => 'families#showfam', as: 'showfam'
  get 'families/myfam'
  get 'families/updatepage'

  post 'families/create'
  patch 'families/update'
  patch 'families/show'
  patch 'families/hide'


  #travs

  get 'travelers/setup'
  get 'showtrav/:id' => 'travelers#showtrav', as: 'showtrav'
  get 'travelers/mytrav'
  get 'travelers/updatepage/:id' => 'travelers#updatepage', as: 'updatetrav'

  post 'travelers/create'
  patch 'travelers/update/:id' => 'travelers#update', as: 'update'

  #fam_attachments

  post 'fam_attachments/create'







  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
