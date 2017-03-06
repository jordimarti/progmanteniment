class Edifici < ApplicationRecord

	belongs_to :user
	has_one :identificacio
	has_one :planificacio
	has_one :arxiu
	has_many :operacions
	has_many :fases

end
