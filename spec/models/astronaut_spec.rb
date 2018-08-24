require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end
  describe 'relationships' do
    it { should have_many(:space_missions).through(:astronaut_missions) }
  end
  describe 'Class Methods' do
    it '.average_age' do
      astronaut1 = Astronaut.create!(name: 'Astro 1', age: 30, job: 'Job 1')
      astronaut2 = Astronaut.create!(name: 'Astro 2', age: 50, job: 'Job 2')

      expect(Astronaut.average_age).to eq(40)
    end
  end
end
