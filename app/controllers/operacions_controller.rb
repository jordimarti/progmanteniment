class OperacionsController < ApplicationController
  before_action :set_operacio, only: [:show, :edit, :update, :destroy]

  def index
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'llistat'
    @operacions = Operacio.where(edifici_id: params[:edifici_id])
    @edifici = Edifici.find(params[:edifici_id])
    #@arxiu_preventiu = ArxiuPreventiu.find(@edifici.arxiu_preventiu.id)
    #@arxiu_correctiu = ArxiuCorrectiu.find(@edifici.arxiu_correctiu.id)
    #@arxiu_millora = ArxiuMillora.find(@edifici.arxiu_millora.id)
  end

  def import
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'importacio'
    @edifici = Edifici.find(params[:edifici_id])
    @arxiu_preventiu = ArxiuPreventiu.find(@edifici.arxiu_preventiu.id)
    @arxiu_correctiu = ArxiuCorrectiu.find(@edifici.arxiu_correctiu.id)
    @arxiu_millora = ArxiuMillora.find(@edifici.arxiu_millora.id)
  end

  # GET /operacions/1
  # GET /operacions/1.json
  def show
  end

  # GET /operacions/new
  def new
    @operacio = Operacio.new
  end

  # GET /operacions/1/edit
  def edit
  end

  # POST /operacions
  # POST /operacions.json
  def create
    @operacio = Operacio.new(operacio_params)

    respond_to do |format|
      if @operacio.save
        format.html { redirect_to @operacio, notice: 'Operacio was successfully created.' }
        format.json { render :show, status: :created, location: @operacio }
      else
        format.html { render :new }
        format.json { render json: @operacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operacions/1
  # PATCH/PUT /operacions/1.json
  def update
    respond_to do |format|
      if @operacio.update(operacio_params)
        format.html { redirect_to @operacio, notice: 'Operacio was successfully updated.' }
        format.json { render :show, status: :ok, location: @operacio }
      else
        format.html { render :edit }
        format.json { render json: @operacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operacions/1
  # DELETE /operacions/1.json
  def destroy
    @operacio.destroy
    respond_to do |format|
      format.html { redirect_to operacions_url, notice: 'Operacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operacio
      @operacio = Operacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operacio_params
      params.require(:operacio).permit(:edifici_id, :fase_id, :descripcio_ca, :descripcio_es, :periodicitat, :periodicitat_text_ca, :periodicitat_text_es, :tipus, :sistema, :import_obres, :import_honoraris, :import_taxes, :import_altres, :import_total)
    end
end
