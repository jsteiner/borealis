require 'spec_helper'

describe Borealis::KMeans do
  it 'raises if there are more clusters than colors' do
    colors = []
    3.times { colors << Borealis::Color.new(1, 2, 3) }

    expect do
      Borealis::KMeans.new(colors, number_of_clusters: 4)
    end.to raise_error 'You may not have more clusters than colors.'
  end
end

describe Borealis::KMeans, '.run' do
  it 'calls run on an instance of KMeans' do
    colors = stub('colors')
    kmeans = stub('kmeans', :run)
    Borealis::KMeans.stubs(new: kmeans)

    Borealis::KMeans.run(colors)

    expect(kmeans).to have_received(:run)
  end
end

describe Borealis::KMeans, '#run' do
  it 'sets the colors as cluster centers if there are as many colors as clusters' do
    colors = []
    3.times { colors << stub('color') }

    clusters = Borealis::KMeans.new(colors, number_of_clusters: 3).run

    expect(clusters.map(&:center)).to eq colors
  end

  it 'returns number_of_clusters clusters' do
    colors = []
    20.times { |index| colors << Borealis::Color.new(index, index * 2, index * 3) }

    clusters = Borealis::KMeans.new(colors, number_of_clusters: 8).run

    expect(clusters.length).to eq 8
  end
end
