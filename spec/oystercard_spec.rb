require 'oystercard'

describe Oystercard do
    let(:topped_up_card) { Oystercard.new(20) }

    it 'has a default balance of zero' do
        expect(subject.balance).to eq 0
    end

    it 'increases balance by 20 when we top_up 20' do
        expect(topped_up_card.balance).to eq 20
    end

    it 'increases balance by 30 when we top_up 30' do
        topped_up_card.top_up(10)
        expect(topped_up_card.balance).to eq 30
    end

    it 'increases balance by 35 when we top_up 10 & 5' do
        topped_up_card.top_up(10)
        topped_up_card.top_up(5)
        expect(topped_up_card.balance).to eq 35
    end

    it 'has a balance limit of 90' do
        topped_up_card.top_up(70)
        expect{topped_up_card.top_up(1)}.to raise_error "Top up limit reached"
    end

    it 'deducts money from card' do
      expect{topped_up_card.deduct(5)}.to change{ topped_up_card.balance}.by(-5)
    end

    it 'tells us if we are on a journey' do
        expect(subject).not_to be_in_journey
    end

    it 'start our journey' do
        subject.touch_in
        expect(subject).to be_in_journey
    end

    it 'ends our journey' do
        subject.touch_out
        expect(subject).to_not be_in_journey
    end
    
end
