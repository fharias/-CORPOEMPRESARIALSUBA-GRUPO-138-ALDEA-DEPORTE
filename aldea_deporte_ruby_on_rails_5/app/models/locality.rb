class Locality < ApplicationRecord

    validates :description, presence: true, length: { minimum: 3 }

    validates_associated :headquarters

    has_many :headquarters
end
