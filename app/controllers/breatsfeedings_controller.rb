class BreatsfeedingsController < ApplicationController

    def index
        @breatsfeedings = Breatsfeeding.all
    end

    def new
        @breatsfeeding = Breatsfeeding.new
    end
    
    def create
        @breatsfeeding = Breatsfeeding.new(breatsfeeding_params)
        @breatsfeeding.baby = @baby
        respond_to do |format|
          if @breatsfeeding.save
            format.html { redirect_to baby_breatsfeeding_path(@baby, @breatsfeeding), notice: 'Breatsfeeing fue satisfactoriamente creado' }
          else
            format.html { render :new }
          end
        end
    end

    def show
        @breatsfeeding = Breatsfeeding.find(params[:id])    
    end


    def edit
        @breatsfeeding = Breatsfeeding.find params[:id]
    end

    def update
        @breatsfeeding = Breatsfeeding.find params[:id]
        respond_to do |format|
          if @breatsfeeding.update(breatsfeeding_params.merge(baby: @baby))
            format.html { redirect_to baby_breatsfeeding_path(@baby, @breatsfeeding), notice: 'Breatsfeeding fue satisfactoriamente actualizado.' }
          else
            format.html { render :edit }
          end
        end
    end

    def destroy
        @breatsfeeding = Breatsfeeding.find params[:id]
        @breatsfeeding.destroy
        respond_to do |format|
          format.html { redirect_to baby_breatsfeedings_url, notice: 'breatsfeeding fue satisfactoriamente destruido' }
        end
    end


    private

    def breatsfeeding_params
      params.require(:breatsfeeding).permit(:cantidad, :tiempo, :baby_id)
    end
    
    def find_baby
        @baby = Baby.find params[:baby_id]
      end
end


