require 'spec_helper'

describe Borealis::Cluster, '#recenter!' do
  it 'creates a new color in the center of existing colors' do
    center = stub('center')
    cluster = Borealis::Cluster.new(center)
    cluster.colors << Borealis::Color.new(2, 4, 6)
    cluster.colors << Borealis::Color.new(4, 6, 8)

    cluster.recenter!

    expect(cluster.center).to eq Borealis::Color.new(3, 5, 7)
  end

  it 'empties its colors' do
    center = stub('center')
    cluster = Borealis::Cluster.new(center)
    cluster.colors << Borealis::Color.new(1, 2, 3)

    cluster.recenter!

    expect(cluster.colors).to be_empty
  end
end
