Rails.application.routes.draw do
  get 'quiz', to: 'quiz#question'
  post 'quiz', to: 'quiz#answer'
  resources :questions
end
