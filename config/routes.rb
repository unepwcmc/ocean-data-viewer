OceanDataViewer::Application.routes.draw do

  root 'datasets#index'

  match '/about', :to => "static_contents#about", via: 'get'
  match '/geo_proxy', :to => "proxy#geo_proxy", via: 'get'

  resources :datasets, :only => [:index, :show], :has_many => :customers
  resources :licences, :only => :show

  resources :map_search, only: [:index, :show]

  namespace :admin do
    match '/', :to => "datasets#index", via: 'get'
    resources :customers
    resources :licences
    resources :categories
    resources :data_categories
    resources :datasets_decisions

    resources :datasets do
      resources :datasets_decisions
    end

    resources :decisions do
      resources :categories
    end

    resources :site_links

    match 'datasets_decision/categories_for_decision/:id', :to => "datasets_decisions#categories_for_decision", via: 'get'
  end

  resources :site_links
  resources :decisions
end
