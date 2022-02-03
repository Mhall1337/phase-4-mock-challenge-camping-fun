class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups
    validates :name, presence: true
    validate :age_check
    
    def age_check
        if self.age >= 8 && self.age <= 18
            self.age
        else
            errors.add(:age, 'age must be between 8 & 18')
        end
    end
end
