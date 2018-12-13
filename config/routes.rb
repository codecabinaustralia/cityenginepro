Rails.application.routes.draw do
  get 'analyse/days_from_level_achieved'
  get 'analyse/days_between_level_achievements'
  get 'analyse/attendence_from_skill_achieved'
  get 'analyse/attendence_between_skill_achievements'
  get 'analyse/attendence_from_level_achieved'
  get 'analyse/attendence_between_level_achievements'
  get 'analyse/age_when_skill_achieved'
  get 'analyse/age_when_level_achieved'
  get 'analyse/people_site_location'
  get 'analyse/people_determine_age'
  get 'analyse/identify_teachers'
  get 'analyse/average_lessons_attended_weekly'
  get 'analyse/identify_current_student_level'
  get 'refactor/define_students'
  get 'refactor/define_parents'
  get 'refactor/define_staff'
  get 'refactor/clean_classes'
  get 'refactor/clean_lesson_bookings'
  get 'refactor/clean_people'
  get 'refactor/clean_student_levels'
  get 'refactor/clean_student_skills'
namespace :api do
  namespace :v1 do
    get 'engine/locations'
    get 'engine/levels'
    get 'engine/skills'
    get 'engine/person'
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
