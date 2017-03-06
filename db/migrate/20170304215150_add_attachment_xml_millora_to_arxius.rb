class AddAttachmentXmlMilloraToArxius < ActiveRecord::Migration
  def self.up
    change_table :arxius do |t|
      t.attachment :xml_millora
    end
  end

  def self.down
    remove_attachment :arxius, :xml_millora
  end
end
