class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, :description, :image_url, :badge_type, presence: true
  validates :addition, presence: true, if: :type_with_addition?

  scope :remaining_badges, ->(user) { where.not(id: user.badges.ids) }

  TYPES = %i[first_attempt all_category all_level].freeze

  def type_with_addition?
    badge_type != 'first_attempt'
  end
end
