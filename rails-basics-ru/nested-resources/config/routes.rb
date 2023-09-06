# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  # resources :posts do
  #   resources :post_comments, only: [:create, :update, :destroy, :new]
  # end
  # resources :posts
  # scope module: :posts do
  #
  #   resources :post_comments, only: [:create, :update, :destroy, :new]
  # end
  # resources :posts
  # scope module: :posts do
  #   resources :post_comments, only: [:create, :update, :destroy, :new]
  # end
  # END
  resources :posts do
    scope module: :posts do
      resources :post_comments
    end
  end
end
