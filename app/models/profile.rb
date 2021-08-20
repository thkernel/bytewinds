# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  uid          :string
#  profile_type :string
#  company_name :string
#  first_name   :string
#  last_name    :string
#  gender       :string
#  describe     :text
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
  belongs_to :user
  has_one :address, as: :addressable,  dependent: :destroy
  accepts_nested_attributes_for :address


  
  # For active storage
  has_one_attached :avatar


 validates :company_name, presence: true, uniqueness: true, if: :company?
 validates :first_name, presence: true, unless: :company?
 validates :last_name, presence: true,  unless: :company?
  
  def full_name
    
    "#{first_name} #{last_name}"
  end

 
  private
 
 def set_status
	if self.profile_type == "Prestataire" && self.status.nil?
		self.status = "Disponible"
	end
 end

 def company?
  if self.profile_type == "Agence"
    true
  else
    false
  end
end
 
end
