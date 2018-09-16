class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name,   presence: true, length: { minimum: 3 }
  validates :first_name,  presence: true, length: { minimum: 3 }
  validates :last_name,   presence: true, length: { minimum: 3 }
  validates_presence_of     :birthday, :date_cannot_be_in_the_future
  
  validates_associated :users_role
  validates_associated :events

  has_many :users_role  
  has_many :roles, through: :users_role  
  has_many :events 

  def date_cannot_be_in_the_future 
    if birthday.present? && birthday > Date.today
      errors.add(:birthday, I18n.t("my_locales.date_cannot_be_in_the_future"))
    end
  end
end
