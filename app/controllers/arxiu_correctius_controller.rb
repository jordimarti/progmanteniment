class ArxiuCorrectiusController < ApplicationController
  before_action :set_arxiu_correctiu, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    @arxiu_correctiu.update(arxiu_correctiu_params)
    if @arxiu_correctiu.xml_correctiu.exists?
      parse_file_correctiu
    end
    redirect_to operacions_path(edifici_id: @arxiu_correctiu.edifici_id)
  end

  def parse_file_correctiu
    tempfile = Paperclip.io_adapters.for(@arxiu_correctiu.xml_correctiu)
    doc = Nokogiri::XML(tempfile)
    doc.root.elements.each do |node|
      parse_xml_correctiu(node)
    end
  end

  def parse_xml_correctiu(node)
    if node.node_name.eql? 'intervencio'
      puts 'Ha entrat a crear operacio'
      operacio = Operacio.new
      operacio.edifici_id = @arxiu_correctiu.edifici_id
      node.elements.each do |node|
        operacio.descripcio_ca = node.text.to_s if node.name.eql? 'descripcio'
        operacio.descripcio_es = node.text.to_s if node.name.eql? 'descripcio'
        operacio.sistema = node.text.to_s if node.name.eql? 'sistema'
        operacio.import_obres = node.text.to_s if node.name.eql? 'import_obres'
        operacio.import_honoraris = node.text.to_s if node.name.eql? 'import_honoraris'
        operacio.import_taxes = node.text.to_s if node.name.eql? 'import_taxes'
        operacio.import_altres = node.text.to_s if node.name.eql? 'import_altres'
        operacio.tipus = 'correctiu'
      end
      operacio.save
    end
  end


  private
    def set_arxiu_correctiu
      @arxiu_correctiu = ArxiuCorrectiu.find(params[:id])
    end

    def arxiu_correctiu_params
      params.require(:arxiu_correctiu).permit(:edifici_id, :xml_correctiu)
    end
end
