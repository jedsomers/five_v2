class InvitationsController < ApplicationController
  
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.sender = current_user
    if @invitation.save
      if logged_in?
      Mailer.deliver_invitation(@invitation, signup_url(@invitation.token))
     flash[:notice] = "Thank you, invitation sent."
     redirect_to root_url
      else 
        flash[:notice] = "Thanks for the interest! We'll send you updates soon!"
        redirect_to root_url
      end
    else
      render :action => 'new'
    end
  end
  
  
  def vipcode
    @vipcode = Object.new.to_s
    if @vipcode == "winter2015"
      redirect_to signup_path
    else
      flash[:error] = "Apologies, that doesn't appear to be the correct code"
      redirect_to vipcode_path
    end
  end
  
  private
  
  def invitation_params
    params.require(:invitation).permit(:id, :sender_id, :recipient_email, :token, :sent_at, :invitation_token)
  end

end
