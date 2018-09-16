class Headquarter < ApplicationRecord

    validates :description, presence: true, length: { minimum: 3 }
    validates :status,      presence: true, acceptance: { accept: ['Activo', 'Inactivo'] }
    validates :address,     presence: true, length: { minimum: 3 }
    validates :latitude,    presence: true, length: { minimum: 3 }
    validates :longitude,   presence: true, length: { minimum: 3 }

    validates_associated :events
    validates_associated :images

    belongs_to :locality
    has_many :events
    has_many :images_headquarter  
    has_many :images, through: :images_headquarter
end
