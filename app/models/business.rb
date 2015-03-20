class Business < ActiveRecord::Base
    has_many :users
    validates :name, presence: true, length: { maximum: 75 }
    validates :address, presence: true
    validates_uniqueness_of :name, scope: [:longitude, :latitude]
    geocoded_by :address
    after_validation :geocode
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode  # auto-fetch address
    
def self.search(search)
    if search
      where('sector LIKE ?', "%#{search}%")
    else
     where('sector LIKE ?', "Salon")
    end
  end
  
  def self.locate(locate)
    if locate
      Business.near("%#{locate}%", 30, :order => false)
    else
      Business.near('Moscow Russia', 30, :order => false)
    end
  end
    
end
