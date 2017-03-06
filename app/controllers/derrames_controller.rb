class DerramesController < ApplicationController
  before_action :set_derrama, only: [:show, :edit, :update, :destroy]

  # GET /derrames
  # GET /derrames.json
  def index
    @derrames = Derrama.all
  end

  # GET /derrames/1
  # GET /derrames/1.json
  def show
  end

  # GET /derrames/new
  def new
    @derrama = Derrama.new
  end

  # GET /derrames/1/edit
  def edit
  end

  # POST /derrames
  # POST /derrames.json
  def create
    @derrama = Derrama.new(derrama_params)

    respond_to do |format|
      if @derrama.save
        format.html { redirect_to @derrama, notice: 'Derrama was successfully created.' }
        format.json { render :show, status: :created, location: @derrama }
      else
        format.html { render :new }
        format.json { render json: @derrama.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /derrames/1
  # PATCH/PUT /derrames/1.json
  def update
    respond_to do |format|
      if @derrama.update(derrama_params)
        format.html { redirect_to @derrama, notice: 'Derrama was successfully updated.' }
        format.json { render :show, status: :ok, location: @derrama }
      else
        format.html { render :edit }
        format.json { render json: @derrama.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /derrames/1
  # DELETE /derrames/1.json
  def destroy
    @derrama.destroy
    respond_to do |format|
      format.html { redirect_to derrames_url, notice: 'Derrama was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derrama
      @derrama = Derrama.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derrama_params
      params.require(:derrama).permit(:edifici_id, :fase_id, :concepte, :import, :data_mes, :data_any)
    end
end
