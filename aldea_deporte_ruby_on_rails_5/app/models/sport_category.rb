class SportCategory < ApplicationRecord
    
    validates :description, presence: true, uniqueness: true  
    
    validates_associated :events

    has_many :events
end
