class VipCode < ActiveRecord::Base
    before_save { self.code = code.downcase }
    
    type_regex = /\A(?:(winter2015)|(Winter2015)|(WINTER2015)|(WInter2015)|(WINter2015)|(wintER2015)|(winteR2015))\Z/
    
    validates :code,  :presence => true,
                   :format => { :with => type_regex }
    
    def codecheck
       if self.code == "winter2015"
       end
    end
    
end
