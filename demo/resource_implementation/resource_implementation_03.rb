race=Race.upcoming.to_a.sample
entrant=race.entrants.sample
Entrant.where(id:entrant.id).pluck(:created_at, :updated_at, :secs)
# => [[2016-01-17 00:00:00 UTC, 2016-01-17 00:00:00 UTC, nil]]

response=TriResultsWS.patch("/api/races/#{race.id}/results/#{entrant.id}",:body=>{:result=>{:swim=>15.minute}}.to_json,:headers=>{"Content-Type"=>"application/json","Accept"=>"application/json"})
Entrant.where(id:entrant.id).pluck(:created_at, :updated_at, :secs)
# => [[2016-01-17 00:00:00 UTC, 2016-01-24 09:05:52 UTC, 900.0]]

response=TriResultsWS.patch("/api/races/#{race.id}/results/#{entrant.id}",:body=>{:result=>{:t1=>1.minute}}.to_json,:headers=>{"Content-Type"=>"application/json","Accept"=>"application/json"})
response=TriResultsWS.patch("/api/races/#{race.id}/results/#{entrant.id}",:body=>{:result=>{:bike=>40.minutes}}.to_json,:headers=>{"Content-Type"=>"application/json","Accept"=>"application/json"})
response=TriResultsWS.patch("/api/races/#{race.id}/results/#{entrant.id}",:body=>{:result=>{:t2=>40.seconds}}.to_json,:headers=>{"Content-Type"=>"application/json","Accept"=>"application/json"})
response=TriResultsWS.patch("/api/races/#{race.id}/results/#{entrant.id}",:body=>{:result=>{:run=>25.minutes}}.to_json,:headers=>{"Content-Type"=>"application/json","Accept"=>"application/json"})

Entrant.where(id:entrant.id).pluck(:created_at, :updated_at, :secs)
# => [[2016-01-17 00:00:00 UTC, 2016-01-24 09:08:45 UTC, 4900.0]]

response=TriResultsWS.get("/api/races/#{race.id}/results/#{entrant.id}",:headers=>{"Accept"=>"application/json"})
pp response.parsed_response
# {"place"=>nil,
# "time"=>" 1:21:40",
# ...
# "swim"=>" 0:15:00",
# "pace_100"=>"02:00",
# "t1"=>"01:00",
# "bike"=>" 0:40:00",
# "mph"=>18.0,
# "t2"=>"00:40",
# "run"=>" 0:25:00",
# "mmile"=>"00:08",
