class ReferenciaCalendariPreventiusController < ApplicationController
  before_action :set_referencia_calendari_preventiu, only: [:show, :edit, :update, :destroy]

  # GET /referencia_calendari_preventius
  # GET /referencia_calendari_preventius.json
  def index
    @referencia_calendari_preventius = ReferenciaCalendariPreventiu.all
  end

  # GET /referencia_calendari_preventius/1
  # GET /referencia_calendari_preventius/1.json
  def show
  end

  # GET /referencia_calendari_preventius/new
  def new
    @referencia_calendari_preventiu = ReferenciaCalendariPreventiu.new
  end

  # GET /referencia_calendari_preventius/1/edit
  def edit
  end

  # POST /referencia_calendari_preventius
  # POST /referencia_calendari_preventius.json
  def create
    @referencia_calendari_preventiu = ReferenciaCalendariPreventiu.new(referencia_calendari_preventiu_params)

    respond_to do |format|
      if @referencia_calendari_preventiu.save
        format.html { redirect_to @referencia_calendari_preventiu, notice: 'Referencia calendari preventiu was successfully created.' }
        format.json { render :show, status: :created, location: @referencia_calendari_preventiu }
      else
        format.html { render :new }
        format.json { render json: @referencia_calendari_preventiu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencia_calendari_preventius/1
  # PATCH/PUT /referencia_calendari_preventius/1.json
  def update
    respond_to do |format|
      if @referencia_calendari_preventiu.update(referencia_calendari_preventiu_params)
        format.html { redirect_to @referencia_calendari_preventiu, notice: 'Referencia calendari preventiu was successfully updated.' }
        format.json { render :show, status: :ok, location: @referencia_calendari_preventiu }
      else
        format.html { render :edit }
        format.json { render json: @referencia_calendari_preventiu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencia_calendari_preventius/1
  # DELETE /referencia_calendari_preventius/1.json
  def destroy
    @referencia_calendari_preventiu.destroy
    respond_to do |format|
      format.html { redirect_to referencia_calendari_preventius_url, notice: 'Referencia calendari preventiu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencia_calendari_preventiu
      @referencia_calendari_preventiu = ReferenciaCalendariPreventiu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referencia_calendari_preventiu_params
      params.require(:referencia_calendari_preventiu).permit(:edifici_id, :operacio_id, :data_any, :responsable, :sistema)
    end
end
