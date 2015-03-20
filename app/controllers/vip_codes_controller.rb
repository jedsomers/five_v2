class VipCodesController < ApplicationController
    
    def new
    @vipcode = VipCode.new
    end
    
    def create
    @vipcode = VipCode.new(vip_code_params)
    if @vipcode.save
        flash[:success] = "Excited to have you joining FIVE!"
        redirect_to signup_path
    else
        #flash[:notice] = "Apologies, that doesn't look like the right code"
        redirect_to vipcode_path
    end
    end

    
    private
    
    def vip_code_params
      params.require(:vip_code).permit(:id, :code)
    end
end


 