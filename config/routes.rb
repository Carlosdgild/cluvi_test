# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :links, only: %w[create] do
        collection do
          get "/:short_code" => "links#show"
        end
      end
    end
  end

  match "*unmatched_route_error", to: "api#raise_no_matching_route!", via: :all
end
