
class Signup < ApplicationRecord
    
    belongs_to :camper
    belongs_to :activity
    validate :time_check

    def time_check
       
        if self.time && self.time >= 0 && self.time <= 23
            self.time
        else
            errors.add(:time, 'time must be between 0 and 23')
        end
    end

end
