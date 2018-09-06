class Resource < ApplicationRecord
  validates :title, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 250 },
                          uniqueness: { case_sensitive: false }
end
