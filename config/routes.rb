DeviseTest::Application.routes.draw do
  devise_for :admins

  root :to => "home#index"
  match 'secure' => "secure#index", :as => :securearea


end
