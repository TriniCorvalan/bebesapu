class Baby < ApplicationRecord
    
    has_many :breatsfeedings, dependent: :destroy


    def breatsfeeding_count
        self.breatsfeedings.count
        #TODO-implement
    end

    def cantidad_total
        self.breatsfeedings.sum(:cantidad)
        #TODO-implement
    end

    def to_s
        name
    end


    def cuantas_veces
        self.breatsfeedings.where(created_at.to_date == Time.now.to_date).count
    end

    def last_time
        self.breatsfeedings.last.created_at.strftime("%Y-%m-%d")
    end

    def tiempo_hoy
        self.breatsfeedings.where(created_at.to_date == Time.now.to_date).sum(:tiempo)
    end

    def cantidad_hoy
        self.breatsfeedings.where(created_at.to_date == Time.now.to_date).sum(:cantidad)
    end
 
end
