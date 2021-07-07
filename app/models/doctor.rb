class Doctor < ApplicationRecord
    has_many :docvisits
    has_many :users, :through => :docvisits
end
