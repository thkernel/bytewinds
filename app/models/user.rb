# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  login                  :string
#  role_id                :bigint
#  uid                    :string
#  status                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  #include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  

  

 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#,:confirmable, :lockable, :timeoutable, :trackable
         #:omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  # Relationships
  has_one :profile, dependent: :destroy
  belongs_to :role
  
  
 
  has_many :pages, dependent: :destroy
  

  # Add nested attributes for profile.
  accepts_nested_attributes_for :profile

  # Validations
  #validates :login, presence: true, uniqueness: true
  #validates :identifier, presence: true, uniqueness: true

  def self.find_user_by_slug(slug)
    where("slug = ? ", "#{slug}")
  end

  def superuser?
    if self.role.name == "superuser"
      true 
    else
      false
    end
  end

  def user?
    if self.role.name == "user"
      true 
    else
      false
    end
  end

  def admin?
    if self.role.name == "administrateur"
      true 
    else
      false
    end
  end
  
  private 
	
	def random_uid 
		begin
			self.uid = SecureRandom.hex(32)
		end while User.where(uid: self.uid).exists?
  end 

  def set_default_role

    unless self.role_id.present?
      role = Role.find_by(name: "user")
      self.role_id = role.id
    end
  end
  

  


  
 
end
