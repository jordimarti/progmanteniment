class AddAttachmentXmlCorrectiuToArxiuCorrectius < ActiveRecord::Migration
  def self.up
    change_table :arxiu_correctius do |t|
      t.attachment :xml_correctiu
    end
  end

  def self.down
    remove_attachment :arxiu_correctius, :xml_correctiu
  end
end
