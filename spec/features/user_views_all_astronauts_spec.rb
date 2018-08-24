require 'rails_helper'

describe 'user can view a list of all astronauts' do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: 'Astro 1', age: 30, job: 'Job 1')
    @astronaut2 = Astronaut.create!(name: 'Astro 2', age: 50, job: 'Job 2')
  end
  describe 'user visits /astronauts' do
    it 'displays a list of all astronauts' do
      visit astronauts_path

      expect(page).to have_content(@astronaut1.name)
      expect(page).to have_content(@astronaut2.name)
      expect(page).to have_content(@astronaut1.age)
      expect(page).to have_content(@astronaut2.age)
      expect(page).to have_content(@astronaut1.job)
      expect(page).to have_content(@astronaut2.job)
    end
    it 'displays average age of all astronauts' do
      visit astronauts_path

      expect(page).to have_content(Astronaut.average_age)
    end
    it 'displays list alphabetically of missions for each astronaut' do
      mission1 = @astronaut1.space_missions.create!(title: 'Apollo 1', trip_length: 10)
      mission2 = @astronaut1.space_missions.create!(title: 'Gemini 2', trip_length: 4)
      mission3 = @astronaut2.space_missions.create!(title: 'Saturn 5', trip_length: 5)
      mission4 = @astronaut2.space_missions.create!(title: 'Apollo 11', trip_length: 10)

      visit astronauts_path

      expect(page).to have_content(mission1.title)
      expect(page).to have_content(mission2.title)
      expect(page).to have_content(mission4.title)
      expect(page).to have_content(mission3.title)
    end
  end
end
