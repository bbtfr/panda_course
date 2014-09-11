Rails.application.routes.draw do

  namespace :admin do
    resources :registrations
    root to: "registrations#index"    
  end

  scope "/:locale", locale: /en|zh-CN/ do
    resource :registration, only: [ :new, :edit, :create, :update ]
    get "/:id" => "high_voltage/pages#show", :as => :page, :format => false
  end

  root to: redirect("/en/index")

end
