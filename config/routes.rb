Rails.application.routes.draw do
  # Store Objects from FE
  namespace :api do
    namespace :v1 do
      post "/store", to: "storage#create"
    end
  end
end
