class AddAttachmentXmlPreventiuToArxius < ActiveRecord::Migration
  def self.up
    change_table :arxius do |t|
      t.attachment :xml_preventiu
    end
  end

  def self.down
    remove_attachment :arxius, :xml_preventiu
  end
end
