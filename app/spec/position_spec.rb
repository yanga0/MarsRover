require_relative '../lib/position'

describe 'Position' do
  it 'should be transisted to correct string' do
    expect(Position.new(2, 4).to_s).to eq('2 4')
  end
end