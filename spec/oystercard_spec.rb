require 'oystercard'

describe Oystercard do
  subject { described_class.new }
  let(:topped_up_card) { Oystercard.new(Oystercard::MAX_BALANCE) }
  let(:entry_station) { double("oxford_street") }
  let(:exit_station) { double('Sevenoaks') }

    it 'has a default balance of zero' do
        expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end

    it 'has an empty list of journeys by default' do
      expect(subject.journey_history).to be_empty
    end

  context 'Balance' do
    it 'top up balance by MIN_FARE' do
      subject.top_up(Oystercard::MIN_FARE)
      expect(subject.balance).to eq Oystercard::MIN_FARE
    end

    it 'raises error if over card limit' do
        expect{topped_up_card.top_up(Oystercard::MIN_FARE)}.to raise_error "Top up limit reached"
    end
  end

    it 'tells us if we are on a journey' do
        expect(subject).not_to be_in_journey
    end

    it 'start our journey' do
        topped_up_card.touch_in(entry_station)
        expect(topped_up_card).to be_in_journey
    end

    it 'ends our journey' do
        topped_up_card.touch_in(entry_station)
        topped_up_card.touch_out(exit_station)
        expect(topped_up_card).to_not be_in_journey
    end

    it 'raises an error when insufficent funds' do
      expect{subject.touch_in(entry_station)}.to raise_error "Insufficent funds"
    end

    it 'charges for a journey when we touch out' do
        topped_up_card.touch_in(entry_station)
        expect{topped_up_card.touch_out(exit_station)}.to change{topped_up_card.balance}.by(-Oystercard::MIN_FARE)
    end

    it 'touch_in method accepts an argument' do
        expect(topped_up_card).to respond_to(:touch_in).with(1).argument
    end

    it 'touch_in method stores station name on card' do
        entry_station = double("oxford_street")
        expect{topped_up_card.touch_in(entry_station)}.to change{topped_up_card.entry_station}.to(entry_station)
    end

    context 'when completing a journey' do
      let(:journey) { {entry_station: entry_station, exit_station: exit_station} }
      before do
        topped_up_card.touch_in(entry_station)
        topped_up_card.touch_out(exit_station)
      end
      it 'stores last journey' do
        expect(topped_up_card.last_journey).to eq journey
      end

      it 'should add a journey to the list' do
        expect(topped_up_card.journey_history).to include journey
      end
    end
end
