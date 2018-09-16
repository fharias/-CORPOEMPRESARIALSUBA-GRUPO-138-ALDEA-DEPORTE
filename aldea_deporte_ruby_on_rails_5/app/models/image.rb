class Image < ApplicationRecord

    validates :description, presence: true, length: { minimum: 3 }
    validates :url,     presence: true, length: { minimum: 3 }

    validates_associated :events
    validates_associated :headquarters

    has_many :images_event  
    has_many :events, through: :images_event 

    has_many :images_headquarter  
    has_many :headquarters, through: :images_headquarter 
end
