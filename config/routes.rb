Rails.application.routes.draw do
  root to: 'quiz#question'
  get 'quiz', to: 'quiz#question'
  post 'quiz', to: 'quiz#answer'
  resources :questions
end
