class Docvisit < ApplicationRecord
    validates :name, :sex, presence: true

    belongs_to :user
    belongs_to :doctor, optional: true


end 
