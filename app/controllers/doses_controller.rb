class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  # GET /doses
  # GET /doses.json
  def index
    @doses = Dose.all
  end

  # GET /doses/1
  # GET /doses/1.json
  def show
  end

  # GET /doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # POST /doses
  # POST /doses.json
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end


  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_path, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
