require 'spec_helper'

describe Event do

  describe 'name' do
    it 'should not be blank' do
      event = Event.new name: nil
      expect(event).to have(1).error_on(:name)
    end

    it 'should not have error when present' do
      event = Event.new name: 'hi'
      expect(event).not_to have(1).error_on(:name)
    end

    it 'should not be longer than 60 characters' do
      event = Event.new name: 'a'*61
      expect(event).to have(1).error_on(:name)
    end
  end

  describe 'description' do
    it 'is valid when blank' do
      event = Event.new description: nil
      expect(event).to have(0).error_on(:description)
    end

    it 'is not valid when it has less than 100 characters' do
      event = Event.new description: 'a' * 99
      expect(event).to have(1).error_on(:description)
    end

    it 'is valida when it has 100 characters' do

    end
  end

  describe 'start_at' do
    it 'is not valid when start_at is blank' do
      event = Event.new start_at: nil
      expect(event).to have(1).error_on(:start_at)
    end

    it 'is not valid when end_at is blank' do
      event = Event.new end_at: nil
      expect(event).to have(1).error_on(:end_at)
    end

    it "is not valid when start_at is after end_at" do
      event = Event.new start_at: Date.new(2014,2,2), end_at: Date.new(2014,2,1)
      expect(event).to have(1).error_on(:start_at)
    end 
  end

  describe 'for_today' do
    it 'returns an event that starts today' do
      event = FactoryGirl.create(:event, start_at: DateTime.now, end_at: (DateTime.now + 1.day))
      expect(Event.for_today).to include(event)
    end
    
    it 'does not return an event that starts tomorrow' do
      event = FactoryGirl.create(:event, start_at: DateTime.now + 1.day, end_at: DateTime.now + 2.day)
    end
  end

end
