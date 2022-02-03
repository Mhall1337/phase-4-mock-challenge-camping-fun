class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    def index 
        signup = Signup.all
        render json: signup
    end
    def create
        signup = Signup.create!(sign_up_params)
        render json: signup, include: :activities, status: :created
    end


    private

    def sign_up_params
        params.permit(:activity_id, :camper_id, :time, :name, :difficulty)
    end
    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
end
