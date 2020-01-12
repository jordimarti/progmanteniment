class EdificisController < ApplicationController
  before_action :set_edifici, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @edificis = Edifici.where(user_id: current_user.id).order(created_at: :desc)
    @edificis_editor = Edifici.where(editor_nif: current_user.nif).order(created_at: :desc)
  end

  def new
    @edifici = Edifici.new
  end

  def edit
  end

  def create
    @edifici = Edifici.new(edifici_params)
    if current_user.role == 'cambra'
      @edifici.creador = 'cambra'
    end
    respond_to do |format|
      if @edifici.save
        #Aquí creem els objectes complementaris a l'edifici (dades_edifici, checklist...)
        create_complements(@edifici.id)

        if current_user.role == 'cambra'
          format.html { redirect_to edificis_path }
        else
          format.html { redirect_to validar_dades_path(edifici_id: @edifici.id) }
          format.json { render :show, status: :created, location: @edifici }
        end
      else
        format.html { render :new }
        format.json { render json: @edifici.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @edifici.update(edifici_params)
    redirect_to edificis_path
  end

  def destroy
    @edifici.destroy
    redirect_to edificis_url
  end

  def create_complements(edifici_id)
    #Identificacio
    @identificacio = Identificacio.new
    @identificacio.edifici_id = edifici_id
    @identificacio.save
    #Planificacio
    @planificacio = Planificacio.new
    @planificacio.edifici_id = edifici_id
    @planificacio.fons_propis = 0
    @planificacio.subvencions_solicitades = 0
    @planificacio.subvencions_atorgades = 0
    @planificacio.import_financar = 0
    @planificacio.save
    #Arxiu preventiu
    @arxiu_preventiu = ArxiuPreventiu.new
    @arxiu_preventiu.edifici_id = edifici_id
    @arxiu_preventiu.save
    #Arxiu correctiu
    @arxiu_correctiu = ArxiuCorrectiu.new
    @arxiu_correctiu.edifici_id = edifici_id
    @arxiu_correctiu.save
    #Arxiu millora
    @arxiu_millora = ArxiuMillora.new
    @arxiu_millora.edifici_id = edifici_id
    @arxiu_millora.save
  end

  def vista_pdf
    @edifici = Edifici.find(params[:edifici_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edifici
      @edifici = Edifici.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edifici_params
      params.require(:edifici).permit(:user_id, :nom_edifici, :ref_cadastral, :creador, :editor_correu, :editor_nif)
    end
end
