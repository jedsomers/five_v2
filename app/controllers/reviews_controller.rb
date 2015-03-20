class ReviewsController < ApplicationController
    #before_action :logged_in_user, only: [:create, :destroy]
    #before_save :compute_score
    
    def new
        @feedback = Review.new(feedback_params)
        @reviewee = current_user
        @score = ((@feedback.rating + @feedback.question2 + @feedback.questions3)/3 * 100)
        
        if @feedback.save
            @feedback.update_attributes(:score => @score)
            flash[:success] = "Submitted! Thank you for the feedback"
            redirect_to :back
        else
            flash[:danger] = "Please select a rating, comments are optional"
            redirect_to :back
        end
    end
    
    
    def create
        @writer = Review.new(review_params)
        #@user = User.find(params[:id])
        #@writer = current_user.reviews.build(review_params)
       # respond_to do |format|
        #    format.html { redirect_to @writer }
         #   format.js
    
        if @writer.save
            flash[:success] = "Submitted! Thank you for the feedback"
            redirect_to about_path
        else
            flash[:danger] = "Please select a rating for each question"
            redirect_to :back
        end
    end
    
    def destroy
    end
    
    def compute_score
    end
    
    private
    
    def review_params
        params.require(:review).permit(:content, :rating, :writer_id, :reviewee_id, :question2, :question3, :question4, :question5, :score)
    end
    
    def feedback_params
        params.require().permit(:rating, :reviewee_id, :question2, :question3, :question4, :question5)
    end
    

    
end
