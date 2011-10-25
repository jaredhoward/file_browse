Rails.application.routes.draw do
  resources :file_browser, :only => [:index] do
    collection do
      post "tree", :constraints => lambda{|req| req.params[:dir].present? }
      get "/show", :action => "show", :constraints => lambda{|req| req.params[:file].present? }
    end
  end
end