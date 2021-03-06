class OperacionsController < ApplicationController
  include CheckUser
  layout "resposta_calendari", only: [:generar_calendari_activitats]
  before_action :set_operacio, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici, only: [:index, :import, :assignacions, :calendari_preventiu, :crear_calendari_preventiu, :calendari_actuacions]
  respond_to :html, :js

  def index
    check_user_edifici(params[:edifici_id])
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'llistat'
    @operacions = Operacio.where(edifici_id: params[:edifici_id]).order(created_at: :asc)
    @actuacions_preventiu = Operacio.where(edifici_id: params[:edifici_id], tipus: 'preventiu')
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

  def calendari_preventiu
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'calendari_preventiu'
    # Primer esborrem les referències existents
    referencies_calendari = ReferenciaCalendariPreventiu.where(edifici_id: @edifici.id)
    referencies_calendari.each do |ref_cal|
      ref_cal.destroy
    end
    # Ara creem les noves referències
    crear_calendari_preventiu
    @actuacions = ReferenciaCalendariPreventiu.where(:edifici_id => @edifici.id)
    @responsables = @actuacions.select(:responsable).map(&:responsable).uniq
    colors = ['#00A5E6', '#375E97', '#FB6542', '#FFBB00', '#3F681C', '#5BC8AC', '#8BE7FF', '#F18D9E', '#86AC41', '#7DA3A1', '#FF2A92', '#D58200', '#9FCD00', '#FFF57A', '#B60900', '#890085']
    @color_responsable = Hash[@responsables.zip colors]
    @any_actual = Time.now.year
    @any_final = @any_actual + 10
    @sistemes = [[t('.fonamentacio'), 'fonamentacio'], [t('.estructura_vertical'), 'estructura_vertical'], [t('.estructura_horitzontal'), 'estructura_horitzontal'], [t('.estructura_coberta'), 'estructura_coberta'], [t('.estructura_escales'), 'estructura_escales'], [t('.tancaments_verticals'), 'tancaments_verticals'], [t('.acabats_facana'), 'acabats_facana'], [t('.fusteria_exterior'), 'fusteria_exterior'], [t('.elements_adossats'), 'elements_adossats'], [t('.altres_facana'), 'altres_facana'], [t('.terrats'), 'terrats'], [t('.coberta_inclinada'), 'coberta_inclinada'], [t('.aigua'), 'aigua'], [t('.electricitat'), 'electricitat'], [t('.sanejament'), 'sanejament'], [t('.gas'), 'gas'], [t('.ascensor'), 'ascensor'], [t('.altres_instalacions'), 'altres_instalacions'], [t('.altres_subsistemes'), 'altres_subsistemes']]
  end

  def crear_calendari_preventiu
    referencies = Operacio.where(edifici_id: @edifici.id)
    any_inici = Time.now.year + 1
    any_fi = any_inici + 10
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.id)
      if operacio.periodicitat != nil && operacio.periodicitat >= 1.0
        any = referencia.data_inici_any
        while any < any_fi do
          referencia_calendari = ReferenciaCalendariPreventiu.new
          referencia_calendari.edifici_id = @edifici.id
          referencia_calendari.operacio_id = referencia.id
          referencia_calendari.data_any = any
          referencia_calendari.sistema = referencia.sistema
          referencia_calendari.responsable = referencia.responsable
          referencia_calendari.save
          any = any + operacio.periodicitat
        end
      end
      if operacio.periodicitat != nil && operacio.periodicitat < 1
        referencia_calendari = ReferenciaCalendariPreventiu.new
        referencia_calendari.edifici_id = @edifici.id
        referencia_calendari.operacio_id = referencia.id
        referencia_calendari.data_any = Time.now.year
        referencia_calendari.sistema = referencia.sistema
        referencia_calendari.responsable = referencia.responsable
        referencia_calendari.save
      end
    end
  end

  def calendari_actuacions
    @subnavigation = true
    @submenu_actiu = 'operacions'
    @operacions_menu_actiu = 'calendari_actuacions'
    #destruir_calendari_actuacions
    #crear_calendari_actuacions
    
    @referencies = ReferenciaCalendariOperacio.where(edifici_id: @edifici.id)
    
  end

  def destruir_calendari_activitats
    referencies_antigues = ReferenciaCalendariOperacio.where(edifici_id: params[:edifici_id])
    referencies_antigues.each do |ref_cal|
      ref_cal.destroy
    end
  end

  def crear_calendari_actuacions
    operacions = Operacio.where(edifici_id: @edifici.id)
    any_inici = Time.now.year
    any_fi = any_inici + 11
    operacions.each do |operacio|
      if operacio.tipus == 'preventiu'
        any = operacio.data_inici_any
        while any < any_fi do
          referencia = ReferenciaCalendariOperacio.new
          referencia.edifici_id = @edifici.id
          referencia.operacio_id = operacio.id
          referencia.descripcio = operacio.descripcio_ca
          referencia.sistema = operacio.sistema
          referencia.data_any = any
          referencia.data_mes = operacio.data_inici_mes
          referencia.save
          any += operacio.periodicitat
        end
      else
        data_inici_any = operacio.data_inici_any
        data_inici_mes = operacio.data_inici_mes
        operacio.durada_mesos.times do
          referencia = ReferenciaCalendariOperacio.new
          referencia.edifici_id = @edifici.id
          referencia.operacio_id = operacio.id
          referencia.descripcio = operacio.descripcio_ca
          referencia.sistema = operacio.sistema
          referencia.data_any = data_inici_any
          referencia.data_mes = data_inici_mes
          data_inici_mes += 1
          # Comprovem si la data canvia d'any, el mes és 13, això vol dir que el mes ha de ser 1 i l'any +1
          if data_inici_mes > 12
            data_inici_any = operacio.data_inici_any + 1
            data_inici_mes = 1
          end
          referencia.save
        end
      end
    end
  end

  def generar_calendari_activitats 
    any_solicitat = params[:any].to_i
    @edifici = Edifici.find(params[:edifici_id])
    operacions = Operacio.where(edifici_id: @edifici.id)
    any_inici = Time.now.year
    any_fi = any_inici + 11
    operacions.each do |operacio|
      if operacio.tipus == 'preventiu'
        any = operacio.data_inici_any
        any_fi = Time.now.year + 11
        while any < any_fi do
          #Passem per tots els anys, però només es genera la referència si coincideix amb l'any sol·licitat
          if any == any_solicitat
            referencia = ReferenciaCalendariOperacio.new
            referencia.edifici_id = @edifici.id
            referencia.operacio_id = operacio.id
            referencia.descripcio = operacio.descripcio_ca
            referencia.sistema = operacio.sistema
            referencia.data_any = any
            referencia.data_mes = operacio.data_inici_mes
            referencia.save
          end
          any += operacio.periodicitat
        end
      else
        data_inici_any = operacio.data_inici_any
        data_inici_mes = operacio.data_inici_mes
        operacio.durada_mesos.times do
          referencia = ReferenciaCalendariOperacio.new
          referencia.edifici_id = @edifici.id
          referencia.operacio_id = operacio.id
          referencia.descripcio = operacio.descripcio_ca
          referencia.sistema = operacio.sistema
          referencia.data_any = data_inici_any
          referencia.data_mes = data_inici_mes
          data_inici_mes += 1
          # Comprovem si la data canvia d'any, el mes és 13, això vol dir que el mes ha de ser 1 i l'any +1
          if data_inici_mes > 12
            data_inici_any = operacio.data_inici_any + 1
            data_inici_mes = 1
          end
          referencia.save
        end
      end
    end
    @referencies = ReferenciaCalendariOperacio.where(edifici_id: @edifici.id, data_any: any_solicitat)
    @any_generat = any_solicitat
  end


  private
    def set_operacio
      @operacio = Operacio.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    def operacio_params
      params.require(:operacio).permit(:edifici_id, :fase_id, :descripcio_ca, :descripcio_es, :periodicitat, :periodicitat_text_ca, :periodicitat_text_es, :tipus, :sistema, :import_obres, :import_honoraris, :import_taxes, :import_altres, :import_total, :responsable, :data_inici_any, :data_inici_mes, :durada_mesos, :persona)
    end
end
