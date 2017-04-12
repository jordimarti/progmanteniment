class IdentificacionsController < ApplicationController
  include CheckUser
  before_action :set_identificacio, only: [:edit, :update]
  before_action :set_edifici
  
  def edit
    @subnavigation = true
    @submenu_actiu = 'identificacio'
    check_user_edifici(@edifici.id)
  end

  def update
    respond_to do |format|
      if @identificacio.update(identificacio_params)
        format.html { redirect_to edit_identificacio_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @identificacio }
      else
        format.html { render :edit }
        format.json { render json: @identificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_identificacio
      @identificacio = Identificacio.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(@identificacio.edifici_id)
    end

    def identificacio_params
      params.require(:identificacio).permit(:edifici_id, :tipus_via, :nom_via, :numero_via, :bloc, :codi_postal, :poblacio, :provincia, :foto_facana, :regim_juridic, :tipus_identificacio_propietat, :identificacio_propietat, :nom_propietat, :cognoms_propietat, :tipus_via_propietat, :adreca_propietat, :codi_postal_propietat, :poblacio_propietat, :provincia_propietat, :telefon_propietat, :email_propietat, :tipus_identificacio_representant, :identificacio_representant, :nom_representant, :cognoms_representant, :tipus_via_representant, :adreca_representant, :codi_postal_representant, :poblacio_representant, :provincia_representant, :telefon_representant, :email_representant, :nom_tecnic, :cognoms_tecnic, :tipus_identificacio_tecnic, :identificacio_tecnic, :titulacio_tecnic, :colegi_tecnic, :num_colegiat_tecnic, :tipus_via_tecnic, :adreca_tecnic, :codi_postal_tecnic, :poblacio_tecnic, :provincia_tecnic, :telefon_tecnic, :email_tecnic)
    end
end
