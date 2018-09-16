class Event < ApplicationRecord

  validates :description, presence: true, length: { minimum: 3 }
  validates :date,  presence: true
  validates :age_limit,   presence: true
  validates :status,      presence: true, acceptance: { accept: ['Activo', 'Inactivo'] }

  validates_associated :images

  belongs_to :user
  belongs_to :sportcategory
  belongs_to :headquarter

  has_many :images_event  
  has_many :images, through: :images_event

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, I18n.t("my_locales.date_cannot_be_in_the_past"))
    end
  end
end
