require_relative '../../lib/second/person'

RSpec.describe Person do
  let(:person) { described_class.new(first_name, last_name, education_level) }
  let(:first_name) { anything }
  let(:last_name) { anything }
  let(:education_level) { anything }

  describe '#educate!' do
    let(:educate!) { person.educate! }

    context 'education_level is lower than 3' do
      let(:education_level) { 2 }

      it 'increments education_level by 1' do
        expect { educate! }.to change { person.education_level }.from(2).to(3)
      end
    end

    context 'education_level is equal to or higher than 3' do
      let(:education_level) { 4 }

      it 'does not change education_level' do
        expect { educate! }.not_to change { person.education_level }
      end
    end
  end
end
