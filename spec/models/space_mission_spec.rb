describe SpaceMission, type: :model do
  describe 'relationships' do
    it { should have_many(:astronauts).through(:astronaut_missions) }
  end
end
