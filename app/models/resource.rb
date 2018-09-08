class Resource < ApplicationRecord
  validates :title, presence: true, length: { maximum: 25 },
                                    uniqueness: { case_sensitive: false }
  validates :hourly_rate, presence: true, length: { maximum: 6 }
  validates :description, presence: true, length: { maximum: 250 }
end
