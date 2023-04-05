class Restaurant < ApplicationRecord
    has_many :dishes, dependent: :destroy
    has_many :reviews, as: :reviewable
    validates :name, presence: true
    validates :name, presence: true
    validates :status, inclusion: { in: [true, false] }

    def set_status(status)
        update(status: status)
    end
    
    def set_status_with_delay(status)
        self.class.set_status_with_delay(id, status)
    end
    
    def self.set_status_with_delay(id, status)
        find(id).delay(run_at: 5.minutes.from_now).set_status(status)
    end

    def average_rating
        reviews.average(:rating)
    end
end
