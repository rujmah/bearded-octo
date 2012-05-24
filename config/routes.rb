DeviseTest::Application.routes.draw do
  devise_for :company_users
  devise_for :admins

  root :to => "home#index"
  match 'secure' => "secure#index", :as => :securearea
  match 'secure' => "company#index", :as => :companyarea


end
