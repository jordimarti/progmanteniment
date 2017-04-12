class Operacio < ApplicationRecord

	belongs_to :edifici
	belongs_to :fase
	has_many :referencia_calendari_preventius

	before_save :calcula_import_total

	def calcula_import_total
		self.import_total = self.import_obres + self.import_honoraris + self.import_taxes + self.import_altres
	end

end
