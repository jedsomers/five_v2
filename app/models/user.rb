class User < ActiveRecord::Base
    has_many :reviews
    has_many :writers, class_name: "Review", foreign_key: "writer_id"
    has_many :reviewees, class_name: "Review", foreign_key: "reviewee_id"
    belongs_to :business
    #has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
    #belongs_to :invitation
    before_create :set_invitation_limit 
    attr_accessor :remember_token, :invitation_token
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :age, numericality: true, allow_blank: true
    has_secure_password
    validates :password, length: { minimum: 6 }, allow_blank: true
    #validates_presence_of :invitation_id, :message => 'is required'
    #validates_uniqueness_of :invitation_id
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    #returns a random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    #remembers a user in the database for use in a persistent session
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    #returns true if the given token matches the digest
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    #forgets a user
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    def feed
        #this is preliminary.
        Review.where("user_id = ?", id)
    end
    
    def invitation_token
        invitation_token if invitation
    end
    
    #def invitation_token=(token)
     #   self.invitation = Invitation.find_by_token(token)
    #end
    
    private
    
    def set_invitation_limit
        self.invitation_limit = 5
    end
    
end
