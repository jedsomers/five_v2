class BusinessesController < ApplicationController
    before_action :admin_user, only: [:new, :create, :update, :edit]
  
  
 def index
   @user = current_user
   @businesses = Business.near([current_user.latitude, current_user.longitude], 0.25)
 end
 
 def edit
  @business = Business.find(params[:id])
 end
 
 def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      flash[:success] = "Business updated"
      redirect_to @business
    else
      render 'edit'
    end
 end
 
 
  def show
  @business = Business.find(params[:id])
  @users = @business.users
  end
  
    def create
    @business = Business.new(business_params)
     if @business.save
       flash[:success] = "Business created"
       redirect_to @business
     else
       render 'new'
     end
    end
  
  def new
   @business = Business.new
  end
  
  
  
  private
  
  def business_params
   params.require(:business).permit(:name, :address, :sector, :latitude, :longitude)
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
