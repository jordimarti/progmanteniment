class ReferenciaCalendariOperacionsController < ApplicationController
  before_action :set_referencia_calendari_operacio, only: [:show, :edit, :update, :destroy]

  # GET /referencia_calendari_operacions
  # GET /referencia_calendari_operacions.json
  def index
    @referencia_calendari_operacions = ReferenciaCalendariOperacio.all
  end

  # GET /referencia_calendari_operacions/1
  # GET /referencia_calendari_operacions/1.json
  def show
  end

  # GET /referencia_calendari_operacions/new
  def new
    @referencia_calendari_operacio = ReferenciaCalendariOperacio.new
  end

  # GET /referencia_calendari_operacions/1/edit
  def edit
  end

  # POST /referencia_calendari_operacions
  # POST /referencia_calendari_operacions.json
  def create
    @referencia_calendari_operacio = ReferenciaCalendariOperacio.new(referencia_calendari_operacio_params)

    respond_to do |format|
      if @referencia_calendari_operacio.save
        format.html { redirect_to @referencia_calendari_operacio, notice: 'Referencia calendari operacio was successfully created.' }
        format.json { render :show, status: :created, location: @referencia_calendari_operacio }
      else
        format.html { render :new }
        format.json { render json: @referencia_calendari_operacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencia_calendari_operacions/1
  # PATCH/PUT /referencia_calendari_operacions/1.json
  def update
    respond_to do |format|
      if @referencia_calendari_operacio.update(referencia_calendari_operacio_params)
        format.html { redirect_to @referencia_calendari_operacio, notice: 'Referencia calendari operacio was successfully updated.' }
        format.json { render :show, status: :ok, location: @referencia_calendari_operacio }
      else
        format.html { render :edit }
        format.json { render json: @referencia_calendari_operacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencia_calendari_operacions/1
  # DELETE /referencia_calendari_operacions/1.json
  def destroy
    @referencia_calendari_operacio.destroy
    respond_to do |format|
      format.html { redirect_to referencia_calendari_operacions_url, notice: 'Referencia calendari operacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencia_calendari_operacio
      @referencia_calendari_operacio = ReferenciaCalendariOperacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referencia_calendari_operacio_params
      params.require(:referencia_calendari_operacio).permit(:edifici_id, :operacio_id, :descripcio, :sistema, :data_any, :data_mes)
    end
end
