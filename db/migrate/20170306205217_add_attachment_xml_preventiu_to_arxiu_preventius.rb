class AddAttachmentXmlPreventiuToArxiuPreventius < ActiveRecord::Migration
  def self.up
    change_table :arxiu_preventius do |t|
      t.attachment :xml_preventiu
    end
  end

  def self.down
    remove_attachment :arxiu_preventius, :xml_preventiu
  end
end
