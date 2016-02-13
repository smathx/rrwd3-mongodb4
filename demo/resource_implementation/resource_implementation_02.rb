# Mongo::Logger.logger.level = ::Logger::WARN
# conf.back_trace_limit=0
# system('clear')

race=Race.past.first
race.name
# => "Upper Tract Iron"
race.id
# => BSON::ObjectId('569a58b8e301d083c3000000')

entrant=race.entrants.first
entrant.first_name
# => "Tiesha"
entrant.last_name
# => "Beck"
entrant.id
# => BSON::ObjectId('569a58bfe301d083c30007f2')

response=TriResultsWS.get("/api/races/#{race.id}/results/#{entrant.id}",:headers=>{"Accept"=>"application/json"})
response.response
# => #<Net::HTTPOK 200 OK  readbody=true>
response.content_type
# => "application/json"
response.content_length
# => 481

pp response.parsed_response
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
# "result_url"=>
#   "http://localhost:3000/api/races/569a58b8e301d083c3000000/results/569a58bfe301d083c30007f2",
# "racer_url"=>"http://localhost:3000/api/racers/569a58bde301d083c3000647"}

race=Race.upcoming.first
entrant=race.entrants.first
response=TriResultsWS.get("/api/races/#{race.id}/results/#{entrant.id}",:headers=>{"Accept"=>"application/json"})
pp response.parsed_response
# {"place"=>nil,
# "time"=>" 0:00:00",
# "last_name"=>"Ruiz",
# "first_name"=>"Lynwood",
# "bib"=>1,
# "city"=>"Pentagon",
# "state"=>"DC",
# "gender"=>"M",
# "gender_place"=>nil,
# "group"=>"20 to 29 (M)",
# "group_place"=>nil,
# "swim"=>nil,
# "pace_100"=>nil,
# "t1"=>nil,
# "bike"=>nil,
# "mph"=>nil,
# "t2"=>nil,
# "run"=>nil,
# "mmile"=>nil,
# "result_url"=>
#   "http://localhost:3000/api/races/569a58b8e301d083c300000c/results/569a58bfe301d083c30009d2",
# "racer_url"=>"http://localhost:3000/api/racers/569a58bbe301d083c3000489"}
