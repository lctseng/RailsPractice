#encoding:utf-8
Rails.application.routes.draw do

  # 連結到社團群組網頁
  resources :club_groups do
     resources :posts
  end

  #resources :persions

  namespace :admin do 
     resources :events

  end

  resources :events do 
     # 多重事件操作
     collection do
        get :search
     end
     # 單一事件操作
     member do
        get :dashboard
     end
     # 內部巢狀成員
     resources :attendees , :controller => 'event_attendees'
     resource :location , :controller => 'event_locations'
     resource :state , :controller => 'event_states'
  end


  # welcome/say_hello中對應的action
  #get "welcome/say_hello" => "welcome#say"
   
  # welcome根目錄的對應
  #get "welcome" => "welcome#index"

  # 直接對應根目錄
  #root :to => "welcome#index"

  # 自動對應目錄
  #match ':controller(/:action(/:id(.:format)))' , :via => [:get, :post , :patch] 

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
