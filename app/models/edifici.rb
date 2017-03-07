class Edifici < ApplicationRecord

	belongs_to :user
	has_one :identificacio
	has_one :planificacio
	has_one :arxiu_preventiu
	has_one :arxiu_correctiu
	has_one :arxiu_millora
	has_many :operacions
	has_many :fases

end
