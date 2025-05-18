class MapEntry < ApplicationRecord
    validates :title, presence: true
    validates :latitude, presence: true, numericality: { greater_than_or_equal_to: 45.5, less_than_or_equal_to: 49.0 }
    validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -124.8, less_than_or_equal_to: -116.9 }
end
