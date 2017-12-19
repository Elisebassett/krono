                  Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       users/sessions#new
            user_session POST   /users/sign_in(.:format)       users/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
           user_password PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
                         POST   /users/password(.:format)      devise/passwords#create
cancel_user_registration GET    /users/cancel(.:format)        users/registrations#cancel
   new_user_registration GET    /users/sign_up(.:format)       users/registrations#new
  edit_user_registration GET    /users/edit(.:format)          users/registrations#edit
       user_registration PATCH  /users(.:format)               users/registrations#update
                         PUT    /users(.:format)               users/registrations#update
                         DELETE /users(.:format)               users/registrations#destroy
                         POST   /users(.:format)               users/registrations#create
                  events GET    /events(.:format)              events#index
                         POST   /events(.:format)              events#create
               new_event GET    /events/new(.:format)          events#new
              edit_event GET    /events/:id/edit(.:format)     events#edit
                   event GET    /events/:id(.:format)          events#show
                         PATCH  /events/:id(.:format)          events#update
                         PUT    /events/:id(.:format)          events#update
                         DELETE /events/:id(.:format)          events#destroy
                   users GET    /users(.:format)               users#index
                    user GET    /users/:id(.:format)           users#show
                    root GET    /                              home#index
