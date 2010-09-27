ActionController::Routing::Routes.draw do |map|

  map.root :controller => :datasets, :action => :index
  map.about '/about', :controller => "static_contents", :action => "about"
  map.contact '/contact', :controller => "static_contents", :action => "contact"
  map.business '/business', :controller => "static_contents", :action => "business"
  map.geo_proxy '/geo_proxy', :controller => "proxy", :action => "geo_proxy"
  
  map.resources :datasets, :only => [:index, :show], :has_many => :customers
  map.resources :licences, :only => :show
  
  map.namespace(:admin) do |admin| 
    admin.root :controller => "datasets", :action => "index"
    admin.resources :customers
    admin.resources :licences
    admin.resources :categories
    admin.resources :datasets_decisions

    admin.resources :datasets do |dataset|
      dataset.resources :datasets_decisions
    end

    admin.resources :decisions do |decision|
      decision.resources :categories
    end
    admin.resources :site_links
    
    admin.species_for_genus 'datasets_decision/categories_for_decision/:id', :controller => :datasets_decisions, :action => :categories_for_decision
  end

  map.resources :site_links
  map.resources :decisions

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
