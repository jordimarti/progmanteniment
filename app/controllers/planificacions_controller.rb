class PlanificacionsController < ApplicationController
  before_action :set_planificacio, only: [:show, :edit, :update, :destroy]

  # GET /planificacions
  # GET /planificacions.json
  def index
    @planificacions = Planificacio.all
  end

  # GET /planificacions/1
  # GET /planificacions/1.json
  def show
  end

  # GET /planificacions/new
  def new
    @planificacio = Planificacio.new
  end

  # GET /planificacions/1/edit
  def edit
  end

  # POST /planificacions
  # POST /planificacions.json
  def create
    @planificacio = Planificacio.new(planificacio_params)

    respond_to do |format|
      if @planificacio.save
        format.html { redirect_to @planificacio, notice: 'Planificacio was successfully created.' }
        format.json { render :show, status: :created, location: @planificacio }
      else
        format.html { render :new }
        format.json { render json: @planificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planificacions/1
  # PATCH/PUT /planificacions/1.json
  def update
    respond_to do |format|
      if @planificacio.update(planificacio_params)
        format.html { redirect_to @planificacio, notice: 'Planificacio was successfully updated.' }
        format.json { render :show, status: :ok, location: @planificacio }
      else
        format.html { render :edit }
        format.json { render json: @planificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planificacions/1
  # DELETE /planificacions/1.json
  def destroy
    @planificacio.destroy
    respond_to do |format|
      format.html { redirect_to planificacions_url, notice: 'Planificacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planificacio
      @planificacio = Planificacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planificacio_params
      params.require(:planificacio).permit(:edifici_id, :fons_propis, :subvencions_solicitades, :subvencions_atorgades, :import_financar, :forma_financar)
    end
end
