class Operacio < ApplicationRecord

	belongs_to :edifici
	belongs_to :fase
	has_many :referencia_calendari_preventius

end
