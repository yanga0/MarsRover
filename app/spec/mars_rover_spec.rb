require 'mars_rover'

describe 'MarsRover' do
  before :each do
    @rover = MarsRover.new(1, 1, 'N')
  end

  it 'should move rover around' do
    @rover.execute('MM').should == '1 3 N'
  end
end