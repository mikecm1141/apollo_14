class SpaceMission < ApplicationRecord
  has_many :astronaut_missions
  has_many :astronauts, through: :astronaut_missions
end
