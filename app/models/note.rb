class Note < ApplicationRecord

  validates :title, presence: true, length: { maximum: 75 }
  validates :body, presence: true, length: { maximum: 255 }
end
