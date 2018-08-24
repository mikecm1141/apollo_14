class AstronautMission < ApplicationRecord
  belongs_to :space_mission
  belongs_to :astronaut
end
