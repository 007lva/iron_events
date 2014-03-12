require 'spec_helper'

feature 'Event creation' do
  
  scenario 'creating an event', driver: :selenium do
    
    visit new_event_path

    fill_in 'event_name', with: 'Evento de prueba'

    fill_in 'event_address', with: 'Madrid 28012'

    save_and_open_page

    fill_in 'event_start_at', with: '03/12/2014'

    fill_in 'event_end_at',with: '03/13/2014'
  
    sleep 5

    click_button 'Save'

    page.should have_content 'Evento de prueba'

  end

end
