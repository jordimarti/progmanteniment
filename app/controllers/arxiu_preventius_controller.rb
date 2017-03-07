class ArxiuPreventiusController < ApplicationController
  before_action :set_arxiu_preventiu, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    @arxiu_preventiu.update(arxiu_preventiu_params)
    if @arxiu_preventiu.xml_preventiu.exists?
      parse_file_preventiu
    end
    redirect_to operacions_path(edifici_id: @arxiu_preventiu.edifici_id)
  end

  def parse_file_preventiu
    tempfile = Paperclip.io_adapters.for(@arxiu_preventiu.xml_preventiu)
    doc = Nokogiri::XML(tempfile)
    doc.root.elements.each do |node|
      parse_xml_preventiu(node)
    end
  end

  def parse_xml_preventiu(node)
    if node.node_name.eql? 'operacio'
      operacio = Operacio.new
      operacio.edifici_id = @arxiu_preventiu.edifici_id
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
    def set_arxiu_preventiu
      @arxiu_preventiu = ArxiuPreventiu.find(params[:id])
    end

    def arxiu_preventiu_params
      params.require(:arxiu_preventiu).permit(:edifici_id, :xml_preventiu)
    end
end
