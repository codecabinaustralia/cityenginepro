class Api::V1::EngineController < ApplicationController
  before_action :set_default_format

  def locations
    @locations = DsLinksLocation.all
    if @locations != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No Skill Found"
      }
    end
  end

  def levels
    @levels = DsLinksLevel.all
    if @levels != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No Levels Found"
      }
    end
  end

  def skills
    @skills = DsLinksSkill.all
    if @skills != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No Skills Found"
      }
    end
  end

  def person
     @people = DsLinksPerson.all
    if @people != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No People Found"
      }
    end
  end

  def classes
    @classes = DsLinksClass.all
    if @classes != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No Classes Found"
      }
    end
  end

  def student_levels
    @student_levels = DsLinksStudentLevel.all
    if @student_levels != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No Student Levels Found"
      }
    end
  end

  def student_skills
    @student_skills = DsLinksStudentSkill.all
    if @student_skills != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No Student Skills Found"
      }
    end
  end

  def lesson_bookings
    @lesson_bookings = DsLinksLessonBooking.all
    if @lesson_bookings != nil
      respond_to do |format|
          format.json
      end
    else
      render json: {
        error: "No Lesson Bookings Found"
      }
    end
  end

  private

  def set_default_format
     request.format = :json
  end
  
end
