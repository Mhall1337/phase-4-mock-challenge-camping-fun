class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index
        activities = Activity.all
        render json: activities
    end
    
    # def show
    #     activity = Activiy.find_by!(id: params[:id])
    #     render json: activity
    # end

    def destroy
        activity = Activity.find_by!(id: params[:id])
        activity.destroy
        head :no_content
    end

    private
     def record_not_found
        render json: {error: "Activity not found"}, status: :not_found
     end
end
