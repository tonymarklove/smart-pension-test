RSpec.describe Weblog::Page do
  subject { described_class.new(page_path) }

  let(:page_path) { '/index' }

  it 'returns the same path it was initialized with' do
    expect(subject.path).to eq(page_path)
  end

  it 'returns 0 total visits' do
    expect(subject.total_visits).to eq(0)
  end

  it 'returns 0 unique vists' do
    expect(subject.unique_visits).to eq(0)
  end

  context 'after logging a visit' do
    before do
      subject.log_visit('126.318.035.038')
    end

    it 'returns 1 total visits' do
      expect(subject.total_visits).to eq(1)
    end

    it 'returns 1 unique vists' do
      expect(subject.unique_visits).to eq(1)
    end
  end

  context 'after logging a visit' do
    before do
      subject.log_visit('126.318.035.038')
      subject.log_visit('184.123.665.067')
      subject.log_visit('126.318.035.038')
    end

    it 'returns 3 total visits' do
      expect(subject.total_visits).to eq(3)
    end

    it 'returns 2 unique vists' do
      expect(subject.unique_visits).to eq(2)
    end
  end
end
