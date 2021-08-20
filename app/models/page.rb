class Page < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :generate_random_number_uid

  belongs_to :user
  

  validates :title, presence: true, uniqueness: true

  def to_param
  	slug
  end
end
