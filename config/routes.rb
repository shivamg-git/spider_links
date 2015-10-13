Rails.application.routes.draw do

  resources :comments , only: [:destroy]
  devise_for :users
  root to: "links#index"
  resources :links do 
  	member do 
  		put "like" 	  ,to: "links#upvote"
  		put "dislike" ,to: "links#downvote"
  	end
  	resources :comments , only: [:create, :destroy]
	end
end
