class ArxiuMilloresController < ApplicationController
  before_action :set_arxiu_millora, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    @arxiu_millora.update(arxiu_millora_params)
    if @arxiu_millora.xml_millora.exists?
      parse_file_millora
    end
    redirect_to operacions_path(edifici_id: @arxiu_millora.edifici_id), notice: 'Operacions de millora gravades'
  end

  def parse_file_millora
    tempfile = Paperclip.io_adapters.for(@arxiu_millora.xml_millora)
    doc = Nokogiri::XML(tempfile)
    doc.root.elements.each do |node|
      parse_xml_millora(node)
    end
  end

  def parse_xml_millora(node)
    puts 'Ha arribat a parse xml'
    if node.node_name.eql? 'proposta'
      operacio = Operacio.new
      operacio.edifici_id = @arxiu_millora.edifici_id
      node.elements.each do |node|
        operacio.descripcio_ca = node.text.to_s if node.name.eql? 'descripcio'
        operacio.descripcio_es = node.text.to_s if node.name.eql? 'descripcio'
        operacio.tipus = 'millora'
      end
      operacio.save
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
