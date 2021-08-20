# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
    # Include shared utils.
 include SharedUtils::Generate
 
    has_many :users, dependent: :destroy 

    validates :name, presence: true, uniqueness: true

end
