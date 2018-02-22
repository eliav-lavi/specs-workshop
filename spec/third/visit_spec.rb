require_relative '../../lib/third/visit'

RSpec.describe Visit do
	let(:visit) { described_class.new(visa, length_in_days, is_business_trip) }

  describe '#allowed?' do
    let(:allowed?) { visit.allowed? }

    context 'visa is of a green card candidate' do
      let(:visa) { double(:visa, green_card_candidate?: true) }
      let(:length_in_days) { anything }
      let(:is_business_trip) { anything }

      it 'returns true' do
        expect(allowed?).to eq(true)
      end
    end

    context 'visa is not of a green card candidate' do
      let(:visa) { double(:visa,
                          green_card_candidate?: false,
                          length_in_days: visa_length_in_days,
                          business_type?: visa_is_business_type?) }

      context 'declared length is higher than visa length' do
        let(:length_in_days) { 100 }
        let(:visa_length_in_days) { 50 }

        let(:is_business_trip) { anything }
        let(:visa_is_business_type?) { anything }

        it 'returns false' do
          expect(allowed?).to eq(false)
        end
      end

      context 'declared length is lower than visa length' do
        let(:length_in_days) { 100 }
        let(:visa_length_in_days) { 150 }

        context 'visit is not a business trip' do
          let(:is_business_trip) { false }
          let(:visa_is_business_type?) { anything }

          it 'returns true' do
            expect(allowed?).to eq(true)
          end
        end

        context 'visit is a business trip' do
          let(:is_business_trip) { true }

          context 'visa is of business type' do
            let(:visa_is_business_type?) { true }

            it 'returns true' do
              expect(allowed?).to eq(true)
            end
          end

          context 'visa is not of business type' do
            let(:visa_is_business_type?) { false }

            it 'returns false' do
              expect(allowed?).to eq(false)
            end
          end
        end
      end
    end
  end
end
