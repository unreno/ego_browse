Rails.application.routes.draw do
  resources :other_specifies, :only => [:show,:index]
  resources :users, :only => [:show,:index]
  resources :studies, :only => [:show,:index]
  resources :question_options, :only => [:show,:index]
  resources :questions, :only => [:show,:index]
  resources :notes, :only => [:show,:index]
  resources :matched_alters, :only => [:show,:index]
  resources :legends, :only => [:show,:index]
  resources :interviewers, :only => [:show,:index]
  resources :interviews, :only => [:show,:index]
  resources :graphs, :only => [:show,:index]
  resources :expressions, :only => [:show,:index]
  resources :answer_lists, :only => [:show,:index]
  resources :answers, :only => [:show,:index]
  resources :alters, :only => [:show,:index]
  resources :alter_prompts, :only => [:show,:index]
  resources :alter_lists, :only => [:show,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root :to => "statics#index"

end
