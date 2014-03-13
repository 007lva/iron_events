require 'spec_helper'

describe EventsController do

  describe '#index' do

    it 'displays events for today' do
      event = FactoryGirl.create(:event, start_at: Date.today)

      expect(Event).to receive(:for_today).and_call_original
      get :index

      expect(assigns(:events)).to eq([event])
      
    end

  end

  describe '#new' do

     before do
       @user = FactoryGirl.create(:user)
       sign_in @user
    end

    it 'create a new empty event' do
    
      get :new
      expect(assigns(:event)).to be_a_new(Event)

    end

  end

  describe '#create' do

    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'when create event increase the number of events' do
      #attrs = { 'name' => 'hackshow', 'start_at' => Date.new(2014,2,2), 'end_at' => Date.new(2014,2,3) }
      attrs = FactoryGirl.attributes_for(:event)
      expect{ post :create, :event => attrs }.to change(Event, :count)
      expect(response).to redirect_to(:events)
     # expect(response).to render_template(:index)
    end

  end

  describe '#index' do

    it 'index redirect to index' do
  
      get :index
      expect(response).to render_template(:index)

    end

  end

end
