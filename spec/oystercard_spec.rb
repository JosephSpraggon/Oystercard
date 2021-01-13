require 'oystercard'

describe Oystercard do
    it 'has a default balance of zero' do
        expect(subject.balance).to eq 0
    end

    it 'increases balance by 5 when we top_up 5' do
        card = Oystercard.new
        card.top_up(5)
        expect(card.balance).to eq 5
    end 

    it 'increases balance by 10 when we top_up 10' do
        card = Oystercard.new
        card.top_up(10)
        expect(card.balance).to eq 10
    end

    it 'increases balance by 15 when we top_up 10 & 5' do
        card = Oystercard.new
        card.top_up(10)
        card.top_up(5)
        expect(card.balance).to eq 15
    end

    it 'has a balance limit of 90' do
        card = Oystercard.new
        card.top_up
    end


end