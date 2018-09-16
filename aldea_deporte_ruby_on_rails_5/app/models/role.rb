class Role < ApplicationRecord

    validates :name, presence: true, uniqueness: true  
    
    validates_associated :users_role
    
    has_many :users_role  
    has_many :users, through: :users_role
end
