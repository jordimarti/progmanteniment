class ArxiuMilloresController < ApplicationController
  before_action :set_arxiu_millora, only: [:show, :edit, :update, :destroy]

  # GET /arxiu_millores
  # GET /arxiu_millores.json
  def index
    @arxiu_millores = ArxiuMillora.all
  end

  # GET /arxiu_millores/1
  # GET /arxiu_millores/1.json
  def show
  end

  # GET /arxiu_millores/new
  def new
    @arxiu_millora = ArxiuMillora.new
  end

  # GET /arxiu_millores/1/edit
  def edit
  end

  # POST /arxiu_millores
  # POST /arxiu_millores.json
  def create
    @arxiu_millora = ArxiuMillora.new(arxiu_millora_params)

    respond_to do |format|
      if @arxiu_millora.save
        format.html { redirect_to @arxiu_millora, notice: 'Arxiu millora was successfully created.' }
        format.json { render :show, status: :created, location: @arxiu_millora }
      else
        format.html { render :new }
        format.json { render json: @arxiu_millora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arxiu_millores/1
  # PATCH/PUT /arxiu_millores/1.json
  def update
    respond_to do |format|
      if @arxiu_millora.update(arxiu_millora_params)
        format.html { redirect_to @arxiu_millora, notice: 'Arxiu millora was successfully updated.' }
        format.json { render :show, status: :ok, location: @arxiu_millora }
      else
        format.html { render :edit }
        format.json { render json: @arxiu_millora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arxiu_millores/1
  # DELETE /arxiu_millores/1.json
  def destroy
    @arxiu_millora.destroy
    respond_to do |format|
      format.html { redirect_to arxiu_millores_url, notice: 'Arxiu millora was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arxiu_millora
      @arxiu_millora = ArxiuMillora.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arxiu_millora_params
      params.require(:arxiu_millora).permit(:edifici_id, :xml_millora)
    end
end
