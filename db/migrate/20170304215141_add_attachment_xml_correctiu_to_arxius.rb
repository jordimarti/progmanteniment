class AddAttachmentXmlCorrectiuToArxius < ActiveRecord::Migration
  def self.up
    change_table :arxius do |t|
      t.attachment :xml_correctiu
    end
  end

  def self.down
    remove_attachment :arxius, :xml_correctiu
  end
end
