class Arxiu < ApplicationRecord

	belongs_to :edifici

	has_attached_file :xml_preventiu
	has_attached_file :xml_correctiu
	has_attached_file :xml_millora

	validates_attachment_content_type :xml_preventiu, :content_type => ["application/xml"]
	validates_attachment_content_type :xml_correctiu, :content_type => ["application/xml"]
	validates_attachment_content_type :xml_millora, :content_type => ["application/xml"]

end
