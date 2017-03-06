class Preventiu < ApplicationRecord

	belongs_to :edifici
	
	has_attached_file :xml_file
	
  before_update :parse_file
  
	#validates_attachment_content_type :xml_file, :content_type => ["application/xml"]
	#No estic validant perquè els arxius xml de les ITEs no tenen header i no passen la validació
	do_not_validate_attachment_file_type :xml_file

	def parse_file
    tempfile = xml_file.queued_for_write[:original]
    doc = Nokogiri::XML(tempfile)
    parse_xml(doc)
  end

  def parse_xml(doc)
    doc.root.elements.each do |node|
      parse_operacions(node)
    end
  end

  def parse_operacions(node)
    if node.name.eql? 'edifici'
      node.elements.each do |node|
        edifici_id = node.text.to_s if node.name.eql? 'edifici_id'
        if node.name.eql? 'operacio'
          node.elements.each do |node|
          	preventiu = Preventiu.new
          	preventiu.edifici_id = edifici_id
          	preventiu.descripcio_ca = node.text.to_s if node.name.eql? 'descripcio_ca'
            preventiu.descripcio_es = node.text.to_s if node.name.eql? 'descripcio_es'
            preventiu.periodicitat = node.text.to_s if node.name.eql? 'periodicitat'
            preventiu.periodicitat_text_ca = node.text.to_s if node.name.eql? 'periodicitat_text_ca'
            preventiu.periodicitat_text_es = node.text.to_s if node.name.eql? 'periodicitat_text_es'
            preventiu.document_referencia = node.text.to_s if node.name.eql? 'document_referencia'
            preventiu.responsable_ca = node.text.to_s if node.name.eql? 'responsable_ca'
            preventiu.responsable_es = node.text.to_s if node.name.eql? 'responsable_es'
            preventiu.obligatorietat = node.text.to_s if node.name.eql? 'obligatorietat'
            preventiu.manual_habitatge = node.text.to_s if node.name.eql? 'manual_habitatge'
            preventiu.creat_usuari = node.text.to_s if node.name.eql? 'creat_usuari'
            preventiu.sistema = node.text.to_s if node.name.eql? 'sistema'
          end
        end
      end
      preventiu.save
    end
  end

end
