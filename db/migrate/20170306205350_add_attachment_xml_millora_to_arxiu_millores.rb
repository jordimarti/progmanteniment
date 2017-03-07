class AddAttachmentXmlMilloraToArxiuMillores < ActiveRecord::Migration
  def self.up
    change_table :arxiu_millores do |t|
      t.attachment :xml_millora
    end
  end

  def self.down
    remove_attachment :arxiu_millores, :xml_millora
  end
end
