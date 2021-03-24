class Employee < ApplicationRecord
    belongs_to :dog

    def to_s
        self.first_name + " " + self.last_name
    end

    def self.get_titles
        self.all.map do |employee|
            employee.title 
        end
    end

end
