require_relative '../../lib/first/person'

RSpec.describe Person do
  let(:person) { described_class.new(first_name, last_name, education_level) }
  let(:first_name) { anything }
  let(:last_name) { anything }
  let(:education_level) { anything }

  describe '#full_name' do
    let(:full_name) { person.full_name }
    let(:first_name) { 'John' }
    let(:last_name) { 'Snow' }
    let(:education_level) { anything }

    it 'returns full name' do
      expect(full_name).to eq 'John Snow'
    end
  end

  describe '#educate!' do
    let(:educate!) { person.educate! }
    let(:first_name) { anything }
    let(:last_name) { anything }
    let(:education_level) { 2 }

    it 'increments education_level by 1' do
      expect { educate! }.to change { person.education_level }.by(1)
    end
  end

  # or...

  describe '#educate!' do
    before { person.educate! }
    let(:first_name) { anything }
    let(:last_name) { anything }
    let(:education_level) { 2 }

    it 'increments education_level by 1' do
      expect(person.education_level).to eq 3
    end
  end
end
