require 'rails_helper'

describe 'user can view a list of all astronauts' do
  describe 'user visits /astronauts' do
    it 'displays a list of all astronauts' do
      astronaut1 = Astronaut.create!(name: 'Astro 1', age: 35, job: 'Job 1')
      astronaut2 = Astronaut.create!(name: 'Astro 2', age: 38, job: 'Job 2')

      visit astronauts_path

      expect(page).to have_content(astronaut1.name)
      expect(page).to have_content(astronaut2.name)
      expect(page).to have_content(astronaut1.age)
      expect(page).to have_content(astronaut2.age)
      expect(page).to have_content(astronaut1.job)
      expect(page).to have_content(astronaut2.job)
    end
  end
end
