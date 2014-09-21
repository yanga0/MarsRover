require 'mars_rover'

describe 'MarsRover' do
  before :each do
    @rover = MarsRover.new(1, 1, 'N')
  end

  it 'should move rover around' do
    @rover.execute('MM').should == '1 3 N'
  end

  it 'should turn rover right' do
    @rover.execute('RRR').should == '1 1 W'
  end

  it 'should turn rover left' do
    @rover.execute('LLL').should == '1 1 E'
  end
end