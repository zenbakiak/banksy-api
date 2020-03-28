# frozen_string_literal: true

# This file contains api versioning constraints, maybe in the future we'll need a v2
require 'api_constraints'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:create, :show, :index]

  # root to: 'users#index'

  scope module:
        :api,
        defaults: { format: :json },
        path: '' do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: %i[create show index]

      resources :movements, only: %i[create show index]
      resources :sessions, only: :create

      root to: 'users#index'
    end
  end
end
