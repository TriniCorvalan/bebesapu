class BreatsfeedingsController < ApplicationController
  before_action :set_breatsfeedings, only: [:show, :edit, :update, :destroy]

  def index
      @breatsfeedings = Breatsfeeding.all
  end


  def show
    @breatsfeeding = Breatsfeeding.find(params[:id])
  end


  def new
    @breatsfeeding = Breatsfeeding.new
    @babies = Baby.all
  end
    
  def edit
    @babies = Baby.all
  end

  
  def create
    @breatsfeeding = Breatsfeeding.new(breatsfeeding_params)
    @babies = Baby.all

    respond_to do |format|
      if @breatsfeeding.save
        format.html { redirect_to @breatsfeeding, notice: 'Breastfeeing was successfully created.' }
        format.json { render :show, status: :created, location: @breatsfeeding }
      else
        format.html { render :new }
        format.json { render json: @breatsfeeding.errors, status: :unprocessable_entity }
      end
    end
  end
  


  def update
    respond_to do |format|
      if @breatsfeeding.update(breatsfeeding_params)
        format.html { redirect_to @breatsfeeding, notice: 'Breastfeeding was successfully updated.' }
        format.json { render :show, status: :ok, location: @breatsfeeding }
      else
        format.html { render :edit }
        format.json { render json: @breatsfeeding.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @breatsfeeding.destroy
    respond_to do |format|
      format.html { redirect_to breatsfeedings_url, notice: 'Breastfeeding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_breatsfeedings
    @breatsfeeding = Breatsfeeding.find(params[:id])
  end

  def breatsfeeding_params
    params.require(:breatsfeeding).permit(:cantidad, :tiempo, :baby_id)
  end
end


