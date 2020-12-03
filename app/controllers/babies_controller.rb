class BabiesController < ApplicationController
  before_action :set_baby, only: [:show, :edit, :update, :destroy]

  def index
    @babies = Baby.all
  end
      
  def show
    @breatsfeedings = @baby.breatsfeedings
  end

  def new
    @baby = Baby.new
  end

  def edit
  end
    
  def create
    @baby = Baby.new(baby_params)

    respond_to do |format|
      if @baby.save
        format.html { redirect_to @baby, notice: 'Baby was successfully created.' }
        format.json { render :show, status: :created, location: @baby }
      else
        format.html { render :new }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @baby.update(baby_params)
        format.html { redirect_to @baby, notice: 'Baby was successfully updated.' }
        format.json { render :show, status: :ok, location: @baby }
      else
        format.html { render :edit }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @baby.destroy
    respond_to do |format|
      format.html { redirect_to babies_url, notice: 'Baby was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_baby
    @baby = Baby.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def baby_params
    params.require(:baby).permit(:name)
  end

end
