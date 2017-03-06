class PreventiusController < ApplicationController
  before_action :set_preventiu, only: [:show, :edit, :update, :destroy]

  def index
    @preventius = Preventiu.all
  end

  def show
  end

  def new
    @preventiu = Preventiu.new
  end

  def edit
  end

  def create
    @preventiu = Preventiu.new(preventiu_params)

    respond_to do |format|
      if @preventiu.save
        format.html { redirect_to @preventiu, notice: 'Preventiu was successfully created.' }
        format.json { render :show, status: :created, location: @preventiu }
      else
        format.html { render :new }
        format.json { render json: @preventiu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @preventiu.update(preventiu_params)
    parse_file
    rediret_to operacions_path
  end

  def parse_file
    tempfile = Paperclip.io_adapters.for(@preventiu.xml_file)
    doc = Nokogiri::XML(tempfile)
    parse_xml(doc)
  end

  def parse_xml(doc)
    doc.root.elements.each do |node|
      parse_preventius(node)
    end
  end

  def parse_preventius(node)
    if node.node_name.eql? 'edifici'
      operacio = Operacio.new
      operacio.edifici_id = @preventiu.edifici_id
      node.elements.each do |node|
        operacio.descripcio_ca = node.text.to_s if node.name.eql? 'descripcio_ca'
        operacio.descripcio_es = node.text.to_s if node.name.eql? 'descripcio_es'
        operacio.periodicitat = node.text.to_s if node.name.eql? 'periodicitat'
        operacio.periodicitat_text_ca = node.text.to_s if node.name.eql? 'periodicitat_text_ca'
        operacio.periodicitat_text_es = node.text.to_s if node.name.eql? 'periodicitat_text_es'
        operacio.tipus = 'preventiu'
      end
      operacio.save
    end
  end

  def destroy
    @preventiu.destroy
    respond_to do |format|
      format.html { redirect_to preventius_url, notice: 'Preventiu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preventiu
      @preventiu = Preventiu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preventiu_params
      params.require(:preventiu).permit(:edifici_id, :descripcio_ca, :descripcio_es, :periodicitat, :periodicitat_text_ca, :periodicitat_text_es, :document_referencia, :responsable_ca, :responsable_es, :obligatorietat, :manual_habitatge, :creat_usuari, :sistema)
    end
end
