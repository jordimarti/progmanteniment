class Fase < ApplicationRecord

	belongs_to :edifici
	has_many :operacions
	has_many :derrames

end
