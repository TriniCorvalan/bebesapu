class Baby < ApplicationRecord
    has_many :breatsfeedings
    accepts_nested_attributes_for :breatsfeedings, allow_destroy: true

    def to_s
        name
    end
end
