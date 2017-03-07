class EdificisController < ApplicationController
  before_action :set_edifici, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @edificis = Edifici.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @edifici = Edifici.new
  end

  def edit
  end

  def create
    @edifici = Edifici.new(edifici_params)
    if @edifici.save
      create_complements(@edifici.id)
      redirect_to edificis_path
    else
      render :new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edifici
      @edifici = Edifici.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edifici_params
      params.require(:edifici).permit(:user_id, :nom_edifici)
    end
end
