RSpec.describe Weblog::Parser do
  subject { described_class.new(filename) }

  context "with a file that doesn't exist" do
    let(:filename) { '/dev/null/foo.1' }

    it 'raises an error' do
      expect { subject }.to raise_error(Weblog::FileNotFoundError)
    end
  end

  context "without a filename" do
    let(:filename) { nil }

    it 'raises an error' do
      expect { subject }.to raise_error(Weblog::FileNotFoundError)
    end
  end

  context "with a file" do
    let(:filename) { RspecRoot.join('support/fixtures/example.log') }

    describe '#print_total_visits' do
      let(:expected_output) do
        <<~OUTPUT
          total visits
          ------------
          /home        2 visits
          /about/2     1 visits
          /contact     1 visits
          /help_page/1 1 visits

        OUTPUT
      end

      it 'outputs the total visits' do
        expect { subject.print_total_visits }.to output(expected_output).to_stdout
      end
    end

    describe '#print_unique_visits' do
      let(:expected_output) do
        <<~OUTPUT
          unique visits
          -------------
          /about/2     1 unique views
          /home        1 unique views
          /contact     1 unique views
          /help_page/1 1 unique views

        OUTPUT
      end

      it 'outputs the unique visits' do
        expect { subject.print_unique_visits }.to output(expected_output).to_stdout
      end
    end
  end
end
