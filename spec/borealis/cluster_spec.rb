require 'spec_helper'

describe Borealis::Cluster, '#recenter!' do
  it 'returns the distance to the old center' do
    center = Borealis::Color.new(1, 2, 3)
    cluster = Borealis::Cluster.new(center)
    cluster.colors << Borealis::Color.new(2, 4, 6)
    cluster.colors << Borealis::Color.new(4, 6, 8)

    cluster.recenter!

    expected_distance = center.distance_to(cluster.center)
    expect(cluster.center).to eq Borealis::Color.new(3, 5, 7)
  end

  it 'creates a new color in the center of existing colors' do
    center = stub('center', :distance_to)
    cluster = Borealis::Cluster.new(center)
    cluster.colors << Borealis::Color.new(2, 4, 6)
    cluster.colors << Borealis::Color.new(4, 6, 8)

    cluster.recenter!

    expect(cluster.center).to eq Borealis::Color.new(3, 5, 7)
  end

  it 'empties its colors' do
    center = stub('center', :distance_to)
    cluster = Borealis::Cluster.new(center)
    cluster.colors << Borealis::Color.new(1, 2, 3)

    cluster.recenter!

    expect(cluster.colors).to be_empty
  end
end
