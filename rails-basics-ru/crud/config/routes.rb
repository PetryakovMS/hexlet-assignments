# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  # BEGIN
  get 'tasks', to: 'task#index'
  # get 'task/show'
  # get 'task/new'
  # get 'task/create'
  # get 'task/edit'
  # get 'task/update'
  # get 'task/destroy'

  resources :task, only: [:show, :new, :create, :edit, :update, :destroy]
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
