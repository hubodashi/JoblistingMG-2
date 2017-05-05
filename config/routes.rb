# == Route Map
#
#                   Prefix Verb   URI Pattern                                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                      devise/sessions#destroy
#            user_password POST   /users/password(.:format)                      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                 devise/passwords#edit
#                          PATCH  /users/password(.:format)                      devise/passwords#update
#                          PUT    /users/password(.:format)                      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                        devise/registrations#cancel
#        user_registration POST   /users(.:format)                               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                          devise/registrations#edit
#                          PATCH  /users(.:format)                               devise/registrations#update
#                          PUT    /users(.:format)                               devise/registrations#update
#                          DELETE /users(.:format)                               devise/registrations#destroy
#           manger_advises GET    /manger/advises(.:format)                      manger/advises#index
#                          POST   /manger/advises(.:format)                      manger/advises#create
#        new_manger_advise GET    /manger/advises/new(.:format)                  manger/advises#new
#       edit_manger_advise GET    /manger/advises/:id/edit(.:format)             manger/advises#edit
#            manger_advise GET    /manger/advises/:id(.:format)                  manger/advises#show
#                          PATCH  /manger/advises/:id(.:format)                  manger/advises#update
#                          PUT    /manger/advises/:id(.:format)                  manger/advises#update
#                          DELETE /manger/advises/:id(.:format)                  manger/advises#destroy
#              search_jobs GET    /jobs/search(.:format)                         jobs#search
#              job_resumes GET    /jobs/:job_id/resumes(.:format)                resumes#index
#                          POST   /jobs/:job_id/resumes(.:format)                resumes#create
#           new_job_resume GET    /jobs/:job_id/resumes/new(.:format)            resumes#new
#          edit_job_resume GET    /jobs/:job_id/resumes/:id/edit(.:format)       resumes#edit
#               job_resume GET    /jobs/:job_id/resumes/:id(.:format)            resumes#show
#                          PATCH  /jobs/:job_id/resumes/:id(.:format)            resumes#update
#                          PUT    /jobs/:job_id/resumes/:id(.:format)            resumes#update
#                          DELETE /jobs/:job_id/resumes/:id(.:format)            resumes#destroy
#                     jobs GET    /jobs(.:format)                                jobs#index
#                          POST   /jobs(.:format)                                jobs#create
#                  new_job GET    /jobs/new(.:format)                            jobs#new
#                 edit_job GET    /jobs/:id/edit(.:format)                       jobs#edit
#                      job GET    /jobs/:id(.:format)                            jobs#show
#                          PATCH  /jobs/:id(.:format)                            jobs#update
#                          PUT    /jobs/:id(.:format)                            jobs#update
#                          DELETE /jobs/:id(.:format)                            jobs#destroy
#                     root GET    /                                              welcome#index
#        publish_admin_job POST   /admin/jobs/:id/publish(.:format)              admin/jobs#publish
#           hide_admin_job POST   /admin/jobs/:id/hide(.:format)                 admin/jobs#hide
#        admin_job_resumes GET    /admin/jobs/:job_id/resumes(.:format)          admin/resumes#index
#                          POST   /admin/jobs/:job_id/resumes(.:format)          admin/resumes#create
#     new_admin_job_resume GET    /admin/jobs/:job_id/resumes/new(.:format)      admin/resumes#new
#    edit_admin_job_resume GET    /admin/jobs/:job_id/resumes/:id/edit(.:format) admin/resumes#edit
#         admin_job_resume GET    /admin/jobs/:job_id/resumes/:id(.:format)      admin/resumes#show
#                          PATCH  /admin/jobs/:job_id/resumes/:id(.:format)      admin/resumes#update
#                          PUT    /admin/jobs/:job_id/resumes/:id(.:format)      admin/resumes#update
#                          DELETE /admin/jobs/:job_id/resumes/:id(.:format)      admin/resumes#destroy
#               admin_jobs GET    /admin/jobs(.:format)                          admin/jobs#index
#                          POST   /admin/jobs(.:format)                          admin/jobs#create
#            new_admin_job GET    /admin/jobs/new(.:format)                      admin/jobs#new
#           edit_admin_job GET    /admin/jobs/:id/edit(.:format)                 admin/jobs#edit
#                admin_job GET    /admin/jobs/:id(.:format)                      admin/jobs#show
#                          PATCH  /admin/jobs/:id(.:format)                      admin/jobs#update
#                          PUT    /admin/jobs/:id(.:format)                      admin/jobs#update
#                          DELETE /admin/jobs/:id(.:format)                      admin/jobs#destroy
#                  advises GET    /advises(.:format)                             advises#index
#                          POST   /advises(.:format)                             advises#create
#               new_advise GET    /advises/new(.:format)                         advises#new
#              edit_advise GET    /advises/:id/edit(.:format)                    advises#edit
#                   advise GET    /advises/:id(.:format)                         advises#show
#                          PATCH  /advises/:id(.:format)                         advises#update
#                          PUT    /advises/:id(.:format)                         advises#update
#                          DELETE /advises/:id(.:format)                         advises#destroy
#

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 namespace :manger do
  resources :advises
 end
 resources :jobs do
   collection do
    get :search
   end
   resources :resumes
 end
 root 'welcome#index'
 namespace :admin do
   resources :jobs do
    member do
     post :publish
     post :hide
   end
   resources :resumes
  end
 end
 resources :advises
end
