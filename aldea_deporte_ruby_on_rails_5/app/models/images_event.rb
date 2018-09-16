class ImagesEvent < ApplicationRecord
  belongs_to :image
  belongs_to :event
end
