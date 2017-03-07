class OperacionsController < ApplicationController
  include CheckUser
  before_action :set_operacio, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici, only: [:index, :import, :assignacions]
  respond_to :html, :js

  def index
    check_user_edifici(params[:edifici_id])
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'llistat'
    @operacions = Operacio.where(edifici_id: params[:edifici_id]).order(created_at: :asc)
  end

  def import
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'importacio'
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

  def assignacions
    @subnavigation = true
    @submenu_actiu = 'fases'
    @operacions = Operacio.where(edifici_id: params[:edifici_id])
    fase = Fase.find(params[:fase_id])
    @nom_fase = fase.nom
  end

  def assigna
    Operacio.where(id: params[:operacio_ids]).update_all({fase_id: params[:fase_id]})
    redirect_to fases_path(edifici_id: params[:edifici_id])
  end

  private
    def set_operacio
      @operacio = Operacio.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    def operacio_params
      params.require(:operacio).permit(:edifici_id, :fase_id, :descripcio_ca, :descripcio_es, :periodicitat, :periodicitat_text_ca, :periodicitat_text_es, :tipus, :sistema, :import_obres, :import_honoraris, :import_taxes, :import_altres, :import_total)
    end
end
