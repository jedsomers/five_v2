class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, only: [:destroy] 
  before_action :correct_user, only: [:edit, :update]
  before_action :manager_user, only: [:manager]


  
  def index
    #@users = User.all.order('avgrt DESC')
    @businesses = Business.locate(params[:locate]).search(params[:search]).ids
    @users = User.where(business_id: @businesses).order('avgrt DESC')
  end
  
  def manager
    @users = User.where(:business_id => (current_user.business_id))
  end
  
  def show
    @user = User.find(params[:id])
    #@score = Review.where((:reviewee_id => @user.id).average :rating)
    @avg1 = (Review.where(:reviewee => @user.id).average :rating).to_f
    @avg2 = (Review.where(:reviewee => @user.id).average :question2).to_f
    @avg3 = (Review.where(:reviewee => @user.id).average :question3).to_f
    @questionsum = @avg2 + @avg3
    @score = ((@avg1 + @avg2 + @avg3)/3 * 100)
    @question2r = @avg2/@questionsum * 100
    @question3r = @avg3/@questionsum * 100

    @user.update_attributes(:avgrt => @score)
    
    @reviewees = @user.reviewees
    @writers = @user.writers
    @writer = current_user.writers.build if logged_in?
    @feed_items = current_user.feed if logged_in?
  end
  
  def feedback
    @user = current_user
    @user.update_attributes(:avgrt => ((Review.where(:reviewee_id => @user.id).average :rating).to_f))
    @reviewees = @user.reviewees
    @writers = @user.writers
    @writer = current_user.writers.build if logged_in?
    @feed_items = current_user.feed if logged_in?
  end
  
  def new
   @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Five!"
      redirect_to howitworks_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def set_geolocation
    @user = current_user
    @user.update_attributes(:longitude => params['longitude'], :latitude => params[:latitude])
    @user.save(validate: false)
    render js: "document.location = '#{businesses_path}'"
  end
  
  def business_index
    render js: "document.location = '#{businesses_path}'"
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :age, :favorite, :hometown, :business_id, :avgrt, :manager, :password, :password_confirmation, :search, :locate, :sector, :invitation_token
      )
    end
    
    #before filters
    #confirms a logged-in user
    def logged_in_user
      unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless ((@user == current_user) || (current_user.admin?))
    end
    
    #confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
        #confirms a manager
    def manager_user
      redirect_to(root_url) unless current_user.manager?
    end
    
end
