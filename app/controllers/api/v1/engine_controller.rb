class EngineController < ApplicationController
  before_action :set_default_format
  def location
    @locations = Location.all
  end

  def levels
  end

  def skills
  end

  def people
  end

  def classes
  end

  def student_levels
  end

  def student_skills
  end

  def lesson_bookings
  end

  private

  def set_default_format
     request.format = :json
  end
  
end