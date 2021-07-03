class Docvisit < ApplicationRecord
    validates :name, :sex, presence: true
end 
