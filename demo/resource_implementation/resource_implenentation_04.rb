race=Race.past.first
race.name
# => "Upper Tract Iron"
race.date
# => Mon, 20 Oct 2014

response=TriResultsWS.get("/api/races/#{race.id}",:headers=>{"Accept"=>"application/json"})
response.response
# => #<Net::HTTPOK 200 OK  readbody=true>
response.content_type
# => "application/json"
response.parsed_response
# => {"name"=>"Upper Tract Iron", "date"=>"2014-10-20"}

response=TriResultsWS.get("/api/races/#{race.id}/results",:headers=>{"Accept"=>"application/json"})
response.response
# => #<Net::HTTPOK 200 OK  readbody=true>
response.content_type
# => "application/json"
response.content_length
# => 9681
response.parsed_response.count
# => 20

pp response.parsed_response.first
# {"place"=>1,
# "time"=>"10:17:16",
# "last_name"=>"Beck",
# "first_name"=>"Tiesha",
# "bib"=>11,
# "city"=>"Ampthill",
# "state"=>"VA",
# "gender"=>"F",
# "gender_place"=>1,
# "group"=>"30 to 39 (F)",
# "group_place"=>1,
# "swim"=>" 0:57:56",
# "pace_100"=>"01:30",
# "t1"=>"00:55",
# "bike"=>" 6:35:17",
# "mph"=>17.0,
# "t2"=>"00:41",
# "run"=>" 2:42:26",
# "mmile"=>"00:06",
# "racer_url"=>"http://localhost:3000/api/racers/569a58bde301d083c3000647.json"}

race=Race.upcoming.first
response=TriResultsWS.get("/api/races/#{race.id}/results",:headers=>{"Accept"=>"application/json"})
pp response.parsed_response.first
# {"time"=>" 0:00:00",
# "last_name"=>"Ruiz",
# "first_name"=>"Lynwood",
# "bib"=>1,
# "city"=>"Pentagon",
# "state"=>"DC",
# "gender"=>"M",
# "group"=>"20 to 29 (M)",
# "racer_url"=>"http://localhost:3000/api/racers/569a58bbe301d083c3000489.json"}
