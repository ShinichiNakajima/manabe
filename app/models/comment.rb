class Comment < ApplicationRecord
  validates :sec,      presence: true
  validates :sentence, presence: true

  belongs_to :bookmark
end
