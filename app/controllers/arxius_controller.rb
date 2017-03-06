class ArxiusController < ApplicationController
  before_action :set_arxiu, only: [:update]

  def edit
  end

  def update
    @arxiu.update(arxiu_params)
    if @arxiu.xml_preventiu.exists?
      #if @arxiu.xml_preventiu.updated_at_changed?
        parse_file_preventiu
      #end
    end
    redirect_to operacions_path(edifici_id: @arxiu.edifici_id)
  end

  def parse_file_preventiu
    puts 'Ha entrat a parse_file_preventiu'
    tempfile = Paperclip.io_adapters.for(@arxiu.xml_preventiu)
    doc = Nokogiri::XML(tempfile)
    doc.root.elements.each do |node|
      parse_xml_preventiu(node)
    end
  end

  def parse_xml_preventiu(node)
    puts 'Ha entrat a parse_xml_preventiu'
    if node.node_name.eql? 'operacio'
      puts 'Ha entrat a crear operacio'
      operacio = Operacio.new
      operacio.edifici_id = @arxiu.edifici_id
      operacio.edifici_id = 1
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arxiu
      @arxiu = Arxiu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arxiu_params
      params.require(:arxiu).permit(:edifici_id, :xml_preventiu, :xml_correctiu, :xml_millora)
    end
end
