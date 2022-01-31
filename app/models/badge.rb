class Badge < ApplicationRecord
  enum badge_type: %i[first_attempt all_category all_level]

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :description, :image_url, :badge_type, presence: true
  validates :addition, presence: true, unless: :first_attempt?

  scope :remaining_badges, ->(user) { where.not(id: user.badges.ids) }
end
