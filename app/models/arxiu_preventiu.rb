class ArxiuPreventiu < ApplicationRecord

	belongs_to :edifici

	has_attached_file :xml_preventiu
	validates_attachment_content_type :xml_preventiu, :content_type => ["application/xml"]

end
