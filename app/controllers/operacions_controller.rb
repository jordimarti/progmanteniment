class OperacionsController < ApplicationController
  before_action :set_operacio, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'llistat'
    @operacions = Operacio.where(edifici_id: params[:edifici_id]).order(created_at: :asc)
    @edifici = Edifici.find(params[:edifici_id])
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

  def new
    @operacio = Operacio.new
    @operacio.edifici_id = params[:edifici_id]
  end

  def create
    @operacio = Operacio.create(operacio_params)
    @operacions = Operacio.where(edifici_id: @operacio.edifici_id).order(created_at: :asc)
  end

  def update
    @operacio.update_attributes(operacio_params)
    @operacions = Operacio.where(edifici_id: @operacio.edifici_id).order(created_at: :asc)
  end

  def destroy
    @operacions = Operacio.where(edifici_id: @operacio.edifici_id).order(created_at: :asc)
    @operacio.destroy
  end

  private
    def set_operacio
      @operacio = Operacio.find(params[:id])
    end

    def operacio_params
      params.require(:operacio).permit(:edifici_id, :fase_id, :descripcio_ca, :descripcio_es, :periodicitat, :periodicitat_text_ca, :periodicitat_text_es, :tipus, :sistema, :import_obres, :import_honoraris, :import_taxes, :import_altres, :import_total)
    end
end
