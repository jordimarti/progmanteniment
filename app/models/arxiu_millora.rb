class ArxiuMillora < ApplicationRecord

	belongs_to :edifici

	has_attached_file :xml_millora
	validates_attachment_content_type :xml_millora, :content_type => ["application/xml"]

end
