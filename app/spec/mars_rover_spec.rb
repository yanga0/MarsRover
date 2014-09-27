require 'mars_rover'
require_relative '../lib/position'

describe 'MarsRover' do
  before :each do
    @rover = MarsRover.new(Position.new(1, 1), 'N')
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

  it 'should circle around' do
    @rover.execute('MRMRMRMR').should == '1 1 N'
    @rover.execute('LRLRLRLR').should == '1 1 N'
  end

  it 'should reject invalid arguments' do
    expect { @rover.execute('sth. invalid') }.to raise_error(ArgumentError)
    # or RSpec 1 Syntax:
    # lambda { @rover.execute('sth. invalid') }.should raise_error(ArgumentError)
  end
end