json.events @events do |event|
  #json.(event, :name, :address, :start_at, :end_at)
  json.name event.name
  json.adress event.name
  json.start_at event.start_at.to_i
  json.end_at event.end_at.to_i

  json.user do
    json.email (event.user ? event.user.email : '')
  end

end


