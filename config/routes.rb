Rails.application.routes.draw do
  post 'backlog/post_to_slack'
  post 'backlog/post_to_google_chat'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
