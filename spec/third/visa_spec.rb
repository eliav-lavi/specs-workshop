require_relative '../../lib/third/visa'

RSpec.describe Visa do
  let(:visa) { described_class.new(length_in_days, type) }

  describe '#business_type?' do
    let(:business_type?) { visa.business_type? }
    let(:length_in_days) { anything }

    context 'type is a business type' do
      let(:type) { described_class::OUTSTANDING_ARTIST_TYPE }

      it 'returns true' do
        expect(business_type?).to eq(true)
      end
    end

    context 'type is not a business type' do
      let(:type) { described_class::SPOUSE_TYPE }

      it 'returns false' do
        expect(business_type?).to eq(false)
      end
    end
  end

  describe '#green_card_candidate?' do
    let(:green_card_candidate?) { visa.green_card_candidate? }

    context 'type is not spouse' do
      let(:type) { described_class::OUTSTANDING_ARTIST_TYPE }
      let(:length_in_days) { anything }

      it 'returns false' do
        expect(green_card_candidate?).to eq(false)
      end
    end

    context 'type is spouse' do
      let(:type) { described_class::SPOUSE_TYPE }

      context 'length in days is positive' do
        let(:length_in_days) { 80 }

        it 'returns false' do
          expect(green_card_candidate?).to eq(false)
        end
      end

      context 'length in days is negative' do
        let(:length_in_days) { -10 }

        it 'returns true' do
          expect(green_card_candidate?).to eq(true)
        end
      end
    end
  end
end
