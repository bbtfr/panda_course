Rails.application.routes.draw do

  scope "/:locale", locale: /en|zh-CN/ do
    get "/:id" => "high_voltage/pages#show", :as => :page, :format => false
  end

  root to: redirect("/en/index")

end
