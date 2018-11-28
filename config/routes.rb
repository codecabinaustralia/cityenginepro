Rails.application.routes.draw do
namespace :api do
  namespace :v1 do
    get 'engine/location'
    get 'engine/levels'
    get 'engine/skills'
    get 'engine/people'
    get 'engine/classes'
    get 'engine/student_levels'
    get 'engine/student_skills'
    get 'engine/lesson_bookings'
  end
end
  # Data Sources
  get 'data_source/initiate_worker'
  # For Development Server
  get 'data_source/locations'
  get 'data_source/levels'
  get 'data_source/skills'
  get 'data_source/people'
  get 'data_source/classes'
  get 'data_source/student_levels'
  get 'data_source/student_skills'
  get 'data_source/lesson_bookings'

  #Sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
