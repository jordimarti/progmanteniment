class ArxiuCorrectiu < ApplicationRecord

	belongs_to :edifici

	has_attached_file :xml_correctiu
	validates_attachment_content_type :xml_correctiu, :content_type => ["application/xml"]

end
